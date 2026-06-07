<template>
    <div class="print-body" :style="{width: printConfig.pageConfig.width+'mm',height: printConfig.pageConfig.height+'mm'}" v-for="(item,pageIndex) in PrintData" :key="pageIndex">
        <span  v-if="!printConfig.pageConfig.printOnePage||pageIndex==0" class="print-header" :style="{height: headerHeight}">
            <template  v-for="(hitem,hindex) in printConfig.headerConfig">
                <img  v-if="hitem.type=='img'" object-fit: contain :style="hitem.style" :src="hitem.title" :key="hindex"/>
                <span class="value" v-if="hitem.type!='img'&&hitem.type!='qr'" :style="hitem.style" :key="hindex">{{headerFormat(hitem,pageIndex)}}</span>
                <vue-qr class="qrCode"   v-if="hitem.type=='qr'" :text= "getQrData(hitem)"  :size='150' :style="hitem.style" ></vue-qr>
            </template>
        </span>
        <div class="table" >
            <div class="table--row" v-if="printCateGroup">
                <span class="table--row--cell-header table--row--cell" 
                    v-for="(ColItem,ColIndex) in groupColumns" :name="ColItem.fieldName" :key="ColIndex" 
                    :style="[{'text-align':'center'},{'width':ColItem.width+'px'},{height: rowHeight},{'line-height':rowHeight}]">
                    {{ColItem.title}}
                </span>
            </div>
            <template v-if="printCateGroup">
                <div class="table--row" v-for="(rowItem,rowIndex) in groupDatas" :key="rowIndex">
                    <span class="table--row--cell" v-for="(cellItem,cellIndex) in groupColumns" :name="cellItem.fieldName" :key="cellIndex"   :style="[
                        {'text-align':cellItem.align},{'width':cellItem.width+'px'},{height: rowHeight},{'line-height':rowHeight}]">
                        {{cellItem.fieldName=='sep'?getRowId(pageIndex,rowIndex,rowItem):format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}
                    </span>
                </div>
            </template>
            <div class="table--row" >
                <span class="table--row--cell-header" 
                    v-for="(ColItem,ColIndex) in convertColumns" :name="ColItem.fieldName" :key="ColIndex" 
                    :style="[{'fontSize':ColItem.fontSize+'px'},{'text-align':'center'},{'width':ColItem.width+'px'},{'height': headerRowHeight}]">
                    {{ColItem.title}}
                </span>
            </div>
            <div class="table--row" v-for="(rowItem,rowIndex) in item" :key="rowIndex">
                <template v-for="(cellItem,cellIndex) in convertColumns"> 
                    <span v-if="rowItem.batchnumber!='group'"  class="table--row--cell"  :name="cellItem.fieldName"  
                    :style="[
                        {'fontSize':cellItem.fontSize+'px'},
                        {'text-align':cellItem.align},{'width':cellItem.width+'px'},{'height': rowHeight},{'line-height':rowHeight}]">
                        {{cellItem.fieldName=='sep'?getRowId(pageIndex,+rowIndex,rowItem):format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}
                    </span>
                    <span v-if="cellIndex==0&&rowItem.batchnumber=='group'"  class="table--row--cell"  :name="cellItem.fieldName"  :style="[
                        {'width':colspanWidth(0,convertColumns.length)+'px'},{'height': rowHeight},{'line-height':rowHeight}]">
                        {{getGroupText(rowItem)}}
                    </span>
                </template>
           </div>
           <div class="table--row" v-if="!printConfig.pageConfig.printOnePage&&printTotal&& printConfig.totalColumns.length>0" >
                <span class="table--row--cell" style="padding-right:20px" v-for="(cellItem,cellIndex) in printConfig.totalColumns" :name="cellItem.fieldName" :key="cellIndex"   :style="[
                    {'text-align':cellItem.footers?.align||cellItem.align},{'width':colspanWidth(+cellIndex,cellItem.colspan)+'px'},{'height': rowHeight},{'line-height':rowHeight}]">
                    {{totalChineseFormater(cellItem,DataSet,pageDatas[pageIndex],pageIndex)}}
                </span>
           </div>
        </div>
        
        <div class="table total" v-if="!printConfig.pageConfig.printOnePage&&printTotal&& printConfig.totalColumns.length==0" >
            <div class="table--row"  v-if="totalPage!=1">
                <span class="table--row--cell" v-for="(cellItem,cellIndex) in convertColumns" :name="cellItem.fieldName" :key="cellIndex"   
                :style="[
                    {'text-align':cellItem.footers?.align||cellItem.align},{'width':cellItem.width+'px'},{'height': rowHeight},{'line-height':rowHeight}]">
                    {{totalFormater(cellItem,pageDatas[pageIndex],'sub')}}
                </span>
           </div>
           <div class="table--row"  >
                <span class="table--row--cell" v-for="(cellItem,cellIndex) in convertColumns" :name="cellItem.fieldName" :key="cellIndex"   :style="[
                    {'text-align':cellItem.footers?.align||cellItem.align},{'width':cellItem.width+'px'},{'height': rowHeight},{'line-height':rowHeight}]">
                    {{totalFormater(cellItem,DataSet,'')}}
                </span>
           </div>
        </div>

        <div class="table total" v-if="printTotal&&printConfig.pageConfig.printOnePage&&pageIndex==PrintData.length-1" >
           <div class="table--row"  >
                <span class="table--row--cell" v-for="(cellItem,cellIndex) in convertColumns" :name="cellItem.fieldName" :key="cellIndex"   :style="[
                    {'text-align':cellItem.footers?.align||cellItem.align},{'width':cellItem.width+'px'},{'height': rowHeight},{'line-height':rowHeight}]">
                    {{totalFormater(cellItem,DataSet,'')}}
                </span>
           </div>
           <div class="table--row" >
                <span class="table--row--cell table--row--cell-Total" style="padding-right:20px" v-for="(cellItem,cellIndex) in printConfig.totalColumns" :name="cellItem.fieldName" :key="cellIndex"   :style="[
                    {'text-align':cellItem.footers?.align||cellItem.align},{'width':colspanWidth(+cellIndex,cellItem.colspan)+'px'},{'height': headerRowHeight}]">
                    {{totalChineseFormaterEx(cellItem,DataSet,pageDatas[pageIndex],pageIndex)}}
                </span>
           </div>
        </div>

        <span v-if="!printConfig.pageConfig.printOnePage||pageIndex==PrintData.length-1" class="print-footer" :style="{height: footerHeight}">
            <span v-for="(hitem,hindex) in printConfig.footerConfig"  :style="hitem.style"  :key="hindex">{{headerFormat(hitem,pageIndex)}}</span>
        </span>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import $Utils from '@v4x/utils/lkxUtil'
