<template>
<div class="form-container">
    <div class="win-hearder">
        <lkxInput name="ElSearch" ref='InputEl' autocomplete="off" 
            style="width: 500px;"
            placeholder="F3定位到些处，可输入品名查找 Enter生效" 
            v-model="inputText" 
            :config = "{inputType:'text',caption:'请输入查找条件',captionWidth:120,captionAlign:'right'}"
            @keyup.stop="handleInputKeyDown" @change="handleSearch"
        />
    </div>
    <div class="win-body">
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
import { TAction } from './action'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { ProductSelectInstanceRefs, ProductSelectOptions } from './types'

defineOptions({
    name: 'WinProductSelect'
})

const props = withDefaults(defineProps<ProductSelectOptions>(), {
    customerCode: 0,
    billType: 0,
    defaultDatas: (): TableRowDataType[] => []
})

const lkxGrid = useTemplateRef('lkxGrid')
const InputEl = useTemplateRef('InputEl')
const inputText = ref('')

const dataSource = reactive(
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
    searchBoxInstance: InputEl.value,
    parentInstance,
    modalActionConfirm,
    modalActionCancel
}) as ProductSelectInstanceRefs

const gridAction = reactive(new TAction(dataSource, instanceRefs))

gridAction.getParams = {
    procName: 'Sp_GetProductInfEx',
    procParmars: {
        inputText: '10001',
        mchCode: '',
        customerCode: props.customerCode,
        StoreCode: 1,
        AreaCode: 0,
        BillType: props.billType,
        IsS4: false
    }
}

if ([0, 1, 2, 6, 7, 8, 9, 10, 16, 22].indexOf(+props.billType) > -1) {
    gridAction.Columns = gridAction.InColumns
}

const handleSearch = (e: Event) => {
    const params = gridAction.getParams as any
    params.procParmars.inputText = inputText.value
    inputText.value = ''
    gridAction.open()
}

const handleInputKeyDown = (e: KeyboardEvent) => {
    switch (e.key) {
        case 'Escape':
            handleCancel()
            break
        case 'ArrowDown':
            lkxGrid.value?.active()
            break
    }
}

nextTick(() => {
    if (props.defaultDatas.length !== 0) {
        lkxGrid.value?.active()
    } /* else {
        InputEl.value&&InputEl.value.focus()
    } */
})

onMounted(() => {
    dataSource.dataSet = props.defaultDatas
})
</script>
<style lang="scss" scoped>
.form-container{
        display: flex;
        flex-direction: column;
        height: 100%;
        .win-hearder{
            height: 45px;
            flex-shrink: 0;
            border-bottom: 1px solid #e4e7ed ;
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