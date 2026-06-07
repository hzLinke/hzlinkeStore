<template>
  <div class="form-container">
      <div class="win-body">
          <LkxUploadImgs 
              class="upload-image"
              :multiple="true"
              :compress="true"
              :before-read="beforeRead"
              :after-read="afterRead"
              :before-remove="beforeRemove"
              :maxSize="maxSize"
              :limit="limit"
              :type="type"
              @change="change"
              @preview="preview"
              @exceed="exceed"
              @oversize="oversize"
              :files="files"
          >
          </LkxUploadImgs>
          <div class="upload-view">
              <LkxUploadImgs 
                  :files="viewsFiles"
                  :after-read="afterRead1"
                  @dbClick="onDblclick"
              ></LkxUploadImgs>
          </div>

          <div class="preview-bg" v-show="isPreview" z-index="99999999999999999" @click="closePreview">
              <div class="dialog" z-index="9999999999999999" @click="closePreview">
                  <img :src="previewIMG" class="preview-img">
              </div>
          </div>
      </div>
      <div class="win-action">
          <button class="modal-button" @click="handleCancel">取消</button>
          <button class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
      </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, getCurrentInstance } from "vue";
import {LkxUploadImgs} from '@v4x/ui'
import type { UploadImgsFileItem } from '@v4x/ui'
import commonParam from '@/config'
import { MessageBox,  ModalResultEnum } from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import $api from '@/request/api';
import { UploadProductImageOptions } from './types'

defineOptions({
    name: 'WinUploadProductImage'
})

const props = withDefaults(defineProps<UploadProductImageOptions>(), {
    title: "",
    width: 800,
    height: 400,
    billNumber: '',
    productCode: '',
    productName: '',
    fileNames: '',
})

const parentInstance = getCurrentInstance()?.parent

const fileNamesArr = [] as any;
const fieldNamesList = props.fileNames ? props.fileNames.split(';') : [];
for (let i = 0; i < fieldNamesList.length; i++) {
    fileNamesArr.push({
        name: fieldNamesList[i],
        url: `${commonParam.$picSrc}${commonParam.$appid}/product/${fieldNamesList[i]}`
    })
}
const files = ref(fileNamesArr);
const viewsFiles = ref([] as any[])
const maxSize = ref(1024 * 1024 * 2); // 2M
const previewIMG = ref('');
const limit = ref(3);
const isPreview = ref(false);
const type = ref(2) // 0 预览模式 1 列表模式 2 预览模式 + 上传按钮

const oversize = (file: any) => {
    MessageBox.warning({ title: '出错', content: '文件大小不能大于2M', showCancel: false })
};

const afterRead = (file: any, newFiles: any) => {
    files.value.push(file[0] as any);
    uploadImage(newFiles, props.billNumber, props.productCode)
};
const afterRead1 = (file: any, newFiles: any) => {
    console.log('a', file)
};
const beforeRemove = async (index: number, file: any) => {
    const res = await deleteImage(file.name, props.productCode)
    files.value.splice(index, 1)
    return true
};

const preview = (index: number, file: { url: string; }) => {
    previewIMG.value = file.url
    isPreview.value = true
};

const exceed = () => {
    alert(`只能上传${limit.value}张图片`)
};

const beforeRead = (files: string | any[]) => {
    for (let i = 0, len = files.length; i < len; i++) {
        const file = files[i]
        if (file.type != 'image/jpeg' && file.type != 'image/png') {
            alert('只能上传jpg和png格式的图片')
            return false
        }
    }

    return true
};

const closePreview = () => {
    isPreview.value = false
}
const change = (nfiles: UploadImgsFileItem[]) => {
    console.log('b', files.value)
}
const uploadImage = async (file: any, billnumber: string, productCode: string) => {
    MessageBox.loading({ moreText: '正在上传...' })
    const upLoadFiles = file;
    const uploadParam = {
        files: upLoadFiles,
        path: `${commonParam.$picSrc}${commonParam.$appid}/product`,
        fileNames: Object.keys(upLoadFiles)
    }
    console.log(uploadParam)
    const res = await $api.uploadFile(commonParam.$http + 'controller/commonApi/UploadImage/index.php', uploadParam)
    setTimeout(() => {
        MessageBox.closeAllLoading()
    }, 500)
}
const uploadImageFromViews = async (file_Url: string) => {
    MessageBox.loading({ moreText: '正在上传...' })
    const _Name = `${props.productCode}-${Date.now()}.jpg`;
    const uploadParam = {
        file_Url: file_Url,
        file_Path: `${commonParam.$picSrc}${commonParam.$appid}/product/`,
        file_Name: _Name
    }
    const res = await $api.comonRequest('/masterApi/disApi/basic/product/', 'downImageFile', uploadParam)
    files.value.push({ url: file_Url, name: _Name })
    setTimeout(() => {
        MessageBox.closeAllLoading()
    }, 500)
}
const deleteImage = async (fileName: any, productCode: string) => {
    MessageBox.loading({ moreText: '正在删除...' })
    const deleteParam = {
        FileName: `${commonParam.$picSrc}${commonParam.$appid}/product/${fileName}`,
        path: `${commonParam.$picSrc}${commonParam.$appid}/product/`,
    }
    const res = await $api.comonRequest(commonParam.$http + 'controller/commonApi/DeleteImage/index.php', '', deleteParam, true)
    setTimeout(() => {
        MessageBox.closeAllLoading()
    }, 500)
}
const handleConfirm = () => {
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: files.value })
}
const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
const getImage = async () => {
    const res = await $api.comonRequest('/masterApi/disApi/basic/product/', 'getBaiDuImage', { name: props.productName })
    res.datas.forEach((item: any) => {
        const f = { url: item.url };
        viewsFiles.value.push(f);
    })
}
const onDblclick = (data: any) => {
    if (files.value.length >= 3) return;
    uploadImageFromViews(data.url)
}

onMounted(() => {
    getImage()
})
</script>
<style lang="scss" scoped>
.form-container {
    display: flex;
    flex-direction: column;
    height: 100%;
    .win-body {
        flex: 1;
        min-height: 0;
        display: flex;
        .upload-image {
            width: 340px;
            border-right: 1px solid #eee;
        }
        .upload-view {
            flex: 1;
            height: 100%;
            overflow: auto;
        }
        .preview-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .5);
            overflow: auto;
            z-index: 99999999999999999;
        }
        .dialog img {
            display: block;
            margin: auto;
            margin-top: 10vh;
        }
    }
    .win-action {
        height: 40px;
        flex-shrink: 0;
        padding: 5px 16px;
        border-top: 1px solid #e4e7ed;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
        .modal-button {
            line-height: 1em;
            font-size: 14px;
            padding: 8px 20px;
            border: 1px solid #dcdfe6;
            outline: none;
            display: inline-block;
            border-radius: 4px;
            cursor: pointer;
            background-color: #fff;
            transition: 0.1s;
            &:hover {
                color: #409eff;
                border-color: #c6e2ff;
                background-color: #ecf5ff;
            }
            & + & {
                margin-left: 10px;
            }
            &-primary {
                background-color: #2d8cf0;
                border-color: #2d8cf0;
                color: white;
                &:hover {
                    background: #66b1ff;
                    border-color: #66b1ff;
                    color: #fff;
                }
            }
        }
    }
}
</style>