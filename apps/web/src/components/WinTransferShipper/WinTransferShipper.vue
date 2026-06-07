<template>
<div class="form-container">
    <div class="win-body">
        <LkxInput v-model="targetShipperCode" class="input_item" :config="shipperState.config" :dropConfig="shipperState.dropConfig" "/>
        <LkxInput v-model="transferNum" class="input_item" :config="{caption:'数量', captionWidth: 70, captionAlign: 'right',inputType:'number',disabled:!allowChangeNum}" />
        <LkxInput v-model="transferPrice" class="input_item" :config="{caption:'价格', captionWidth: 70, captionAlign: 'right',inputType:'number'}" />
    </div>
    <div class="win-action">
        <LkxButton caption="取消" type='default'   @click="handleCancel" ></LkxButton>
        <LkxButton caption="确定" type="default"   @click="handleConfirm" ></LkxButton>
    </div>
</div>
</template>

<script setup lang="ts">
import { ref, getCurrentInstance} from 'vue'
import {LkxInput,LkxButton, InputOptionsType, TableRowDataType, ModalResultEnum} from '@v4x/ui'
import { useAppStore } from '@/stores'
import { modalActionConfirm,modalActionCancel } from '@v4x/utils'
import { TransferShipperOptions } from './types'

defineOptions({
    name: 'WinTransferShipper'
})

const props = withDefaults(defineProps<TransferShipperOptions>(), {
    defaultShipperCode: 0,
    defaultCostPrice: 0,
    defaultNum: 0,
    allowChangeNum: true,
})

const extractNumber = (value: any): number => {
    if (typeof value === 'number') return value
    if (!value) return 0
    const numStr = String(value).replace(/[^0-9.]/g, '')
    const parts = numStr.split('.')
    if (parts.length > 2) {
        return Number(parts[0] + '.' + parts.slice(1).join(''))
    }
    return Number(numStr) || 0
}

const appStore = useAppStore()
const targetShipperCode = ref(props.defaultShipperCode)
const transferPrice = ref(props.defaultCostPrice)
const transferNum = ref(extractNumber(props.defaultNum))

const shipperState = ref<InputOptionsType>({
    config: {
        caption: '供货商', 
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|shortname|name',
        displayFieldWidths: '50|80|300',
        dropListDatas: appStore.commonDatas.ShipperDatas,
        onFilter: (filterValue: string,dropListDatas: TableRowDataType[]) => {
            const arr = dropListDatas.filter((item: TableRowDataType) => {
                return item.shortname.indexOf(filterValue) != -1 || item.name.indexOf(filterValue) != -1
            })
            return arr
        }
    }
})


const parentInstance = getCurrentInstance()?.parent



const handleConfirm = () => {
    modalActionConfirm(parentInstance,{ action: ModalResultEnum.mrConfirm, data: {
        targetShipperCode: extractNumber(targetShipperCode.value),
        transferPrice: extractNumber(transferPrice.value),
        transferNum: extractNumber(transferNum.value)
    } })
}

const handleCancel = () => {
    modalActionCancel(parentInstance,{ action: ModalResultEnum.mrCancel, data: null })
}
</script>

<style lang="scss" scoped>
.form-container{
    display: flex;
    flex-direction: column;
    height: 100%;
    .win-body{
        flex: 1;
        display: flex;
        flex-direction: column;
        gap: 10px;
        min-height: 0;
        justify-content: center;
        .input_item{
            width: 350px;
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
