<template>
    <div class="password-body">
        <label>请输入管理员密码<input name="ElPassWord" type='password' v-model="passWord"/><button @click="handleLogin">登录</button></label>
    </div>
   
    <div class="but-body">
        <LkxButton class="opbut" :disabled="disabled" type="warning" radius=6 height="30" width="100" caption="删除汇总" IconCls="iconfont iconReg" @ButClick="handleButClick(1)"></LkxButton>
        <LkxButton class="opbut"  :disabled="disabled" type="danger" radius=6 height="30" width="100" caption="开业清库" IconCls="iconfont iconExChange" @ButClick="handleButClick(2)"></LkxButton>
        <LkxButton class="opbut"  :disabled="disabled" type="warning" radius=6 height="30" width="110" caption="初始化数据" IconCls="iconfont  iconExamine" @ButClick="handleButClick(3)"></LkxButton>
        
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, getCurrentInstance } from 'vue'
import md5 from 'js-md5'
import $api from '@/request/api'
import DataHandleWin from "./DeleteGroupWin/DeleteGroupWin.vue"
import { InputBox, ModalResultEnum, WinModal } from '@v4x/ui'
import { TWinForm } from "@/usehook/win"
import commonParam from '@/config'
import { LkxButton } from '@v4x/ui'
import { MessageBox } from '@v4x/ui'

defineOptions({
    name: 'dataHandle'
})

const acctionsTel = ref('')
const disabled = ref(true)
const passWord = ref('')
const Win = reactive(new TWinForm({}))
const Instance = getCurrentInstance()
const proxy: any = Instance && Instance.proxy
const $inputBox = proxy.$inputBox

const DataHandleState = reactive({
    config: {
        open: false,
        title: '汇总删除',
        width: '400px',
        height: '100px',
        type: 'ins',
        operationType: 'DataDeleteGroup',
        rowIndex: -1,
        rowData: {},
        showCancel: false,
        OkCaption: '关闭',
        handleClose: (data: any) => {
            DataHandleState.config.open = false
            if (data.type === 'mrOk') {
                
            }
        }
    }
})

const getCheckCode = async () => {
    const _AccountsCode = commonParam.$appid
    const param = {
        fields: 'appId,Tel',
        sortFields: 'appid',
        condition: `(appid = '${_AccountsCode}')`,
        page: 1,
        pageSize: 0
    }
    const res = await $api.getData('/commonApi/register/', param)
    if (res.errCode === 0 && res.datas.length !== 0) {
        acctionsTel.value = res.datas[0].tel
        if (process.env.NODE_ENV === 'development') {
            return { acctionsTel: acctionsTel.value, checkCode: '123456' }
        } else {
            $api.sendCheckCode(commonParam.$http + 'controller/commonApi/sendSms/index.php',
                {
                    tel: '+86' + acctionsTel.value,
                    version: 'linkeDis'
                }
            ).then((rs) => {
                return { acctionsTel: acctionsTel.value, checkCode: '123456' }
            })
        }
    } else {
        MessageBox.error({
            title: '出错',
            content: `帐号${_AccountsCode}还未注册`,
            showCancel: false
        })
        return { acctionsTel: '', checkCode: '123456' }
    }
    return { acctionsTel: '', checkCode: '123456' }
}

const checkCodeIsValid = async () => {
    await getCheckCode()
    const InputRes = await InputBox.show({ title: '验证码核对', description: '请输入验证码', inputType: 'text', defaultValue:'',note: '' })
    if (InputRes.action === ModalResultEnum.mrConfirm) {
        const param = {
            acctionTel: acctionsTel.value,
            checkCode: InputRes.data
        }
        const res = await $api.comonRequest('/commonApi/register/', 'checkCodeIsValid', param)
        if (res.errCode === 0) {
            return true
        }
        MessageBox.error({
            title: '出错',
            content: res.errMsg,
            showCancel: false
        })
        return false
    }
}

