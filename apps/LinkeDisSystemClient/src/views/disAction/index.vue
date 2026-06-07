<template>
  <div class="win" ref="WinBox" @keydown="handleKeyDown" :tabindex="1" @click="detialVisabled = false">
    <div class="win-hearder">
      <LkxInput class="Input-DeliveryAt" :config="deliveryAtState.config" v-model="deliveryAt" />
      <label class="label">
        <input class="radio" v-model="disType" type="radio" :value="0">按客户
      </label>
      <label class="label">
        <input class="radio" v-model="disType" type="radio" :value="1">按分类
      </label>
      <label class="label">
        <input class="radio" v-model="disType" type="radio" :value="2">按货商
      </label>
      <label class="label">
        <input class="radio" v-model="disType" type="radio" :value="3">清点录入
      </label>
      <label class="label">
        <input class="radio" v-model="disType" type="radio" :value="4">缺货列表
      </label>
      <button class="applay-button" @click="handleApplay">应用</button>
      <label class="label">
        <input class="radio" v-model="isShowFinsh" type="checkbox">显示完成
      </label>
      <label class="label">
        <input class="radio" v-model="printLabel" type="checkbox">打印标签
      </label>
      <label class="label" style="padding-left: 20px;" @click="toggleFullScreen">F11全屏切换</label>
    </div>
    <div class="win-body">
      <div class="Cate-item-body" v-if="detialVisabled" @click.stop="">
        <div class="action" v-if="allowedMergeSubmit">
          <label>一键配货只针对非称重商品</label>
          <button @click="mergeSubmit(detailDataSource.dataSet)">一键配货</button>
        </div>
        <div class="productList">
          <ProductGrid
            class="productGrid"
            v-for="(rowItem, rowIndex) in detailDataSource.dataSet"
            :key="rowIndex"
            :itemData="rowItem"
            :disType="disType"
            @itemClick="handleDetailDisClick(rowItem, rowIndex)"
          />
        </div>
      </div>
      <div class="win-body-left">
        <div class="empty" v-if="dataSource.dataSet.length === 0">^-^没有配货数据^-^</div>
        <div class="grid-body" v-for="(ArrItem, ArrIndex) in dataSource.dataSet" :key="ArrIndex">
          <div class="groupInfo">{{ getTitleInf(ArrItem) }}</div>
          <div class="item-body">
            <ProductGrid
              class="productGrid"
              v-for="(Item, ItemIndex) in ArrItem.children"
              :key="ItemIndex"
              :itemData="Item"
              :disType="disType"
              @itemClick="handleDisClick(Item, Number(ArrIndex), Number(ItemIndex))"
            />
          </div>
        </div>
      </div>
      <div class="win-body-right">
        <div class="all-button">
          <button @click="listSelectedIndex = -1; openData(disType)">全部</button>
        </div>
        <div class="item-body">
          <div
            class="item"
            :class="{ active: listSelectedIndex === index }"
            v-for="(item, index) in rightDataList"
            :key="index"
            @click="handleListClick(item, Number(index))"
          >
            {{ item.name }}
          </div>
        </div>
      </div>
    </div>
  </div>
  <DisWin
    v-if="disWinState.config.open"
    :rest="restDis"
    :datas="disWinState.datas"
    :config="disWinState.config"
    :EnabledWeighing="EnabledWeighing"
  />
</template>
<script setup lang="ts">
import { reactive, ref, computed, watch, nextTick, onMounted, onUnmounted, inject } from 'vue'
import type { CommondDatasParamType } from '@v4x/ui'
import $Utils from '@v4x/utils/lkxUtil'
import { InputOptionsType, LkxInput, MessageBox, ModalResultEnum } from '@v4x/ui'
import DisWin from './disWin/index.vue'
import ProductGrid from './ProductGrid/ProductGrid.vue'
import { TDataSource } from "@/usehook/dataSource"
import { TCustomerGridAction } from "./action"
import $api from '@/request/api'
import commonParam from '@/config'
import { getCommonDatas } from '@/usehook/getCommonDatas'
import { exitFullscreen, fullscreen } from "@/views/toolsBarAction"

defineOptions({ name: 'disAction' })

