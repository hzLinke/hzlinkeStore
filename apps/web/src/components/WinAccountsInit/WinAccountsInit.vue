<template>
    <div class="form">
        <div class="pay-body-content">
            <LkxGrid ref='lkxGrid' class="grid"
                :columns="(state as any).columns"
                :datas="datas"
                :methods="(state as any).methods"
                :tableConfig="(state as any).tableConfig"
                :toolsBarConfig="(state as any).toolsBarConfig"
                :modalConfig="(state as any).modalConfig"
                :serachBoxConfig="(state as any).serachBoxConfig"
                :pagerConfig="(state as any).pagerConfig"
                :loading="state.loading"
                :loadText="state.loadText"
            >
            </LkxGrid>
        </div>
        <div class="win-action">
            <button type="submit" class="modal-button modal-button-primary" @click="handleOptClick(2)">提交</button>
            <button class="modal-button" @click="handleOptClick(1)">关闭</button>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, getCurrentInstance } from 'vue'
import $api from '@/request/api'
import $Utils from '@v4x/utils/lkxUtil'
import userOpts from '@/usehook/userOpts'
import { LkxGrid, ModalResultEnum } from '@v4x/ui'
import { modalActionCancel } from '@v4x/utils'
import { AccountsInitOptions } from './types'
import {useAppStore} from '@/stores'
const appStore = useAppStore()

defineOptions({
    name: 'WinAccountsInit'
})

const props = withDefaults(defineProps<AccountsInitOptions>(), {
    datas: () => ({}),
    rowIndex: -1,
    listDatas: () => []
})

const { state, $MessageBox, funcList } = userOpts() as any

const parentInstance = getCurrentInstance()?.parent

const OtherInputState = reactive({
    datas: {
        money: 0,
        note: ''
    },
    rowIndex: -1,
    config: {
        open: false,
        title: '请输入金额',
        width: '430px',
        handleClose: (data: any) => {
            OtherInputState.config.open = false
            if (data.type == 'mrOk') {
                const rowIndex = data.rowIndex || 0
                const _Money = Math.abs(parseFloat(data.datas.money))
                state.datas[rowIndex].initmoney = _Money
            }
        }
    }
})

;(state as any).ApiPath = '/masterApi/HrApi/finance/AccountsInit/'
;(state as any).keyFieldName = 'AccountsCode'
;(state as any).getDefaultParam = {
    fieldName: '*',
    sortFields: 'AccountsCode',
    condition: '',
    returnTotal: true,
    totalFieldSql: '',
    pageSize: 0
}
;(state as any).tableConfig = Object.assign({}, (state as any).tableConfig, { id: 'saleViews-Customer', sep: true, expand: false, opt: false, optWidth: 150, parger: false, toolsbar: false, gridFooter: false })
;(state as any).columns = [
    {
        fieldName: 'name',
        width: 250,
        title: '名称',
        sort: false
    },
    {
        dataType: 'number',
        fieldName: 'initmoney',
        width: 120,
        align: 'right',
        format: '0.00',
        title: '期初金额',
        sort: false
    }
]
;(state as any).methods = $Utils.deepObjectMerge((state as any).methods, {
    sumCalculated: {},
    customFormater: {
        UserFormat: (val: any) => {
            return $Utils.getValueFromArray((state as any).commonDatas.user, 'idcode', 'name', val)
        }
    },
    events: {
        rowDbClick: (_datas: any, _rowdata: any, rowIndex: number, _cellIndex: number, _fieldName: string) => {
            OtherInputState.config.open = true
            OtherInputState.rowIndex = rowIndex
            OtherInputState.datas.money = Math.abs((state as any).datas[rowIndex].initmoney)
        }
    }
})

const handleOptClick = async (Type: number) => {
    switch (Type) {
        case 1:
            modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
            break
        case 2: {
            if ((state as any).datas.length == 0) {
                $MessageBox.warning({ title: '警告', content: '无有期初数据', showCancel: false })
                return
            }
            $MessageBox.loading({
                moreText: '正在期初....',
                mask: true
            })
            const param = {
                DetailJson: JSON.stringify((state as any).datas),
                UserCode: appStore.loginDatas.idcode
            }
            setTimeout(() => {
                $api.comonRequest('/masterApi/HrApi/finance/AccountsInit/', 'submit', param).then((rs) => {
                    if (rs.errCode == 0) {
                        (state as any).datas = []
                        $MessageBox.information({ title: '成功', content: '账号期初成功', showCancel: false })
                    }
                    $MessageBox.closeLoading()
                })
            }, 1000)
            break
        }
    }
}

funcList.getData((state as any).getDefaultParam)
</script>

<style lang="scss" scoped>
.form {
    display: flex;
    flex-direction: column;
    height: 100%;
}
.pay-body-content {
    flex: 1;
    min-height: 0;
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
