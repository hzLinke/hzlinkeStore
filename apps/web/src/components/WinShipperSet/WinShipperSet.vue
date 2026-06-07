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
            >
                <template #optbut>
                    <div class="delete-but" @click="handleOptButClick">删除</div>
                </template>
            </LkxGrid>
        </div>
        <div class="win-action">
        <LkxButton caption="取消" type='default'   @click="handleCancel" ></LkxButton>
        <LkxButton caption="确定" type="default"   @click="handleConfirm" ></LkxButton>
    </div>
    </div>
    
</template>

<script setup lang="ts">
import {  reactive, getCurrentInstance, markRaw, useTemplateRef } from 'vue'
import { LkxGrid, LkxButton, ModalResultEnum } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { ShipperSetInstanceRefs, ShipperSetOptions } from './types'

defineOptions({
    name: 'WinShipperSet'
})

const props = withDefaults(defineProps<ShipperSetOptions>(), {
    datas: () => ({}),
    rowIndex: -1,
    listDatas: () => []
})
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/basic/Cate/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: [],
        getParmars: { sortFields: 'SerialNum' }
    })
)
const handleOptButClick = () =>{
    gridAction.delete()    
}
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
}) as ShipperSetInstanceRefs

const gridAction = reactive(new TAction(dataSource, instanceRefs))

gridAction.open()
</script>

<style lang="scss" scoped>
.form{
    display: flex;
    flex-direction: column;
    height: 100%;
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
</style>