// ============ 常量定义 ============
const thisH = $Utils.getDatePart('h')
const _loginDatas = JSON.parse(sessionStorage.getItem('loginDatas') || '{}')
const UserCode = _loginDatas.idcode

// ============ DOM引用 ============
const WinBox = ref<HTMLElement | null>(null)

// ============ 响应式数据 ============
const commonDatas = ref<CommondDatasParamType>({} as CommondDatasParamType)
const deliveryAt = ref($Utils.getDate('d', 0))
const disType = ref(0)
const listSelectedIndex = ref(-1)
const detialVisabled = ref(false)
const isShowFinsh = ref(true)
const printLabel = ref(true)
const arrMainIndex = ref(-1)
const arrSubIndex = ref(-1)
const detailIndex = ref(-1)
const EnabledWeighing = ref(false)
const restDis = ref(false)
const forceOver = ref(false)
const thisItem = ref<any>({})
const thisParentItem = ref<any>({})
const detailDataIsChange = ref(false)
const rightDataList = ref<any[]>([])

// ============ 计算属性 ============
const allowedMergeSubmit = computed(() => {
  const uncompleted = detailDataSource.dataSet.filter((item: any) => +item.distributionstatus < 2)
  return uncompleted.length > 0 && +uncompleted[0].saletype === 1
})

// ============ DataSource 配置 ============
const createDataSource = () => new TDataSource({
  ApiPath: '/masterApi/disApi/dis/disDisTribution/',
  KeyFieldName: 'ProductCode',
  NotAllowOperationList: [],
  getParmars: {}
})

const dataSource = reactive(createDataSource())
const detailDataSource = reactive(createDataSource())

// ============ 弹窗状态 ============
const disWinState = reactive({
  datas: {},
  config: {
    open: false,
    title: disType.value === 3 ? '清点录入' :'称重配货',
    width: '830px',
    hideFooter: true,
    handleClose: async (data: any) => {
      disWinState.config.open = false
      if (data.type === 'mrOk') {
        submit(thisItem.value, data.thisDisNum)
      } else {
        restDis.value = false
      }
    }
  }
})

// ============ GridAction ============
const gridAction = reactive(new TCustomerGridAction(dataSource, {} as CommondDatasParamType))

// ============ 日期输入配置 ============
const deliveryAtState = ref<InputOptionsType>({
  config: {
    caption: '送货日期',
    captionWidth: 80,
    align: 'left',
    captionAlign: 'right',
    inputType: 'datetime' as const,
    format: 'yyyy-MM-dd',
    onChange: (data: any) => {
      localStorage.setItem('DeliveryAt', data)
      openData(disType.value)
    }
  }
})

// ============ 初始化 DataSource 参数 ============
dataSource.getParams.extraData = 'none'
dataSource.getParams.sortFields = 'DisAt,customerCode,productcode'
dataSource.getParams.condition = `deliveryAt='${deliveryAt.value}'`
gridAction.getParams = {
  procName: 'sp_build_DisAction_FromCustomer',
  procParmars: { DeliveryAt: deliveryAt.value, Condition: '' }
}

// ============ 工具函数 ============
const getTitleInf = (item: any) => {
  switch (disType.value) {
    case 0: {
      const customer = commonDatas.value.CustomerDatas
      const name = $Utils.getValueFromArray(customer, 'idcode', 'name', item.customercode)
      const selfCode = $Utils.getValueFromArray(customer, 'idcode', 'selfcode', item.customercode)
      const deliveryAt = $Utils.getValueFromArray(customer, 'idcode', 'deliveryat', item.customercode)
      return `【${selfCode}】${name}  送货时间：${deliveryAt}`
    }
    case 1: 
    case 3: 
    case 4:{
      const name = $Utils.getValueFromArray(commonDatas.value.CateDatas, 'idcode', 'name', item.catecode)
      return `【${item.catecode}】${name}`
    }
    case 2: {
      const name = +item.shippercode === 0 ? '存货' : $Utils.getValueFromArray(commonDatas.value.ShipperDatas, 'idcode', 'name', item.shippercode)
      return `【${item.shippercode}】${name}`
    }
    default:
      return ''
  }
}

