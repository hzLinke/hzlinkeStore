<template>
    <div class="form">
        <lkx-row gutter=10>
            <lkx-col class="lkxCol" :span="24">
                <div class="col-box-item">
                    <label>原密码</label>
                    <input type="password" required autocomplete="new-password" autofocus placeholder="请输入原密码" v-model="RowData.curPassWord" />
                </div>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="lkxCol" :span="24">
                <div class="col-box-item">
                    <label>新密码</label>
                    <input type="password" required autocomplete="new-password" placeholder="新密码" v-model="RowData.newPassWord" />
                </div>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="lkxCol" :span="24">
                <div class="col-box-item">
                    <label>确认密码</label>
                    <input type="password" required autocomplete="new-password" placeholder="确认密码" v-model="RowData.ConfirmPassWord" />
                </div>
            </lkx-col>
        </lkx-row>
        <div class="win-action">
            <button class="modal-button" @click="handleCancel">取消</button>
            <button type="submit" class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, getCurrentInstance } from 'vue'
import { LkxRow, ModalResultEnum } from '@v4x/ui'
import { LkxCol } from '@v4x/ui'
import $api from '@/request/api'
import md5 from 'js-md5'
import { MessageBox } from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import {  ChangePwdOptions } from './types'
import userAppStore from '@/stores'

defineOptions({
    name: 'WinChangePwd'
})

const props = withDefaults(defineProps<ChangePwdOptions>(), {
    datas: () => ({}),
    rowIndex: -1,
    listDatas: () => []
})

const parentInstance = getCurrentInstance()?.parent

const RowData = ref({
    ConfirmPassWord: '',
    newPassWord: '',
    curPassWord: ''
})

const handleConfirm = async () => {
    const loginDatas = userAppStore().loginDatas
    const ApiPath = '/masterapi/publicApi/'
    
    if (md5(RowData.value.curPassWord) != loginDatas.pwd) {
        MessageBox.warning({
            title: '警告',
            content: '原密码不正确',
            showCancel: false
        })
        return
    }
    if (!RowData.value.newPassWord) {
        MessageBox.warning({
            title: '警告',
            content: '请输入新密码',
            showCancel: false
        })
        return
    }
    if (RowData.value.newPassWord != RowData.value.ConfirmPassWord) {
        MessageBox.warning({
            title: '警告',
            content: '两次密码不相等',
            showCancel: false
        })
        return
    }
    const res = await $api.editData(ApiPath, {
        tableName: 'L_Basic_User_Tab',
        keyFieldName: 'idCode',
        keyFieldValue: loginDatas.idcode,
        datas: [{ passWord: md5(RowData.value.ConfirmPassWord), pwd: md5(RowData.value.ConfirmPassWord) }]
    })
    if (res && res.errCode != 0) {
        return
    } else {
        await MessageBox.information({
            title: '信息',
            content: '密码修改成功',
            showCancel: false
        })
        setTimeout(() => {
            modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: null })
        }, 100)
    }
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
</script>

<style lang="scss" scoped>
.form {
    display: flex;
    flex-direction: column;
    gap: 10px;
}
.lkxCol {
    display: flex;
    &-title {
        flex: 1;
    }
}
.col-box-item {
    display: flex;
    align-items: center;
    padding: 10px;
    height: 24px;
    flex: 1;
    label {
        width: 60px;
    }
    input {
        height: 24px;
        flex: 1;
        outline: none;
        outline-color: red;
        :active {
            border: 1px solid red;
        }
    }
}
.win-action {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    padding: 10px 20px;
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