const DataEmpty = async () => {
    const x = await MessageBox.question({
        title: '提问',
        content: '开业清库，将删除所有业务数据（基本资料除外）？',
        defaultButton: ModalResultEnum.mrCancel
    })
    if (x.action === ModalResultEnum.mrCancel) return
    
    const res = await checkCodeIsValid()
    if (!res) {
        return
    }
    
    const qres = await MessageBox.question({
        title: '提问',
        content: '验证码正确，再次确认！！！，开业清库，将删除所有业务数据（基本资料除外）？',
        defaultButton: ModalResultEnum.mrCancel
    })
    if (qres.action === ModalResultEnum.mrCancel) return
    
    MessageBox.loading({
        moreText: '正在开业清库...',
        mask: true
    })
    setTimeout(() => {
        $api.comonRequest('/masterApi/disApi/sys/DataHandle/', 'DataEmpty', {}).then((rs) => {
            MessageBox.closeAllLoading()
            if (rs.errCode !== 0) {
                return
            }
            MessageBox.information({
                title: '信息',
                content: '开业清库成功',
                showCancel: false
            })
        })
    }, 1000)
}

const DataInit = async () => {
    const x = await MessageBox.question({
        title: '提问',
        content: '初始化数据，将删除所有业务数据（包括基本资料）？',
        defaultButton: ModalResultEnum.mrCancel
    })
    if (x.action === ModalResultEnum.mrCancel) return
    
    const res = await checkCodeIsValid()
    if (!res) {
        return
    }
    
    const qres = await MessageBox.question({
        title: '提问',
        content: '验证码正确，再次确认！！！，初始化数据，将删除所有业务数据（包括基本资料）？',
        defaultButton: ModalResultEnum.mrCancel
    })
    if (qres.action === ModalResultEnum.mrCancel) return
    
    MessageBox.loading({
        moreText: '正在初始化数据...',
        mask: true
    })
    setTimeout(() => {
        $api.comonRequest('/masterApi/disApi/sys/DataHandle/', 'DataInit', {}).then((rs) => {
            MessageBox.closeAllLoading()
            if (rs.errCode !== 0) {
                return
            }
            MessageBox.information({
                title: '信息',
                content: '初始化数据成功',
                showCancel: false
            })
        })
    }, 1000)
}

const login = async (passWord: string) => {
    const param = {
        tableName: 'L_Basic_User_Tab',
        fields: 'IdCode,Name,pwd',
        sortFields: 'idCode',
        condition: `idcode=1 and pwd='${passWord}'`,
        page: 1,
        pageSize: 0
    }
    const res = await $api.getData('/masterapi/publicApi/', param)
    if (res.errCode === 0 && res.datas.length !== 0) {
        disabled.value = false
        MessageBox.information({
            title: '信息',
            content: '系统管理员密码正确，您可以后续操作',
            showCancel: false
        })
    } else {
        MessageBox.error({
            title: '出错',
            content: '系统管理员密码错误',
            showCancel: false
        })
    }
}

const handleLogin = () => {
    login(md5(passWord.value))
    passWord.value = ''
}

const handleButClick = (type: number) => {
    switch (type) {
        case 1:
            DataHandleState.config.title = '汇总删除'
            DataHandleState.config.operationType = 'DataDeleteGroup'
            DataHandleState.config.open = true
            WinModal.open({
                title: '汇总删除',
                width: 400,
                height: 200,
                content: DataHandleWin
            })
            break
        case 2:
            DataEmpty()
            break
        case 3:
            DataInit()
            break
    }
}
</script>

<style lang="scss" scoped>
    .password-body{
        padding: 20px;
        label{
            padding-left: 20px;
        }
        input{
            margin-left: 10px;
            height: 26px;
            outline: none;
           
        }
        button{
            width: 80px;
            height: 30px;
            margin-left: 10px;
            border: 1px solid #dcdfe6;
            outline: none;
            display: inline-block;
            border-radius: 4px;
            cursor: pointer;
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
    .but-body{
        padding:20px 40px;
        display: flex;
        *{
            margin: 0 10px;
        }
    }
    .init-password-body{
        padding:20px 40px;
        display: flex;
        .User-input{
            width: 300px;
        }
    }

    
</style>