/** 获取当日要配货的客户、货商、分类 */
const getRigthDatas = () => {
  const result: any[] = []
  const getName = (dataSet: any[], codeField: string, dataList: any[]) => {
    return dataSet.map(item => ({
      idcode: item[codeField],
      name: +item[codeField] === 0 && disType.value === 2
        ? '存货'
        : $Utils.getValueFromArray(dataList, 'idcode', 'name', item[codeField])
    }))
  }

  switch (disType.value) {
    case 0:
      return getName(dataSource.dataSet, 'customercode', commonDatas.value.CustomerDatas)
    case 1:
    case 3:
    case 4:
      return getName(dataSource.dataSet, 'catecode', commonDatas.value.CateDatas)
    case 2:
      return getName(dataSource.dataSet, 'shippercode', commonDatas.value.ShipperDatas)
    default:
      return result
  }
}

// format函数在模板中未使用，如需使用请取消注释
// const format = (rowItem: TableRowDataType, cellItem: TableColumnsType, fieldName: string) => {
//   return typeof cellItem.customFormater === 'function'
//     ? cellItem.customFormater(rowItem[fieldName], rowItem)
//     : rowItem[fieldName]
// }

// ============ 数据加载函数 ============
const getProcParams = (type: number, condition: string) => {
  const procNames: Record<number, string> = {
    0: 'sp_build_DisAction_FromCustomer',
    1: 'sp_build_DisAction_FromCate',
    2: 'sp_build_DisAction_FromShipper',
    3: 'sp_build_DisData_CheckStock',
    4: 'sp_build_DisAction_FromCate',
  }
  return {
    procName: procNames[type],
    procParmars: { DeliveryAt: deliveryAt.value, Condition: condition }
  }
}

/** 打开对应货商或分类明细数据 */
const openDetailData = (condition: string = '', fromType: string = '') => {
  detailDataSource.close()
  detailDataSource.getParams.extraData = fromType
  detailDataSource.getParams.condition = condition
  detailDataSource.open({ pageSize: 0, curPage: 1, total: 0 })
}

/** 打开主数据 */
const openData = (type: number, condition: string = '') => {
  if (detialVisabled.value) return
  gridAction.getParams = getProcParams(type, condition)
  //缺货表时直接不显示完成的部分
  gridAction.open(type === 4 ? false: isShowFinsh.value).then(() => {
    if (!condition) rightDataList.value = getRigthDatas()
  })
}

/** 重新打开数据 */
const restOpenData = async (disType: number, condition: string = '', fromType: string = '') => {
  if (disType === 10) {
    return gridAction.restOpen(disType, {
      pageSize: 0,
      curPage: 1,
      total: 0,
      KeyFieldName: 'productcode',
      extraData: fromType,
      condition: condition
    })
  }
  return gridAction.restOpen(disType, getProcParams(disType, condition))
}

// ============ 事件处理 ============
const getConditionByType = (idcode: number) => {
  switch (disType.value) {
    case 0: return idcode !== 0 ? `customerCode = ${idcode}` : ''
    case 1: 
    case 4:return `cateCode = ${idcode}`
    case 2: return `shipperCode = ${idcode}`
    default: return ''
  }
}

const handleListClick = (item: any, rowIndex: number) => {
  listSelectedIndex.value = rowIndex
  openData(disType.value, getConditionByType(item.idcode))
}

const handleApplay = () => openData(disType.value)

/** 处理配货弹窗确认 */
const handleDistributionConfirm = async (data: any, isDetail: boolean) => {
  const status = +data.distributionstatus

  if (status === 2) {
    const res = await MessageBox.question({
        title: '提问',
        content: '配货完成商品，请选择操作类型！！',
        showAbort: true,
        abortText: '重配货',
        confirmText:'打标签'
    })
    if ([ModalResultEnum.mrCancel, ModalResultEnum.mrClose].includes(res.action)) return false
    if (res.action === ModalResultEnum.mrConfirm) {
      handlePrint(data)
      return false
    }
    restDis.value = true
  }

  if (status === 1) {
    const res = await MessageBox.question({
      title: '提问',
      content: '部分配货商品，请选择操作类型！！',
      showAbort: true,
      abortText: '强制完成',
      confirmText: '继续配货'
    })
    if ([ModalResultEnum.mrCancel, ModalResultEnum.mrClose].includes(res.action)) return false
    if (res.action === ModalResultEnum.mrAbort) {
      forceOver.value = true
      submit(thisItem.value, 0)
      return false
    }
  }
  return true
}

