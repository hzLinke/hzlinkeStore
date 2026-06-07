<template>
  <LkxModal :config="config" :datas="rowData" :rowIndex="rowIndex" @close="(config as any).handleClose">
    <div class="form">
      <WeightScreen
        :weight="scaleWeight"
        :status="scaleStatus"
        :linkStatus="linkeStatus"
        @disableSerial="handleDisableSerial"
      />
      <div class="op-body">
        <div class="info-body">
          <div class="dataList">
            <div class="dataList-left">
              <img :src="ImgUrl" :alt="rowData.name" @error="handleImgError" />
            </div>
            <div class="dataList-center">
              <div class="dataList-title lk-title lk-ellipsis">
                {{ rowData.name + (rowData.note ? `【${rowData.note}】` : '') }}
              </div>
              <div class="dataList-spec lk-h5 lk-ellipsis">规格：{{ rowData.spec || '/' }}</div>
              <div class="dataList-at lk-h5 lk-ellipsis">送货日：{{ rowData.deliveryat }}</div>
            </div>
            <div class="dataList-right">
              <div class="dataList-stock lk-ellipsis">{{ rowData.productcode }}#</div>
              <div class="dataList-saleType lk-h5 lk-ellipsis">{{ saleTypeText }}</div>
              <div class="dataList-saleType lk-h5 lk-ellipsis">{{ rowData.customershortname }}</div>
            </div>
          </div>
          <div class="action-body">
            <div class="from-body">
              <div class="from-inf">商品来源</div>
              <div class="from-list" v-for="(item, index) in rowData.stockFrom" :key="index">
                <div class="from-list-name lkx-ellipsis">{{ item.shippername }}</div>
                <div class="from-list-num lkx-ellipsis">{{ formatFrom(item) }}</div>
                <div class="from-list-note lkx-ellipsis">{{ item.note }}</div>
              </div>
            </div>
            <div class="input-body">
              <div class="dataList-saleType lk-h5 lk-ellipsis">{{ rest ? '重配货' : '' }}</div>
              <div class="order-num lk-h5 lk-ellipsis">应配数量：{{ orderNumberText }}</div>
              <label class="dis-num-label">
                配货数量：
                <input
                  ref="InputNumEx"
                  readonly
                  class="no-keyboard"
                  v-model="disNum"
                  @keypress="handleKeypress"
                />
                {{ disUnit }}
              </label>
            </div>
          </div>
        </div>
        <div class="keyboard-body">
          <KeyBoard class="keyBoard" @KeyBoardInput="handleKeyBoardInput" @KeyBoardClose="handleKeyBoardClose" />
        </div>
      </div>
    </div>
  </LkxModal>
</template>
  
  <script setup lang="ts">
import { ref, computed, nextTick, onMounted, onUnmounted } from 'vue'
import { LkxModal } from '@v4x/ui'
import WeightScreen from './weightScreen/index.vue'
import KeyBoard from './keyboard/index.vue'
import $Utils from '@v4x/utils/lkxUtil'
import $api from '@/request/api.js'
import commonParam from '@/config'
const errorImage = new URL('@/assets/errorImage.jpg', import.meta.url).href

defineOptions({ name: 'PayResWin' })

// ============ Props ============
const props = withDefaults(defineProps<{
  rest?: boolean
  datas?: any
  rowIndex?: number
  EnabledWeighing?: boolean
  config?: object
}>(), {
  rest: false,
  datas: () => ({ num: 0 }),
  rowIndex: -1,
  EnabledWeighing: false,
  config: () => ({}) as any
})

// ============ Constants ============
const SERIAL_CONFIG = {
  splitChar: ';',
  restulDataLength: 5,
  unit: 'kg',
  decimal: 3
}

const SALE_TYPE_MAP: Record<number, string> = {
  0: '称重',
  1: '按量',
  2: '称重+量',
  3: '按量'
}

// ============ Refs ============
const InputNumEx = ref<HTMLInputElement | null>(null)
const scaleWeight = ref(0)
const scaleStatus = ref([0, 0, 0, 0])
const linkeStatus = ref(-1)
const disNum = ref(0)
const rowData = ref<any>({})
const done = ref(false)
const FInterval = ref<ReturnType<typeof setInterval>>()
const isDisableSerial = ref(false)
let isMounted = false

// ============ 初始化 ============
const initializeData = () => {
  rowData.value = { ...props.datas }
  if (props.rest) {
    rowData.value.owenumex = rowData.value.ordernum
  }
  disNum.value = rowData.value.owenumex
}

// ============ 工具函数 ============
const insertAtNthFromLast = (str: string, char: string, n: number): string => {
  const arr = str.split('')
  arr.splice(arr.length - n, 0, char)
  return arr.join('')
}

// ============ 串口操作 ============
const handleSerialData = (data: string) => {
  if (!data || !data.trim() || ['\r', '\n'].includes(data.trim())) return

  try {
    const dataArr = data
      .split(SERIAL_CONFIG.splitChar)
      .map(item => item.replace(/\r\n/g, '').trim())
      .filter(item => item.length >= SERIAL_CONFIG.restulDataLength)

    if (dataArr.length > 2) {
      const weightStr = insertAtNthFromLast(dataArr[dataArr.length - 2], '.', SERIAL_CONFIG.decimal)
      scaleWeight.value = +weightStr * (SERIAL_CONFIG.unit === 'kg' ? 2 : 1)
      disNum.value = scaleWeight.value
    }
  } catch (error) {
    console.error('数据处理出错：', error)
  }
}