import { TableColumnsType, TableRowDataType } from '@v4x/ui'
import VueQr from 'vue-qr'
import { assign } from 'lodash'
import type { PrintProps } from './types'

defineOptions({
    name: 'LkxPrint'
})

const props = withDefaults(defineProps<PrintProps>(), {
    Title: '打印',
    Columns: () => [],
    HeaderData: () => ({}),
    DataSet: () => [],
    CommonDatas: () => ({}),
    Config: () => ({}),
    UserName: '',
})

//const _loginDatas = props.loginDatas
const UserCodeName = props.UserName
const totalPage = ref(1)
const printColumns = ref<TableColumnsType[]>([])
const convertColumns = ref<TableColumnsType[]>([])
const convertDataSet = ref<TableRowDataType[]>([])

const PrintData = ref<TableRowDataType[]>([])
const pageDatas = ref<TableRowDataType[][]>([])


const defaultPrintConfig = ref({
    pageConfig: {
        pageSizeH: 297,
        pageSizeW: 210,
        headerHeight: 15,
        footerHeight: 10,
        rowHeight: 8,
        headerRowHeight: 8,
        columns: 1,
        fullPage: 0,
        printHeader: true,
        printTotal: true,
        printCateSubTotal: false,
        printCateGroup: false,
        printOnePage: false,
        notAllowedPrintRow: 1,
        totalOccupyRow: 2,
    },
    headerConfig: [{
        type: 'text',
        title: `${props.Title}`,
        fieldName: '',
        style: {
            position: 'absolute',
            left: '0',
            top: '0',
            right: '0',
            'text-align': 'center',
            'font-size': '30px'
        }
    }, {
        type: 'pageNum',
        title: '1/2',
        style: {
            position: 'absolute',
            right: '10px',
            'text-align': 'center',
        }
    }],
    footerConfig: [{
        type: 'text',
        title: `打印人：${UserCodeName}`,
        fieldName: '',
        style: {
            position: 'absolute',
            left: '20px',
            top: '10px',
            'text-align': 'left',
        }
    }, {
        type: 'text',
        title: `打印时间：${$Utils.getDate('none', 0, 'yyyy-MM-dd HH:mm:ss')}`,
        style: {
            position: 'absolute',
            top: '10px',
            right: '20px',
            'text-align': 'left',
        }
    }],
    printColumns: [],
    totalColumns: []
})