/** 打开称重弹窗 */
const openDisWin = async (data: any) => {
  if (+commonDatas.value.SysParamDatas[0].disshowfrom === 1 && disType.value !== 3) {
    const res = await gridAction.setFrom(data)
    data.stockFrom = res.From
    data.stock = res.Stock
  }
  setTimeout(() => {
    disWinState.config.open = true
    disWinState.datas = data
  }, 100)
}

const handleDisClick = async (data: any, arrIndex: number, itemIndex: number) => {
  arrSubIndex.value = itemIndex
  arrMainIndex.value = arrIndex
  thisParentItem.value = data
  thisItem.value = data
  if (disType.value === 4) {
    return 
  }
  if (disType.value === 0 ) {
    const canContinue = await handleDistributionConfirm(data, false)
    if (!canContinue) return
  }

  // 非按客户配货 -> 打开对应分类或供货商商品
  if (disType.value !== 0 && disType.value !== 3) {
    let condition = `DeliveryAt = '${deliveryAt.value}' and ProductCode = ${data.productcode} and SaleType = ${data.saletype}`
    if (!isShowFinsh.value) condition += ' and distributionstatus<2'
    if (disType.value === 2) {
      condition += ` and ShipperCode = ${data.shippercode}`
    }
    detialVisabled.value = true
    openDetailData(condition, disType.value === 2 ? 'FromShipper' : 'FromCate')
    return
  }

  await openDisWin(data)
}

const handleDetailDisClick = async (data: any, index: number) => {
  detailIndex.value = index
  thisItem.value = data

  const canContinue = await handleDistributionConfirm(data, true)
  if (!canContinue) return

  await openDisWin(data)
}

/** 提交配货 */
const submit = async (item: any, disNum: number, isMerge = false) => {
  if (!isMerge) {
    MessageBox.loading({ moreText: '正在处理...', mask: true })
  }
  

  const _api = disType.value === 3 ? 'stockCheck' : 'submit';
  const _parmars = disType.value === 3 ? {
    ProductCode:item.productcode, //商品编码
    QualityGrade:item.qualitygrade, //质量特级,
    SaleType:item.saletype, //商品类型,
    StockNum:item.owenumex, //库存数量,
    CheckNum:+disNum, //清点数量,
    UserCode:UserCode, //操作人,
    CheckDate:deliveryAt.value, //清点日期
  } : {
    idkey: item.idkey,
    num: item.num,
    numex: (+disNum).toFixed(1),
    price: item.saleprice,
    UserCode,
    Rest: Number(restDis.value),
    ForceOver: Number(forceOver.value)
  };
  const submitRes = await $api.comonRequest('/masterApi/disApi/dis/disDisTribution/', _api, _parmars)

  if (submitRes.errCode === 0 && !isMerge) {
    if (disType.value === 3) {
        if (!isMerge) {
            setTimeout(() => MessageBox.closeAllLoading(), 50)
        }
        openData(disType.value,'')
        return submitRes
    }
    const childrenArr = disType.value === 0
      ? gridAction.dataSource.dataSet[arrMainIndex.value]['children']
      : detailDataSource.dataSet

    const targetDisType = detialVisabled.value ? 10 : disType.value
    const res = await restOpenData(targetDisType, `idkey='${item.idkey}'`, disType.value === 2 ? 'FromShipper' : 'FromCate')
    const printData = JSON.parse(JSON.stringify(res[0]))

    // 更新数据
    const index = disType.value === 0 ? arrSubIndex.value : detailIndex.value
    childrenArr[index] = res[0]

    // 删除并重新排列
    const [deletedItem] = childrenArr.splice(index, 1)
    if (isShowFinsh.value) childrenArr.push(deletedItem)

    // 更新父级状态（非客户配货模式）
    if (disType.value !== 0 && disType.value !== 3) {
      const hasUnfinished = detailDataSource.dataSet.some((i: any) => +i.distributionstatus !== 2)
      if (!hasUnfinished) {
        detialVisabled.value = false
        thisParentItem.value.distributionstatus = 2
      }
    }

    // 删除空分组
    if (disType.value === 0 && childrenArr.length === 0) {
      gridAction.dataSource.dataSet.splice(arrMainIndex.value, 1)
    }

    detailDataIsChange.value = disType.value !== 0

    if (+printData.distributionstatus === 2 && disType.value !== 3) {
      handlePrint(printData)
    }
  }

  restDis.value = false
  forceOver.value = false
  if (!isMerge) {
    setTimeout(() => MessageBox.closeAllLoading(), 50)
  }
  return submitRes
}