const readSerial = async () => {

  if (isDisableSerial.value) return

  try {
    const res = await $api.getScaleInfo('', { Command: 'Query' })
    linkeStatus.value = +res.errCode

    if (!res.errCode) {
      linkeStatus.value = 1001
      return
    }
    handleSerialData(res.datas)
  } catch (error) {
    linkeStatus.value = 1001
  }
  
  
}

// ============ 计算属性 ============
const saleTypeText = computed(() => SALE_TYPE_MAP[+props.datas.saletype] || '')

const orderNumberText = computed(() => {
  const { saletype, num, downunit, numex, owenumex, unit } = rowData.value
  return +saletype === 2
    ? `${$Utils.clearDecimal(num)}${downunit}/${$Utils.clearDecimal(numex)}${unit}`
    : `${$Utils.clearDecimal(owenumex)}${downunit}`
})

const disUnit = computed(() => {
  const { saletype, unit, downunit } = rowData.value
  return +saletype === 2 ? unit : downunit
})

const formatFrom = (item: any) => {
  const isMixed = +item.saletype === 2
  const numStr = $Utils.clearDecimal(item.numex) + item.unit
  return isMixed
    ? `${$Utils.clearDecimal(item.num)}${item.downunit}/${numStr}`
    : numStr
}

const handleImgError = (e: Event) => {
  const img = e.target as HTMLImageElement
  img.src = errorImage
  img.onerror = null
}

const ImgUrl = computed(() => {
  const baseUrl = `https://www.hzlinke.com.cn/LinkeServiceSystem/upImage/${commonParam.$linkname}/product/`
  const fallback = new URL('@/assets/errorImage.jpg', import.meta.url).href
  return $Utils.getfirstImg(baseUrl, rowData.value.picsrc, fallback) || ''
})

// ============ 事件处理 ============
const handleKeypress = (e: KeyboardEvent) => {
  if (e.key === 'Enter') {
    handleKeyBoardClose('Confirm')
  }
}

const handleKeyBoardInput = (data: string) => {
  disNum.value = +data
}

const handleKeyBoardClose = (action: 'Cancel' | 'Confirm' | 'Reset') => {
  done.value = true
  const actions: Record<string, string> = {
    Cancel: 'mrCancel',
    Confirm: 'mrOk',
    Reset: 'mrReset'
  }

  if (action === 'Confirm' && disNum.value <= 0) return

  ;(props.config as any).handleClose({
    type: actions[action],
    thisDisNum: disNum.value
  })
}

const handleDisableSerial = (value: boolean) => {
  isDisableSerial.value = value
  if (value) {
    scaleWeight.value = 0
    linkeStatus.value = -1
  }
}

// ============ 生命周期 ============
onMounted(async () => {
  isMounted = true
  initializeData()
  if (!props.EnabledWeighing) {
    linkeStatus.value = -1
    return
  }

  if (props.EnabledWeighing && +rowData.value.saletype !== 1) {
    await readSerial()
    if (!isMounted) return
    FInterval.value = setInterval(readSerial, 800)
  }

  nextTick(() => InputNumEx.value?.select())
})

onUnmounted(() => {
  isMounted = false
  if (FInterval.value) clearInterval(FInterval.value)
})
</script>
  
  <style lang="scss" scoped>
.form {
  display: flex;
  flex-direction: column;
}

.lk-title {
  font-size: 30px;
  color: black;
}

.lk-h5 {
  padding: 5px 10px;
  font-size: 20px;
  color: #8f8f94;
}

.lk-ellipsis {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.dataList-saleType {
  color: red;
}

.dataList {
  display: flex;
  position: relative;
  padding: 2px;
  margin: 5px 0;

  &:after {
    position: absolute;
    right: 5px;
    bottom: -2px;
    left: 15px;
    height: 1px;
    content: '';
    background-color: #c8c7cc;
  }

  &-left {
    width: 100px;

    img {
      width: 100px;
      height: 100px;
    }
  }

  &-center {
    flex: 1;

    .dataList-title {
      padding: 8px 0 0 5px;
    }

    .dataList-customer {
      padding-left: 4px;
    }
  }

  &-right {
    width: 200px;
    text-align: right;

    .dataList-stock {
      padding: 10px;
      font-size: 20px;
      color: #8f8f94;
    }

    .dataList-num {
      padding: 5px 10px;
      font-size: 20px;
      color: #8f8f94;

      &:before {
        content: 'x ';
        font-size: 8px;
      }
    }
  }
}

.op-body {
  display: flex;
  border-top: 1px solid #bbb;

  .info-body {
    flex: 1;
    position: relative;
    overflow: hidden;

    .action-body {
      display: flex;
      flex-direction: row;
      position: relative;
      margin-top: 2px;

      .from-body {
        flex: 1;
        display: flex;
        flex-direction: column;

        .from-inf {
          height: 30px;
          line-height: 30px;
          border-bottom: 1px solid #bbb;
        }

        .from-list {
          display: flex;
          flex-direction: row;
          padding-top: 3px;

          &-name {
            flex: 1;
          }

          &-num {
            width: 100px;
            text-align: right;
          }

          &-note {
            width: 50px;
            text-align: right;
          }
        }
      }

      .input-body {
        width: 240px;
        padding: 10px;
        display: flex;
        text-align: right;
        flex-direction: column;

        .order-num {
          margin-top: 40px;
        }

        .dis-num-label {
          input {
            margin-top: 10px;
            height: 40px;
            width: 120px;
            text-align: right;
            font-size: 20px;
            outline-color: blue;
          }
        }
      }
    }
  }

  .keyboard-body {
    width: 300px;

    .keyBoard {
      margin-top: 10px;
    }
  }
}

.no-keyboard {
  pointer-events: none;
}
</style>