const groupColumns = ref<TableColumnsType[]>([{
    "inputType": "defaultValue",
    "defaultValue": "商品数",
    "dataType": "number",
    "fieldName": "",
    "width": 60,
    "title": "类别",
    "align": "center"
}])
const groupDatas = ref<TableRowDataType[]>([])
let groupRows = 0

const printConfig = ref($Utils.deepObjectMerge(defaultPrintConfig.value, props.Config))

const printTotal = computed(() => {
    return printConfig.value.pageConfig.printTotal == undefined || printConfig.value.pageConfig.printTotal == 1
})


const printCateGroup = computed(() => {
    return printConfig.value.pageConfig.printCateGroup == 1
})

if (printConfig.value.printColumns.length == 0) {
    [...printColumns.value] = props.Columns as any
    const _inx = $Utils.getIndexFromArray(printColumns.value, 'fieldKind', 'expand')
    if (_inx != -1)
        printColumns.value.splice(_inx, 1)
    const _optinx = $Utils.getIndexFromArray(printColumns.value, 'fieldKind', 'opt')
    if (_optinx != -1)
        printColumns.value.splice(_optinx, 1)
} else {
    printColumns.value = printConfig.value.printColumns
}




const pagePrintRow = computed(() => {
    const pageConfig = printConfig.value.pageConfig
    const allowHeight = pageConfig.pageSizeH - pageConfig.headerHeight - pageConfig.footerHeight - pageConfig.headerRowHeight || pageConfig.rowHeight
    return (Math.floor(allowHeight / (pageConfig.rowHeight)) - Number(pageConfig.printTotal)) * pageConfig.columns
})

const pageMaxPrintRow_All = computed(() => {
    const pageConfig = printConfig.value.pageConfig
    const allowHeight = pageConfig.pageSizeH - pageConfig.headerRowHeight || pageConfig.rowHeight
    return (Math.floor(allowHeight / pageConfig.rowHeight) - pageConfig.notAllowedPrintRow) * pageConfig.columns
})

const headerOccupyRow = computed(() => {
    const pageConfig = printConfig.value.pageConfig
    const allowHeight = pageConfig.headerHeight
    return Math.floor(allowHeight / pageConfig.rowHeight)
})

const footerOccupyRow = computed(() => {
    const pageConfig = printConfig.value.pageConfig
    const allowHeight = pageConfig.footerHeight
    return Math.floor(allowHeight / pageConfig.rowHeight)
})

const totalOccupyRow = computed(() => {
    return printConfig.value.pageConfig.totalOccupyRow
})

const ConvertColumns = (columns: any, ColumnsNum: number) => {
    const columnsArr = []
    let columnObj = {}
    if (ColumnsNum == 1) return columns
    for (let i = 0; i < ColumnsNum; i++) {
        for (let j = 0; j < columns.length; j++) {
            columnObj = assign({}, columns[j], { fieldName: columns[j].fieldName + (i + 1) })
            columnsArr.push(columnObj)
        }
    }
    return columnsArr
}

convertColumns.value = ConvertColumns(printColumns.value, printConfig.value.pageConfig.columns)

