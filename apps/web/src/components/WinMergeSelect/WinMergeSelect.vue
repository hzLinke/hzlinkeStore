<template>
    <div class="form">
        <div class="win-grid">
            <LkxGrid ref='lkxGrid' class="grid" 
                :columns="gridAction.Columns" 
                :dataSource="dataSource" 
                :gridAction="gridAction"
                :methods="gridAction.Methods" 
                :events="gridAction.Events"
                :tableConfig="gridAction.TableConfig"
                :serachBoxConfig="gridAction.SerachBoxConfig"
                :pagerConfig="gridAction.PagerConfig"
                :power="gridAction.PowerList"
                :loading="gridAction.Loading"
                :loadText="gridAction.LoadText"
            />
        </div>
        <div class="win-action">
            <label class="checkboxTitle">如果取消代表不合并</label>
            <button class="modal-button" @click="handleCancel">取消</button>
            <button type="submit" class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
        </div>
    </div>
</template>

<script setup lang="ts">
import {  reactive, computed, getCurrentInstance } from "vue"
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import { LkxGrid, ModalResultEnum } from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { MergeSelectInstanceRefs, MergeSelectOptions } from './types'

defineOptions({
    name: 'WinMergeSelect'
})

const props = withDefaults(defineProps<MergeSelectOptions>(), {
    datas: () => ({}),
    rowIndex: -1,
    listDatas: () => []
})


const parentInstance = getCurrentInstance()?.parent

const instanceRefs = {
    parentInstance,
    modalActionConfirm,
    modalActionCancel
} as MergeSelectInstanceRefs

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/saleOrder/BillDetail/',
        KeyFieldName: 'IdKey',
        NotAllowOperationList: [],
        getParmars: { sortFields: 'IdKey', pageSize: 0 }
    })
)

const gridAction = reactive(new TAction(dataSource, instanceRefs))
gridAction.dataSource.dataSet = props.listDatas

const handleConfirm = () => {
    const data = {
        action: ModalResultEnum.mrConfirm,
        data: gridAction.dataSource.dataSet[gridAction.dataSource.activeRowIndex]
    }
    modalActionConfirm(parentInstance, data)
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
</script>

<style lang="scss" scoped>
.form {
    display: flex;
    flex-direction: column;
    height: 100%;
}
.win-grid {
    flex: 1;
    position: relative;
    min-height: 0;
    .grid {
        height: 100%;
    }
}
.win-action {
    height: 40px;
    flex-shrink: 0;
    padding: 5px 16px;
    border-top: 1px solid #e4e7ed;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 10px;
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
.checkboxTitle {
    display: inline-flex;
    line-height: 30px;
    width: 200px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: red;
}
</style>