/** 批量提交 */
const mergeSubmit = async (list: any[]) => {
  MessageBox.loading({ moreText: '正在配货...', mask: true })

  const uncompleted = list.filter(item => +item.distributionstatus < 2)
  const items = JSON.parse(JSON.stringify(uncompleted))

  for (let i = 0; i < items.length; i++) {
    await submit(items[i], items[i].owenumex, true)
    if (i === items.length - 1) {
      detialVisabled.value = false
      detailDataIsChange.value = true
      MessageBox.closeAllLoading()
    }
  }
}

/** 打印标签 */
const handlePrint = async (data: any) => {
  if (!printLabel.value) return

  const printData = { ...data }
  printData.Url = `https://www.hzlinke.com.cn/linkeDisSystem/checkReports/index.html?linkename=${commonParam.$linkname}&billnumber=${data.billnumber}`
  printData.distributionnum = $Utils.clearDecimal(data.distributionnum) + data.unit
  printData.numex = $Utils.clearDecimal(data.numex) + data.unit

  const params = {
    Command: 'PrintLabel',
    Datas: JSON.stringify({ datas: [printData] }),
    DefaultPrintName: commonDatas.value.SysParamDatas[0].lableprintname,
    Preview: '0'
  }

  const res = await $api.getScaleInfo('', params)
  if (res.errCode !== 0) {
    console.log('服务器无启动')
  }
}

// ============ 键盘事件 ============
const handleKeyDown = (e: KeyboardEvent) => {
  if (e.key === 'Escape') {
    detialVisabled.value = false
  }
}

const handleSearch = (searchText: string) => {
  const condition = searchText ? `name like '%${searchText}%'` : ''
  openData(disType.value, condition)
}

const toggleFullScreen = () => {
  document.fullscreenElement ? exitFullscreen() : fullscreen()
}

// ============ 搜索事件注册 ============
const registerSearchHandler = inject<(handler: (text: string) => void) => void>('registerSearchHandler', () => {})
const unregisterSearchHandler = inject<(handler: (text: string) => void) => void>('unregisterSearchHandler', () => {})

onMounted(() => {
  registerSearchHandler(handleSearch)
})

onUnmounted(() => {
  unregisterSearchHandler(handleSearch)
})

// ============ 初始化 ============
getCommonDatas(1).then(res => {
  commonDatas.value = res as CommondDatasParamType
  EnabledWeighing.value = +commonDatas.value.SysParamDatas[0].enabledweighing === 1

  if (commonDatas.value.SysParamDatas[0].exceedtimetoday < thisH) {
    deliveryAt.value = $Utils.getDate('d', 1)
    localStorage.setItem('DeliveryAt', deliveryAt.value)
  }

  openData(0)
  fullscreen()
})

nextTick(() => WinBox.value?.focus())

// ============ Watch ============
watch(() => detialVisabled.value, (visible) => {
  if (!visible && detailDataIsChange.value) {
    const condition = disType.value === 1
      ? `cateCode=${thisParentItem.value.catecode} and productCode=${thisParentItem.value.productcode} and a.SaleType=${thisParentItem.value.saletype}`
      : `shipperCode=${thisParentItem.value.shippercode} and productCode=${thisParentItem.value.productcode} and a.SaleType=${thisParentItem.value.saletype}`

    const childrenArr = gridAction.dataSource.dataSet[arrMainIndex.value]['children']

    restOpenData(disType.value, condition, disType.value === 2 ? 'FromShipper' : 'FromCate').then((res: any) => {
      thisParentItem.value.distributionnum = res[0].distributionnum
      thisParentItem.value.distributionstatus = res[0].distributionstatus

      const [deletedItem] = childrenArr.splice(arrSubIndex.value, 1)
      if (isShowFinsh.value) childrenArr.push(deletedItem)

      if (childrenArr.length === 0) {
        gridAction.dataSource.dataSet.splice(arrMainIndex.value, 1)
      }
    })
    detailDataIsChange.value = false
  }
})