const convertPrintData = (data: any, pageNum: number) => {
    const _Columns = printConfig.value.pageConfig.columns
    if (printConfig.value.pageConfig.columns == 1) return data
    let _LineObj = {} as any
    let _LineArr = [] as any
    _LineArr = []
    const rowNum = Math.ceil(data.length / _Columns)
    for (let i = 0; i < rowNum; i++) {
        _LineObj = {}
        for (let j = 0; j < printColumns.value.length; j++) {
            const fieldName = printColumns.value[j].fieldName
            _LineObj[fieldName + '1'] = data[i][fieldName]
        }
        _LineObj['sep1'] = data[i]['idkey'] ? (pageNum - 1) * pagePrintRow.value + i + 1 : ''
        if (i + rowNum < data.length) {
            for (let j = 0; j < printColumns.value.length; j++) {
                const fieldName = printColumns.value[j].fieldName
                _LineObj[fieldName + '2'] = data[i + rowNum][fieldName]
            }
            _LineObj['sep2'] = data[i + rowNum]['idkey'] ? (pageNum - 1) * pagePrintRow.value + i + rowNum + 1 : ''
        }
        if (printConfig.value.pageConfig.columns > 2) {
            if (i + rowNum * 2 < data.length) {
                for (let j = 0; j < printColumns.value.length; j++) {
                    const fieldName = printColumns.value[j].fieldName
                    _LineObj[fieldName + '3'] = data[i + rowNum * 2][fieldName]
                }
                _LineObj['sep3'] = data[i + rowNum * 2]['idkey'] ? (pageNum - 1) * pagePrintRow.value + i + rowNum * 2 + 1 : ''
            }
        }
        _LineArr.push(_LineObj)
    }
    return _LineArr
}

const buildGroupData = (): any[] => {
    const groupData = $Utils.arrGroup(props.DataSet, 'catename')
    groupData.map(item => {
        const _money = $Utils.numberFormat($Utils.sumArray(item.children, 'money'), '0.00')
        const _num = item.children.length
        const xx = new Proxy(Object.assign({}, item.children[0], { batchnumber: 'group', numex: _num, money: _money }), {})
        return item.children.push(xx)
    })
    let _arr: string | any[] = []
    groupData.forEach(item => {
        _arr = _arr.concat(item.children)
    })
    const _groupColumns = _arr.filter((item) => {
        return item.batchnumber == 'group'
    })
    let _v = {} as any
    for (let i = 0; i < _groupColumns.length; i++) {
        groupColumns.value.push({
            "dataType": "number",
            "fieldName": _groupColumns[i].catename,
            "width": 60,
            "title": _groupColumns[i].catename,
            "align": "center"
        })
        _v[_groupColumns[i].catename || ''] = _groupColumns[i].numex
    }
    groupDatas.value.push(_v)
    return _arr
}

const buildPrintPageData = () => {
    const _Pdatas = printConfig.value.pageConfig.printCateGroup ? buildGroupData() : props.DataSet
    const _Columns = printConfig.value.pageConfig.columns as number
    PrintData.value = []
    totalPage.value = Math.ceil(_Pdatas.length / pagePrintRow.value)
    for (let i = 0; i < _Pdatas.length; i += pagePrintRow.value) {
        pageDatas.value.push(_Pdatas.slice(i, i + pagePrintRow.value))
    }
    if (printConfig.value.pageConfig.fullPage) {
        const LastPageDatas = pageDatas.value[pageDatas.value.length - 1]
        const diffNum = pagePrintRow.value - LastPageDatas.length
        for (let i = 0; i < diffNum; i++) {
            pageDatas.value[pageDatas.value.length - 1].push({})
        }
    }
}

const buildPrintPageDataEx = () => {
    const datas = printConfig.value.pageConfig.printCateGroup ? buildGroupData() : props.DataSet
    const _Pdatas = [...datas]
    const _Columns = printConfig.value.pageConfig.columns as number
    PrintData.value = []
    totalPage.value = Math.ceil((_Pdatas.length + headerOccupyRow.value + footerOccupyRow.value + totalOccupyRow.value) / pageMaxPrintRow_All.value)
    /* console.log('打印页数', totalPage.value)
    console.log('总行数', _Pdatas.length)
    console.log('提头行数', headerOccupyRow.value)
    console.log('页脚行数', footerOccupyRow.value)
    console.log('合计行数', totalOccupyRow.value)
    console.log('页可打印行数', pageMaxPrintRow_All.value) */
    for (let i = 0; i < totalPage.value; i++) {
        if (i == 0) {
            pageDatas.value.push(_Pdatas.splice(0, pageMaxPrintRow_All.value - headerOccupyRow.value))
        } else if (i == totalPage.value - 1) {
            pageDatas.value.push(_Pdatas.splice(0, _Pdatas.length))
        } else {
            pageDatas.value.push(_Pdatas.splice(0, pageMaxPrintRow_All.value))
        }
    }
}

