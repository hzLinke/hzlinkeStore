<!-- eslint-disable max-len -->
<template>
  <div class="vue-upload-imgs" :class="disabled ? 'vue-upload-disabled' : ''">
    <template v-if="type == 1">
      <label :for="id" class="upload-label-upload">{{ label }}</label>
      <slot></slot>
      <div class="upload-main-list">
        <div class="upload-div-img-list" v-for="(item, index) in files" v-show="item" :key="index">
          <div class="upload-list-img-container">
            <img :src="item.url">
          </div>
          <span class="upload-list-span">{{ item.name }}</span>
          <span class="lkx-icon lkx-icon-clear" @click="remove(index)"></span>
        </div>
      </div>
    </template>

    <template v-else>
      <slot></slot>
      <div class="upload-main">
        <div class="upload-div-img" v-for="(item, index) in files" v-show="item" :key="index" @click="preview(index)" @dblclick="dbClick(item)">
          <img :src="item.url">
          <div class="upload-bg-img">
            <span v-if="type !== 0" class="lkx-icon lkx-icon-clear" @click.stop="remove(index)"></span>
          </div>
        </div>
        <label class="upload-div-add-img" :for="id" v-show="!(limit !== 0 && limit == files.length) && type !== 0">
          <span class="lkx-icon lkx-icon-add"></span>
        </label>
      </div>
    </template>

    <input ref="vueUploadImg" :disabled="disabled" type="file" :id="id" :accept="access" hidden @change="fileChangeHandler" :multiple="multiple">
  </div>
</template>

<script setup  lang="ts" name="LkxUploadImgs">
import { ref, computed } from 'vue'
import type { UploadImgsFileItem,UploadImgsOptions } from './types'


const props = withDefaults(defineProps<UploadImgsOptions>(),{
  disabled: false,
  type: 0,
  access: 'image/*',
  label: '点击上传',
  limit: 0,
  maxSize: undefined,
  multiple: false,
  compress: false,
  quality: 0.8,
  beforeRead: undefined,
  afterRead: undefined,
  beforeRemove: undefined,
  files: () => [],
  imageList: () => [],
})

const files = computed(() => props.files || props.imageList || [])
const limit = computed(() => props.limitCount ?? props.limit ?? 0)
const maxSize = computed(() => props.limitSize ?? props.maxSize ?? undefined)

const emit = defineEmits<{
  (e: 'change', value: UploadImgsFileItem[]): void
  (e: 'update:files', value: UploadImgsFileItem[]): void
  (e: 'preview', index: number, file: UploadImgsFileItem): void
  (e: 'oversize', file: File): void
  (e: 'exceed'): void
  (e: 'dbClick', file: UploadImgsFileItem): void
  (e: 'picChange', files: UploadImgsFileItem[]): void
  (e: 'picDelete', index: number): void
  (e: 'update:imageList', value: UploadImgsFileItem[]): void
  (e: 'after-read', files: UploadImgsFileItem[], newFiles: File[]): void
}>()

const vueUploadImg = ref<HTMLInputElement | null>(null)

const id = 'file' + Math.random().toString(16).slice(-13).replace(/\./g, '')

// 移除图片
const remove = (index: number) => {
  if (props.disabled) return
  if (props.beforeRemove && !props.beforeRemove(index, files.value[index])) return
  const newFiles = files.value.slice()
  newFiles.splice(index, 1)
  emit('change', newFiles)
  emit('update:files', newFiles)
  emit('update:imageList', newFiles)
  emit('picDelete', index)
}

// 预览图片
const preview = (index: number) => {
  emit('preview', index, files.value[index])
}

// 文件改变处理
const fileChangeHandler = (e: Event) => {
  const target = e.target as HTMLInputElement
  const newFiles = target.files
  if (!newFiles) return

  if (props.beforeRead && !props.beforeRead(Array.from(newFiles))) {
    if (vueUploadImg.value) {
      vueUploadImg.value.value = ''
    }
    return
  }

  if (!verify(files.value.length + newFiles.length)) return
  readFiles(newFiles)
}