watch(() => disType.value, (type) => {
  listSelectedIndex.value = -1
  detialVisabled.value = false

  const typeConfig: Record<number, { columns: string, groupField: string }> = {
    0: { columns: 'CustomerColumns', groupField: 'customercode' },
    1: { columns: 'CateColumns', groupField: 'catecode' },
    2: { columns: 'CustomerColumns', groupField: 'shippercode' },
    3: { columns: 'CateColumns', groupField: 'catecode' },
    4: { columns: 'CateColumns', groupField: 'catecode' },
  }

  const config = typeConfig[Number(type)]
  if (config) {
    gridAction.Columns = (gridAction as any)[config.columns]
    gridAction.arrGroupFieldName = config.groupField
    dataSource.dataSet = []
    openData(disType.value)
  }
})

watch(() => isShowFinsh.value, () => openData(disType.value))
</script>

<style lang="scss" scoped>
@media print {
  .win-body { display: block !important; }
  .lkx-table-body-row { height: 18px; }
}

.win {
  position: absolute;
  inset: 0;
}

.win-hearder {
  height: 40px;
  border-bottom: 1px solid red;
  display: flex;
  align-items: center;

  .Input-DeliveryAt {
    margin-left: 10px;
    outline-color: blue;
    width: 200px;
  }

  button {
    margin-left: 10px;
    width: 100px;
  }
}

.label {
  display: inline-flex;
  align-items: center;
  padding: 3px;
  margin-right: 10px;
}

.radio {
  height: 30px;
  width: 30px;
  padding: 0;
  margin: 0 5px 0 0;
  outline: 0;
}

.win-body {
  position: absolute;
  top: 40px;
  left: 0;
  right: 0;
  bottom: 0;
  overflow: hidden;
  padding: 5px 0 0 20px;
  display: flex;
  flex-direction: row;

  .win-body-left {
    flex: 1;
    display: flex;
    flex-direction: column;
    overflow: auto;

    .grid-body {
      display: flex;
      flex-direction: column;

      .groupInfo {
        background: blueviolet;
        padding: 5px;
        color: white;
        font-size: 22px;
      }

      .item-body {
        padding: 5px;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        gap: 10px;
        align-content: flex-start;

        .productGrid {
          height: 100px;
          width: 340px;
        }
      }
    }
  }

  .win-body-right {
    width: 200px;
    border-left: 1px solid red;
    display: flex;
    flex-direction: column;

    .all-button {
      text-align: center;

      button {
        width: 100%;
        height: 35px;
      }
    }

    .item-body {
      flex: 1;
      overflow: auto;

      .item {
        padding: 5px 10px;
        font-size: 22px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;

        &:hover {
          background-color: rgba(32, 32, 110, 0.377);
          color: white;
          cursor: pointer;
        }
      }
    }
  }

  .empty {
    font-size: 30px;
    color: red;
    text-align: center;
    margin-top: 10%;
  }
}

.Cate-item-body {
  position: absolute;
  display: flex;
  flex-direction: column;
  border: 1px solid #bbb;
  background-color: rgba(255, 255, 255, 1);
  overflow: auto;
  height: 80%;
  width: 80%;
  left: 5%;
  top: 10px;
  padding: 5px;

  .productList {
    flex: 1;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 10px;
    align-content: flex-start;

    .productGrid {
      height: 100px;
      width: 340px;
    }
  }

  .action {
    height: 40px;
    background: blue;
    display: flex;
    align-items: center;
    margin-bottom: 3px;

    label {
      flex: 1;
      color: white;
      padding-left: 10px;
    }

    button {
      width: 120px;
      height: 36px;
      background: blue;
      color: white;
      cursor: pointer;
      border-color: red;
      border-radius: 5px;
      margin-right: 5px;
    }
  }
}

.applay-button {
  height: 30px;
}

.active {
  background: blue;
}

.no-keyboard {
  pointer-events: none;
}
</style>