const buildPrintData = () => {
    if (printConfig.value.pageConfig.printOnePage) {
        buildPrintPageDataEx()
    } else {
        buildPrintPageData()
    }
    PrintData.value = []
    for (let i = 0; i < pageDatas.value.length; i++) {
        PrintData.value.push(convertPrintData(pageDatas.value[i], i + 1))
    }
}

buildPrintData()

const headerHeight = computed(() => {
    return printConfig.value.pageConfig.headerHeight + 'mm'
})

const footerHeight = computed(() => {
    return printConfig.value.pageConfig.footerHeight + 'mm'
})

const headerFormat = (item: any, page: number = 1): string => {
    let res = ''
    switch (item.type) {
        case 'pageNum':
            res = '第' + (page + 1).toString() + '页/共' + totalPage.value.toString() + '页'
            break
        case 'totalCount':
            res = String(props.DataSet.length)
            break
        case 'totalNum':
            res = $Utils.numberFormat($Utils.sumArray(props.DataSet, 'numex'), '0.00')
            break
        case 'drop':
            res = $Utils.getValueFromArray(props.CommonDatas[item.dropListConfig.ListSourceName], item.dropListConfig.keyFieldName, item.dropListConfig.resultFieldName, props.HeaderData[item.fieldName]).toString()
            break
        default:
            res = item.fieldName ? $Utils.numberFormat(props.HeaderData[item.fieldName], item.format) : item.title
            break
    }
    return res
}

const format = (rowItem: TableRowDataType, cellItem: TableColumnsType, fieldName: string) => {
    let res = ''
    switch (cellItem.inputType?.toLocaleLowerCase()) {
        case 'drop':
            res = $Utils.getValueFromArray(
                cellItem.dropListConfig?.dropListDatas || props.CommonDatas[cellItem?.dropListConfig?.dropListDatasName || ''],
                cellItem.dropListConfig?.resultFieldName || 'idcode',
                cellItem.dropListConfig?.displayFieldName || 'name',
                rowItem[fieldName]
            ).toString()
            break
        case 'formula':
            res = $Utils.numberFormat(rowItem['saleprice'] / 0.9288, '0.00')
            break
        case 'defaultvalue':
            res = $Utils.numberFormat(cellItem.defaultValue || 0, cellItem.format || '')
            break
        case 'date':
        case 'datetime':
            res = $Utils.dateFormat(rowItem[fieldName], cellItem.format || '')
            break
        default:
            if (cellItem.dataType == 'number') {
                if (!cellItem.format && rowItem[fieldName]) {
                    res = $Utils.clearDecimal(rowItem[fieldName])
                } else {
                    res = $Utils.numberFormat(rowItem[fieldName], cellItem.format || '')
                }
            } else {
                res = fieldName ? rowItem[fieldName] : ''
            }
            break
    }
    return res
}

const totalFormater = (column:TableColumnsType, datas: TableRowDataType[], type: string) => {
    if (!column) return
    if (!column.footers) return
    let res = ''
    switch (column.footers.valueType) {
        case 'fvtNone':
            res = type == 'sub' ? '页小计' : column.footers.value || ''
            break
        case 'fvtCount':
            res = datas.length.toString()
            break
        case 'fvtSum':
            res = $Utils.numberFormat($Utils.sumArray(datas, column.fieldName.toLocaleLowerCase()), column.format || '')
            break
    }
    return res
}

const totalChineseFormater = (column: any, allDatas: TableRowDataType[], pageDatas: TableRowDataType[], page: number) => {
    let res = ''
    const totalMoney = $Utils.numberFormat($Utils.sumArray(allDatas, column.fieldName), column.format || '')
    const totalWeight = $Utils.numberFormat($Utils.sumArray(allDatas, column.fieldName), column.format || '')
    const totalPageMoney = $Utils.numberFormat($Utils.sumArray(pageDatas, column.fieldName), column.format || '')
    switch (column.totalType) {
        case 'pageNum':
            res = '第' + (page + 1).toString() + '页/共' + totalPage.value.toString() + '页'
            break
        case 'toChinese':
            res = '合计人民币大写：' + $Utils.convertMoneyToChinese(totalMoney)
            break
        case 'totalMoney':
            res = '合计：' + totalMoney
            break
        case 'totalPageMoney':
            res = '本页合计：' + totalPageMoney
            break
        case 'totalWeight':
            res = '重量合计：' + totalWeight
            break
        case 'totalPageWeight':
            res = '本页重量：' + $Utils.numberFormat($Utils.sumArray(pageDatas, column.fieldName), column.format || '')
            break
        default:
            res = column.title || ''
            break
    }
    return res
}

