<template>
    <div class="form">
        <div class="win-grid">
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
            />
        </div>
        <div class="win-action">
            <label style="float:left;color:red">如果不加价的请双击对应行</label>
            <button class="modal-button" @click="handleCancel">取消</button>
            <button type="submit" class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, getCurrentInstance, markRaw, useTemplateRef } from 'vue'
import { LkxGrid, type CommondDatasParamType, ModalResultEnum } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { AddPriceRateInstanceRefs, AddPriceRateOptions } from './types'

defineOptions({
    name: 'WinAddPriceRate'
})

const props = withDefaults(defineProps<AddPriceRateOptions>(), {
    datas: () => ({}),
    rowIndex: -1,
    listDatas: () => []
})

const lkxGrid = useTemplateRef('lkxGrid')

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/basic/Cate/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: [],
        getParmars: { sortFields: 'SerialNum' }
    })
)

const parentInstance = getCurrentInstance()?.parent

const handleConfirm = async () => {
    const data = {
        datas: gridAction.dataSource.dataSet
    }
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data })
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}

const instanceRefs = markRaw({
    parentInstance,
    modalActionConfirm,
    modalActionCancel
}) as AddPriceRateInstanceRefs

const gridAction = reactive(new TAction(dataSource, instanceRefs))

gridAction.open()
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
    .win-grid{
        flex: 1;
        min-height: 0;
        .grid{
            height: 100%;
        }
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
</style>
