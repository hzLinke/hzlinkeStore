<template>
<div class="form-container">
    <div class="win-body">
        <div class="win-body-left">
             <LkxGrid ref='lkxGrid' class="grid" 
                :columns= "gridAction.Columns" 
                :dataSource= "dataSource" 
                :gridAction= "gridAction"
                :methods= "gridAction.Methods" 
                :events= "gridAction.Events"
                :tableConfig= "gridAction.TableConfig"
                :pagerConfig= "gridAction.PagerConfig"
                :power= "gridAction.PowerList"
                :loading = "gridAction.Loading"
                :loadText = "gridAction.LoadText"
            />
        </div>
        <div class="win-body-right">
             <LkxGrid ref='lkxGrid' class="grid" 
                :columns= "batchGridAction.Columns" 
                :dataSource= "batchDataSource" 
                :gridAction= "batchGridAction"
                :methods= "batchGridAction.Methods" 
                :events= "batchGridAction.Events"
                :tableConfig= "batchGridAction.TableConfig"
                :pagerConfig= "batchGridAction.PagerConfig"
                :power= "batchGridAction.PowerList"
                :loading = "batchGridAction.Loading"
                :loadText = "batchGridAction.LoadText"
            />
        </div>
       
    </div>
    <div class="win-action">
        <LkxButton caption="取消" type='default'   @click="handleCancel" ></LkxButton>
        <LkxButton caption="确定" type="default"   @click="handleConfirm" ></LkxButton>
    </div>
</div>
</template>
<script setup lang="ts">
/**商品选择弹窗 */
import { ref, reactive, onMounted, nextTick, getCurrentInstance, markRaw, useTemplateRef } from 'vue'
import { LkxGrid, LkxButton, LkxInput, ModalResultEnum, TableRowDataType } from '@v4x/ui'
import { TDataSource } from '@/usehook/dataSource'
import { TAction,TBatchAction } from './action'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import {  BatchInSelectInstanceRefs, BatchInSelectOptions } from './types'

defineOptions({
    name: 'WinBatchInSelect'
})

const props = withDefaults(defineProps<BatchInSelectOptions>(), {
    customerCode: 0,
    shipperCode: 0,
    billType: 'sale',
    defaultDatas: (): TableRowDataType[] => []
})


const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/PublicApi/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: [],
        getParmars: {}
    })
)

const batchDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/PublicApi/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: [],
        getParmars: {}
    })
)
const parentInstance = getCurrentInstance()?.parent

const handleConfirm = async () => {
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: null })
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}

const instanceRefs = markRaw({
    parentInstance,
    modalActionConfirm,
    modalActionCancel,
   }) as BatchInSelectInstanceRefs

const gridAction = reactive(new TAction(dataSource, instanceRefs))
const batchGridAction = reactive(new TBatchAction(batchDataSource, instanceRefs))
gridAction.instanceRefs.detailGridAction = batchGridAction
batchGridAction.instanceRefs.gridAction = gridAction

onMounted(() => {
    dataSource.dataSet = props.defaultDatas
})
</script>
<style lang="scss" scoped>
.form-container{
        display: flex;
        flex-direction: column;
        height: 100%;
        .win-body{
            display: flex;
            flex: 1;
            min-height: 0;
            .grid{
                height: 100%;
            }
            .win-body-left{
                flex: 1;
                min-height: 0;
            }
            .win-body-right{
                width: 450px;
                min-height: 0;
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