const totalChineseFormaterEx = (column: any, allDatas: TableRowDataType[], pageDatas: TableRowDataType[], page: number) => {
    let res = ''
    const totalMoney = $Utils.numberFormat($Utils.sumArray(allDatas, column.fieldName), column.format || '')
    switch (column.totalType) {
        case 'pageNum':
            res = '第' + (page + 1).toString() + '页/共' + totalPage.value.toString() + '页'
            break
        case 'toChinese':
            res = '合计人民币大写：' + $Utils.convertMoneyToChinese(totalMoney)
            break
        case 'totalMoney':
            res = '合计：' + totalMoney
            break
        case 'totalPageMoney':
            res = '本页合计：' + $Utils.numberFormat($Utils.sumArray(pageDatas, column.fieldName), column.format || '')
            break
        default:
            res = column.title || ''
            break
    }
    return res
}

const rowHeight = computed(() => {
    return printConfig.value.pageConfig.rowHeight + 'mm'
})

const headerRowHeight = computed(() => {
    if (printConfig.value.pageConfig.headerRowHeight)
        return printConfig.value.pageConfig.headerRowHeight + 'mm'
    else
        return printConfig.value.pageConfig.rowHeight + 'mm'
})

const colspanWidth = (index: number, colspan: number) => {
    if (!colspan) return convertColumns.value[index]?.width || 60
    let width = 0
    for (let i = 0; i < colspan; i++) {
        const w = convertColumns.value[index + i]?.width || 60 
        width += +w
        
    }

   
    return width
}

const getColNum = (index: number) => {
    return index % printConfig.value.pageConfig.columns
}

const getQrData = (Item: any) => {
    return `${Item.title}?linkename=${props.linkname}&billnumber=${props.HeaderData.billnumber}`
}

const getGroupText = (rowItem: any): string => {
    groupRows = groupRows + 1
    return rowItem.catename + '小计：' + rowItem.money
}

const getRowId = (pageIndex: number, rowIndex: number, rowItem: any): number => {
    let isPrintRow = 0
    if (pageIndex === 0)
        return rowIndex + 1 - groupRows
    else {
        for (let i = 0; i < pageIndex; i++) {
            isPrintRow = isPrintRow + PrintData.value[i].length
        }
        return isPrintRow + rowIndex + 1 - groupRows
    }
}
</script>

<style lang="scss" scoped>
$w: 210mm;
$h: 139mm;

.value {
    white-space: nowrap;
    overflow: hidden;
}

.table {
    width: 100%;
}

.table--row {
    display: inline-block;
    white-space: nowrap;
    align-items: center;
    overflow: hidden;
    display: flex;
    overflow: hidden;
}

.table--row--cell-header {
    border-top: 1px solid black;
    white-space: pre-wrap;
    word-wrap: break-word;
    overflow-wrap: break-word;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 1mm;
    border-bottom: 1px solid black;
    border-right: 1px solid black;
    &:first-child {
        border-left: 1px solid black;
    }
    box-sizing: border-box;
    overflow: hidden;
}

.table--row--cell {
    display: inline-block;
    padding: 0 1mm;
    border-bottom: 1px solid black;
    border-right: 1px solid black;
    &:first-child {
        border-left: 1px solid black;
    }
    box-sizing: border-box;
    overflow: hidden;
}

.print-header {
    position: relative;
    width: 100%;
}

.print-footer {
    position: relative;
    width: 100%;
    overflow: hidden;
}

.print-body {
    page-break-after: always;
    display: flex;
    flex-direction: column;
    font-family: 微软雅黑, FangSong_GB2312;
}

.table--row--cell-Total {
    white-space: pre-wrap;
    word-wrap: break-word;
    overflow-wrap: break-word;
    display: flex;
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    overflow: hidden;
}
</style>
