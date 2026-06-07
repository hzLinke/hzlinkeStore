<template>
    <div class="form">
        <lkx-input class="payType-input"
            :name="AccountsOutState.fieldName"
            :config="AccountsOutState.config"
            :dropConfig="AccountsOutState.dropConfig"
            v-model:value="rowData.AccountsOutCode"
        />
        <lkx-input class="payType-input"
            :name="AllowMoneyState.fieldName"
            :config="AllowMoneyState.config"
            v-model:value="rowData.AllowMoney"
        />
        <lkx-input class="payType-input"
            :name="AccountsInState.fieldName"
            :config="AccountsInState.config"
            :dropConfig="AccountsInState.dropConfig"
            v-model:value="rowData.AccountsInCode"
        />
        <lkx-input class="payType-input"
            :name="SwapMoneyState.fieldName"
            :config="SwapMoneyState.config"
            v-model:value="rowData.SwapMoney"
        />
        <lkx-input class="payType-input"
            :name="NoteState.fieldName"
            :config="NoteState.config"
            v-model:value="rowData.Note"
        />
        <div class="win-action">
            <button class="modal-button" @click="handleCancel">取消</button>
            <button type="submit" class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, computed, reactive, getCurrentInstance } from 'vue'
import $api from '@/request/api'
import userOpts from '@/usehook/userOpts'
import { InputOptionsType, LkxInput, ModalResultEnum } from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { AccountsMoneySwapInstanceRefs, AccountsMoneySwapOptions } from './types'

defineOptions({
    name: 'WinAccountsMoneySwap'
})

const props = withDefaults(defineProps<AccountsMoneySwapOptions>(), {
    datas: () => ({}),
    rowIndex: -1,
    listDatas: () => []
})

const rowData = computed(() => props.datas)
const { state, funcList } = userOpts()
const parentInstance = getCurrentInstance()?.parent

const AccountsOutState = ref<InputOptionsType>({
    fieldName: 'AccountsOut',
    config: {
        caption: '转出帐号',
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
            $api.getData('/masterApi/HrApi/Basic/other/accountType/', {
                keyFieldName: "IdCode",
                sortFields: 'IdCode',
                condition: `IdCode=${data.idcode}`,
            }).then((res: any) => {
                if (res.errCode == 0) {
                    rowData.value.AllowMoney = res.datas[0].money
                }
            })
        }
    },
    dropConfig: {
        allowInput: false,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '50|100',
        dropListDatas: state.commonDatas.accounts
    }
})

const AccountsInState = ref<InputOptionsType>({
    fieldName: 'AccountsIn',
    config: {
        caption: '转入帐号',
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {}
    },
    dropConfig: {
        allowInput: false,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '50|100',
        dropListDatas: state.commonDatas.accounts
    }
})

const AllowMoneyState = ref<InputOptionsType>({
    fieldName: 'Money',
    config: {
        caption: '可用余额',
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'number',
        disabled: true,
        onChange: (data: any) => {}
    }
})

const SwapMoneyState = ref<InputOptionsType>({
    fieldName: 'SwapMoney',
    config: {
        caption: '转账金额',
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'number',
        disabled: false,
        onChange: (data: any) => {}
    }
})

const NoteState = ref<InputOptionsType>({
    fieldName: 'Note',
    config: {
        caption: '操作说明',
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'text',
        onChange: (data: any) => {}
    }
})

const handleConfirm = () => {
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: rowData.value })
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
</script>

<style lang="scss" scoped>
.form {
    display: flex;
    flex-direction: column;
    .payType-input {
        padding-bottom: 10px;
    }
}
.win-action {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-top: 10px;
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