// 读取文件
const readFiles = (newFiles: FileList) => {
  let canvas: HTMLCanvasElement | null = null
  let ctx: CanvasRenderingContext2D | null = null
  if (props.compress) {
    canvas = document.createElement('canvas')
    ctx = canvas.getContext('2d')
  }

  const oldFiles = [...files.value]
  const result: UploadImgsFileItem[] = []
  const len = newFiles.length

  for (let i = 0; i < len; i++) {
    const file = newFiles[i]
    if (file.type.includes('image')) {
      const reader = new FileReader()
      reader.onload = (res) => {
        const fileResult = res.target?.result as string
        if (!props.compress) {
          fileLoaded(file, fileResult, result, len, oldFiles, newFiles)
        } else {
          const img = new Image()
          img.onload = () => {
            const w = img.width
            const h = img.height
            if (canvas && ctx) {
              canvas.setAttribute('width', w.toString())
              canvas.setAttribute('height', h.toString())
              ctx.drawImage(img, 0, 0, w, h)
              const base64 = canvas.toDataURL(file.type, props.quality)
              fileLoaded(file, base64, result, len, oldFiles, newFiles)
            }
          }

          img.src = fileResult
        }
      }

      reader.readAsDataURL(file)
    }
  }
}

// 文件加载完成
const fileLoaded = (
  file: File,
  content: string,
  result: UploadImgsFileItem[],
  len: number,
  oldFiles: UploadImgsFileItem[],
  newFiles: FileList
) => {
  if (maxSize.value !== null && isOverSize(file)) {
    emit('oversize', file)
    return
  }

  result.push({
    name: file.name,
    url: content,
    type: file.type,
    size: file.size,
  })
  if (len === result.length) {
    emit('change', oldFiles.concat(result))
    emit('update:files', oldFiles.concat(result))
    emit('update:imageList', oldFiles.concat(result))
    emit('picChange', oldFiles.concat(result))
    props.afterRead && props.afterRead(result, Array.from(newFiles))
    if (vueUploadImg.value) {
      vueUploadImg.value.value = ''
    }
  }
}

// 检查文件大小
const isOverSize = (file: File) => {
  return maxSize.value !== undefined && file.size > maxSize.value
}

// 验证文件数量
const verify = (len: number) => {
  if (/^\d+$/.test(limit.value.toString()) && limit.value !== 0) {
    if (limit.value < len) {
      emit('exceed')
      return false
    }
  }

  return true
}

// 双击处理
const dbClick = (data: UploadImgsFileItem) => {
  emit('dbClick', data)
}
</script>

<style lang="scss" scoped>
.vue-upload-imgs {
  .upload-label-upload {
    border-radius: 5px;
    font-size: 16px;
    padding: 6px 26px;
    background: #3594f2;
    color: #fff;
    font-weight: normal;
    cursor: pointer;
    display: inline-block;
  }

  .upload-main {
    font-size: 0;
    padding: 10px;
  }

  .upload-div-add-img,
  .upload-div-img {
    min-width: 148px;
    width: 148px;
    height: 148px;
    border-radius: 6px;
    border: 1px solid #c0ccda;
    overflow: hidden;
    position: relative;
    margin-right: 6px;
    margin-top: 5px;
    transition: opacity .3s;
    display: inline-block;
    font-size: 14px;
  }

  .upload-div-add-img {
    background-color: #fbfdff;
    border-style: dashed;
    cursor: pointer;
  }

  .upload-div-add-img .lkx-icon {
    font-size: 28px;
    color: #8c939d;
    font-weight: normal;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    user-select: none;
  }

  .upload-div-img img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .upload-div-img .lkx-icon {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #fff;
    z-index: 1;
    cursor: pointer;
    font-size: 20px;
    user-select: none;
  }

  .upload-div-img .icon-icon-test {
    left: 40%;
  }

  .upload-div-img .icon-shanchu1 {
    left: 60%;
  }

  .upload-bg-img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, .5);
    display: none;
  }

  .upload-div-img:hover {
    opacity: .8;
  }

  .upload-div-img:hover .upload-bg-img {
    display: block;
  }

  .upload-div-img-list {
    margin-top: 10px;
    border: 1px solid #c0ccda;
    padding: 8px;
    box-sizing: border-box;
    width: 212px;
    border-radius: 5px;
  }

  .upload-div-img-list .icon-shanchu {
    margin-left: 10px;
    cursor: pointer;
    color: #8c939d;
  }

  .upload-list-img-container {
    width: 50px;
    overflow: hidden;
    border-radius: 3px;
    border: 1px solid #c0ccda;
  }

  .upload-list-img-container img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .upload-list-img-container,
  .upload-list-span {
    display: inline-block;
    line-height: 50px;
    height: 50px;
    font-size: 14px;
    vertical-align: top;
  }

  .upload-list-span {
    width: 100px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .vue-upload-disabled .upload-label-upload {
    background-color: #F5F7FA;
    border-color: #E4E7ED;
    color: #C0C4CC;
    cursor: not-allowed;
  }

  .vue-upload-disabled .upload-div-add-img {
    cursor: not-allowed;
  }

  .vue-upload-disabled .icon-shanchu,
  .vue-upload-disabled .icon-shanchu1 {
    cursor: not-allowed;
  }
}
</style>
