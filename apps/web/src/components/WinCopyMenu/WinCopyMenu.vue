<template>
    <div class="form">
        <div class="win-hearder">
            <lkx-input class="Input-At"
                :config="copyAtState.config"
                v-model="copyAt"
            />
            <lkx-input class="shipper-input"
                :name="CustomerState.fieldName"
                :config="CustomerState.config"
                :dropConfig="CustomerState.dropConfig"
                v-model="CustomerCode"
            />
            <LkxButton caption="应用" type='default' width="100" @click="handleApplay"></LkxButton>
        </div> 
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
            <LkxButton caption="取消" type='default' @click="handleCancel"></LkxButton>
            <LkxButton caption="确定" type="default" @click="handleConfirm"></LkxButton>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, getCurrentInstance } from "vue"
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import $Utils from '@v4x/utils/lkxUtil'
import { InputOptionsType, ModalResultEnum } from '@v4x/ui'
import { LkxInput, LkxButton, LkxGrid } from '@v4x/ui'
import useAppStore from "@/stores"
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { CopyMenuInstanceRefs, CopyMenuOptions } from './types'

defineOptions({
    name: 'WinCopyMenu'
})

const props = withDefaults(defineProps<CopyMenuOptions>(), {
    customerCode: 0,
})

const CustomerCode = ref(props.customerCode)
const copyAtState = ref<InputOptionsType>({
    config: {
        caption: '复制日期',
        captionWidth: 80,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd'
    }
})

const CustomerState = ref<InputOptionsType>({
    fieldName: 'PayTarge',
    config: {
        caption: '客户',
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {}
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '60|200',
        dropListDatas: useAppStore().commonDatas.CustomerDatas,
        onFilter: (filterValue: string) => {
            const CurArr = useAppStore().commonDatas.CustomerDatas
            const arr = CurArr.filter((item: any) => {
                return item.name.toLowerCase().indexOf(filterValue.toLowerCase()) != -1
            })
            return arr
        }
    }
})

const copyAt = ref($Utils.getDate('d', 0))

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/saleOrder/BillDetail/',
        KeyFieldName: 'IdKey',
        NotAllowOperationList: [],
        getParmars: { sortFields: 'IdKey', pageSize: 0 }
    })
)

const parentInstance = getCurrentInstance()?.parent

const instanceRefs = {
    parentInstance,
    modalActionConfirm,
    modalActionCancel
} as CopyMenuInstanceRefs

const gridAction = reactive(new TAction(dataSource, instanceRefs))

const handleApplay = (e: Event) => {
    if (CustomerCode.value === 0) return
    dataSource.getParams.condition = `deliveryAt='${copyAt.value}' and CustomerCode=${CustomerCode.value}`
    gridAction.open()
}

const handleConfirm = () => {
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: { customerCode: CustomerCode.value, copyAt: copyAt.value } })
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
    .win-hearder {
        height: 40px;
        flex-shrink: 0;
        border-bottom: 1px solid #e4e7ed ;
        display: flex;
        align-items: center;
        .Input-At {
            margin-left: 10px ;
            width: 250px;
        }
        .shipper-input {
            width: 400px;
        }
        button {
            margin-left: 10px ;
            width: 100px;
        }
    }
    .win-grid {
        flex: 1;
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
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
    }
}
</style>
