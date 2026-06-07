<template>
    <div class="form-container">
        <div class="action_body">
            <div class="container">
                导入数据
                <input
                    name="ElInputFile"
                    style="width: 30%;"
                    type="file"
                    accept=".xls,.xlsx"
                    class="upload_file"
                    @change="readExcel"
                />
            </div>
        </div>
        <div class="import_box">
            <div class="import_box_list">
                <div class="import_box_list_item" 
                    :class="{'import_box_list_item_active':index==activeRowIndex}"
                    v-for="(item,index) in workbookList" :key="index"
                    @dblclick="handleImport(item,index)"
                    >{{ item }}
                </div>
            </div>
            <div class="import_box_grid">
                <LkxGrid ref='lkxGrid' class="grid" 
                        :columns= "gridAction.Columns" 
                        :dataSource= "dataSource" 
                        :gridAction= "gridAction"
                        :methods= "gridAction.Methods" 
                        :events= "gridAction.Events"
                        :tableConfig= "gridAction.TableConfig"
                        
                        :serachBoxConfig= "gridAction.SerachBoxConfig"
                        :pagerConfig= "gridAction.PagerConfig"
                
                        :power= "gridAction.PowerList"
                        :loading = "gridAction.Loading"
                        :loadText = "gridAction.LoadText"
                >
                    <template #optbut>
                        <div class="delete-but" @click="handleOptButClick">删除</div>
                    </template>
                </LkxGrid>  
            </div>
        </div>
        <div class="win-action">
            <button class="modal-button" @click="handleCancel">取消</button>
            <button type="submit" class="modal-button modal-button-primary" @click="handleConfirm">导入</button>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref,  getCurrentInstance, reactive } from 'vue'
import { LkxGrid, ModalResultEnum } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import { MessageBox } from '@v4x/ui'
import * as XLSX from "xlsx"
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { ImportWinInstanceRefs, ImportWinOptions } from './types'

defineOptions({
    name: 'WinImportWin'
})

const props = withDefaults(defineProps<ImportWinOptions>(), {
    datas: () => ({}),
    rowIndex: -1,
    listDatas: () => []
})

const allowImport = ref(false)
const workbook = ref<null | XLSX.WorkBook>(null)
const workbookList = ref<string[]>([])

const activeRowIndex = ref(-1)
const upload_file = ref('')

const parentInstance = getCurrentInstance()?.parent

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/quotedPrice/import/',
        KeyFieldName: 'SerialNumber',
        NotAllowOperationList: [],
        getParmars: {}
    })
)

const instanceRefs = {
    customercode: props.datas.customercode,
    parentInstance,
    modalActionConfirm,
    modalActionCancel
} as ImportWinInstanceRefs

const gridAction = reactive(new TAction(dataSource, instanceRefs))
gridAction.PagerConfig.pageSize = 0
gridAction.getParams = {
    procName: 'Sp_QuotedPrice_GetNotExists',
    procParmars: { where: '',billNumber: props.datas.billnumber }
}

const readExcel = (e: any) => {
    const files = e.target.files
    if (files.length <= 0) {
        return false
    } else if (!/.(xlsx)$/.test(files[0].name.toLowerCase())) {
        MessageBox.error({
            title: '出错',
            content: "上传格式不正确，请上传xlsx格式"
        })
        return false
    } else {
        upload_file.value = files[0].name
    }
    const fileReader = new FileReader()
    fileReader.onload = (ev: any) => {
        const data = ev.target.result
        workbook.value = XLSX.read(data, {
            type: "binary",
            cellText: true,
            dateNF: "YYYY-MM-DD",
            cellDates: true
        })
        workbookList.value = workbook.value.SheetNames
    }
    fileReader.readAsBinaryString(files[0])
}

interface ExcelRow {
    '序号': string | number
    [key: string]: any
}

const handleImport = async (SheetName: string, index: number) => {
    activeRowIndex.value = index
    if (workbook.value) {
        gridAction.dataSource.close()
        MessageBox.loading({
            moreText: '正在导入'
        })
        let ws = XLSX.utils.sheet_to_json(
            workbook.value.Sheets[SheetName],
            {
                range: 'A1:J10000',
                blankrows: false,
                raw: true,
                defval: ""
            }
        ) as ExcelRow[]
        ws = ws.filter((item: ExcelRow) => {
            return item['序号'] !== ''
        })
        
        for (let i = 0; i < ws.length; i++) {
            const row = ws[i]
            Object.keys(row).forEach((key: string) => {
                if (typeof row[key] === 'string') {
                    row[key] = row[key].replace(/，/g, "_")
                    row[key] = row[key].replace(/,/g, "_")
                }
            })
        }
        
        const importRes = await gridAction.updateImportData('/masterApi/disApi/sales/quotedPrice/import/', JSON.stringify(ws))
        setTimeout(() => {
            MessageBox.closeAllLoading() 
        }, 500)
        if (importRes.errCode != 0) {
            MessageBox.error({
                title: '出错',
                content: "数据导入出错"
            })
            return
        }
        const openRes = await gridAction.open()
        if (openRes.errCode != 0) return
        MessageBox.closeAllLoading()  
        
    }
}

const handleOptButClick = (Event: MouseEvent) => {
    gridAction.delete().then(()=>{
        gridAction.update()
    })
    
}

const handleConfirm = async () => {
    allowImport.value = true
    if (!allowImport.value) return
    const noMates = gridAction.dataSource.dataSet.filter((item: any) => {
        return +item['ismate'] === 0
    })
    if (noMates.length > 0) {
        MessageBox.error({
            title: '出错',
            content: "存在不匹配的商品,请处理好再导入"
        })
        return
    }
    const upRes = await gridAction.QuotedImport('/masterApi/disApi/sales/quotedPrice/BillDetail/', props.datas.billnumber)
    if (upRes&&upRes.errCode === 0) {
        MessageBox.information({
            title: '成功',
            content: "数据导入成功！！",
            showCancel: false
        })
        return
    } 
  //  modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: null })
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
</script>

<style lang="scss" scoped>
.form-container{
    display: flex;
    flex-direction: column;
    height: 100%;
    .win-hearder{
        height: 45px;
        flex-shrink: 0;
        border-bottom:1px solid #e4e7ed ;
        display: flex;
        align-items: center;
        .Input-At{
            margin-left: 10px ;
            width: 250px;
        }
        .shipper-input{
            width: 300px;
        }
        button{
            margin-left: 10px ;
            width: 100px;
        }
    }
    .win-body{
        flex: 1;
        min-height: 0;
    }
    .win-action{
        height: 40px;
        flex-shrink: 0;
        padding: 5px 16px;
        border-top:1px solid #e4e7ed;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
    }
}
.action_body{
    height: 35px;
    border-bottom: 1px solid #dcdfe6;
}
.import_box{
    display: flex;
    flex-direction: row;
}
.import_box_list{
    width: 150px;
    height: 400px;
    border-right:1px solid #dcdfe6;
    overflow-y: auto;
}
.import_box_list_item{
    padding: 5px;
    &:hover{
        background-color: #f5f7fa;
    }
}
.import_box_list_item_active{
    background-color: blue;
    color: white;
}
.import_box_grid{
    flex: 1;
}
.grid{
    height: 400px;
}
.money{
    width: 60px;
    margin-right: 10px;
}
.note{
    width: 230px;
}
.checkboxTitle{
    display: inline-flex;
    line-height: 24px;
    width: 130px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}

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

.delete-but {
    width: 100%;
    text-align: center;
    color: red;
    &:hover {
        cursor: pointer;
    }
}
</style>
