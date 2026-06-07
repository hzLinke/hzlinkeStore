<template>
    
    <div class="bg">
       
        <div v-if="!isInitPassWord&&isAccounts" id="login">  
            <h1>Login</h1>
            <label class="input-container">
                <span>帐套:</span>   
                <LkxInput  class="acctions-input"
                    fieldName="acctionsBookCode"
                    :config="acctionsConfig"
                    :dropConfig="acctionsDropConfig"
                    v-model="acctionsBookCode"
                />
            </label>
            <label class="input-container">
                <span>工号:</span>   
                <input name="ElAcction" type="text" required  autocomplete="off" placeholder="工号/手机号"  v-model="acction" autofocus @keypress="handleAcctionKeyPress"/>
            </label>
            <label class="input-container">
                <span>密码:</span>
                <input name="ElPassWord" ref="passWordEl" type="password" required autocomplete="off" placeholder="密码"  v-model="passWord" />
            </label>
            <div class="but-bar">
                <button class="but" @click="handleLogin">登录</button>
            </div> 
            <div class="reg-bar" >
                <span class="reg-bar-set" href="" @click="isAccounts=false">帐号设置</span>
                <span class="reg-bar-reg" href="" @click="handelRegister">帐号注册</span>
                <span class="reg-bar-pwd" href="" @click="hanleCheckType(true)">忘记密码</span>
            </div>
        </div>  
        <div v-if="isInitPassWord" id="initPasword">  
            <h1>密码重置</h1>
            <label class="input-container">
                <span>帐号:</span>   
                <input type="text" required  autocomplete="off" placeholder="手机号码"  v-model="initAcction" autofocus />
            </label>
            <label class="input-container">
                <span>密码:</span>
                <input type="password" required autocomplete="off" placeholder="新密码"  v-model="initPassWord" />
            </label>
            <label class="input-container">
                <span>验证码:</span>
                <input type="password" required autocomplete="off" placeholder="验证码"  v-model="checkCode" />
                <button class="getcheckcodebut" @click="handleGetCheckCode">获取验证码</button>
            </label>
            <div class="initbut-bar" style="margin-top: 30px;">
                <button class="but1" @click="handleInitPassWord">重置</button>
                <button class="but2" @click="hanleCheckType(false)">取消</button>
            </div>
        </div>  
        <div v-if="!isAccounts" id="accountsWin">  
            <h1>帐号设置</h1>
            <label class="input-container">
                <span>帐号:</span>   
                <input type="text" required  autocomplete="off" placeholder="帐号一般是执照号"  v-model="acctionsCode" autofocus />
            </label>
            
            <label class="input-container" style="margin-top: 30px;">
                <span>验证码:</span>
                <input  required autocomplete="off" placeholder="验证码"  v-model="checkCode" />
                <button  class="getcheckcodebut" @click="handleGetAcctionsCheckCode">获取验证码</button>
            </label>

            <div class="initbut-bar" style="margin-top: 30px;">
                <button :disabled="!allowedAcctionsSet" class="but1" @click="handleSetAcctions">设置</button>
                <button class="but2" @click.stop="">注册</button>
            </div>
        </div> 
    </div>
</template>

<script setup lang="ts">
import { ref, shallowRef, computed, onMounted } from 'vue'
import { useRouter } from "vue-router"
import { LkxInput, MessageBox, type ModalResultValue, type InputConfigType, type InputDropConfigType } from '@v4x/ui'
import md5 from 'js-md5'
import api from '@/request/api'
import commonParam from '@/config'
import useAppStore from '@/stores'

defineOptions({
    name: 'Login'
})

interface AccountItem {
    idcode: number
    bookname: string
    appid: string
    linkname: string
    ltdname: string
    imagepath: string
}

interface AccountInfo {
    version: string
    appid: string
    ltdname: string
    imagepath: string
    enddat: number
    bookList: AccountItem[]
}

const router = useRouter()

const isInitPassWord = ref(false)
const isAccounts = ref(true)
const acction = ref('')
const passWord = ref('')
const acctionsBookCode = ref(0)
const passWordEl = ref<HTMLInputElement | null>(null)

const acctionsCode = ref('')
const acctionsTel = ref('')
const allowedAcctionsSet = ref(false)
const acctionsList = ref<AccountItem[]>([
    { idcode: 0, bookname: '', appid: '', linkname: '', ltdname: '', imagepath: '' }
])

const userCode = ref(-1)
const initAcction = ref('')
const initPassWord = ref('')
const checkCode = ref('')

const acctionsConfig = shallowRef<InputConfigType>({
    caption: '',
    captionWidth: 70,
    align: 'left',
    captionAlign: 'right',
    inputType: 'drop',
    onChange: (val: string | number) => {
        const item = acctionsList.value.find(a => a.idcode === val)
        if (item) {
            commonParam.$bookname = item.bookname
            commonParam.$linkname = item.linkname
        }
    }
})

const acctionsDropConfig = computed<InputDropConfigType>(() => ({
    allowInput: false,
    allowFilter: false,
    dropListPosition: {},
    resultFieldName: 'idcode',
    displayFieldName: 'bookname',
    displayFields: 'idcode|bookname',
    displayFieldWidths: '30|200',
    dropListDatas: acctionsList.value,
}))

const getAccounts = async () => {
    const _AccountsCode = localStorage.getItem('AccountsCode')
    if (!_AccountsCode) return _AccountsCode
    
    MessageBox.loading({
        moreText: '正在获取帐套信息...',
        mask: true
    })
    
    const param = {
        fields: '*',
        sortFields: 'appid',
        condition: `(appid = '${_AccountsCode}')`,
        page: 1,
        pageSize: 0
    }
    
    try {
        const res = await api.getData('/commonApi/register/', param)
        if (res.errCode == 0 && res.datas.length != 0) {
            const acctionsInfo: AccountInfo = res.datas[0]
            acctionsList.value = acctionsInfo.bookList
            
            commonParam.$useVersion = acctionsInfo.version
            commonParam.$appid = acctionsInfo.appid
            commonParam.$ltdname = acctionsInfo.ltdname
            commonParam.$bookname = acctionsList.value[0].bookname
            commonParam.$linkname = acctionsList.value[0].linkname
            commonParam.$picSrc = acctionsInfo.imagepath + commonParam.$linkname
            commonParam.$endDat = acctionsInfo.enddat
        } else {
            MessageBox.error({
                title: '出错',
                content: '帐号不存在，请重新设置',
                showCancel: false
            }).then((rs: ModalResultValue) => {

                if (res.errCode != 40001) {
                    isAccounts.value = false
                }
            })
        }
    } finally {
        setTimeout(() => MessageBox.closeAllLoading(), 50)
    }
    
    return _AccountsCode
}

const setAccounts = async (AccountsCode: string, acctionTel: string) => {
    const param = {
        acctionTel: acctionTel,
        checkCode: checkCode.value
    }
    const res = await api.comonRequest('/commonApi/register/', 'checkCodeIsValid', param)
    if (res.errCode == 0) {
        localStorage.setItem('AccountsCode', AccountsCode)
        MessageBox.information({
            title: '信息',
            content: '帐号设置成功,将刷新页面',
            showCancel: false
        }).then((rs: ModalResultValue) => {
            window.location.reload()
        })
    } else {
        MessageBox.error({
            title: '出错',
            content: res.errMsg,
            showCancel: false
        })
    }
}

const login = async (acction: string, passWord: string) => {
    MessageBox.loading({ moreText: '正在登录...' })
    const param = {
        tableName: 'L_Basic_User_Tab',
        fields: 'IdCode,Tel,Name,post,pwd,LookSelfOrder',
        sortFields: 'idCode',
        condition: `(cast(IdCode as varchar(20))='${acction}' or tel='${acction}') and pwd='${passWord}' and status=0`,
        page: 1,
        pageSize: 0
    }
    const res = await api.getData('/masterapi/publicApi/', param)
    MessageBox.closeAllLoading()
    if (res.errCode == 0 && res.datas.length != 0) {
        sessionStorage.setItem('loginDatas', JSON.stringify(res.datas[0]))
        useAppStore().loginDatas = res.datas[0]
        router.replace({
            name: 'Home',
            params: {}
        })
    } else {
        MessageBox.error({
            title: '出错',
            content: '帐号密码错误或者帐号被停用',
            showCancel: false
        })
    }
}

const handleLogin = () => {
    if (commonParam.$endDat < 0) {
        MessageBox.error({
            title: '出错',
            content: '服务到期，请联系系统供应商',
            showCancel: false
        })
        return
    }
    login(acction.value, md5(passWord.value))
}

const handleAcctionKeyPress = (e: KeyboardEvent) => {
    if (e.key == 'Enter') {
        passWordEl.value?.focus()
    }
}

const handelRegister = () => {
    router.replace({ name: 'Register' })
}

const hanleCheckType = (type: boolean) => {
    isInitPassWord.value = type
}

const handleGetCheckCode = async () => {
    if (!initAcction.value) {
        MessageBox.error({
            title: '出错',
            content: '必须输入帐号',
            showCancel: false
        })
        return
    }
    const param = {
        tableName: 'L_Basic_User_Tab',
        fields: 'idCode,tel',
        sortFields: 'idCode',
        condition: `(status = 0 and tel='${initAcction.value}')`,
        page: 1,
        pageSize: 0
    }
    const res = await api.getData('/masterapi/publicApi/', param)
    if (res.errCode == 0 && res.datas.length != 0) {
        userCode.value = res.datas[0].idcode
        api.sendCheckCode(commonParam.$http + 'controller/commonApi/sendSms/index.php', {
            tel: '+86' + res.datas[0].tel,
            version: 'linkeDis'
        })
    } else {
        MessageBox.error({
            title: '出错',
            content: '帐号错误或停用',
            showCancel: false
        })
    }
}

const handleInitPassWord = async () => {
    if (!initPassWord.value) {
        MessageBox.error({
            title: '出错',
            content: '必须输入新密码',
            showCancel: false
        })
        return
    }

    const res = await api.comonRequest('/masterApi/disApi/basic/user/', 'initPassWord', {
        acctionTel: initAcction.value,
        checkCode: checkCode.value,
        userCode: userCode.value,
        passWord: md5(initPassWord.value)
    })
    if (res && res.errCode == 0) {
        MessageBox.information({
            title: '成功',
            content: '密码重置成功',
            showCancel: false
        })
        isInitPassWord.value = false
    }
}

const handleGetAcctionsCheckCode = async () => {
    if (!acctionsCode.value) {
        MessageBox.error({
            title: '出错',
            content: '必须输入帐号',
            showCancel: false
        })
        return
    }
    const param = {
        fields: '*',
        sortFields: 'appid',
        condition: `(appid = '${acctionsCode.value}')`,
        page: 1,
        pageSize: 0
    }
    const res = await api.getData('/commonApi/register/', param)
    if (res.errCode == 0 && res.datas.length != 0) {
        acctionsTel.value = res.datas[0].tel
        if (process.env.NODE_ENV === 'development') {
            allowedAcctionsSet.value = true
        } else {
            api.sendCheckCode(commonParam.$http + 'controller/commonApi/sendSms/index.php', {
                tel: '+86' + acctionsTel.value,
                version: 'linkeDis'
            }).then((rs) => {
                allowedAcctionsSet.value = rs
            })
        }
    } else {
        MessageBox.error({
            title: '出错',
            content: `帐号${acctionsCode.value}还未注册`,
            showCancel: false
        })
    }
}

const handleSetAcctions = () => {
    if (!acctionsCode.value) {
        MessageBox.error({
            title: '出错',
            content: '必须输入帐号',
            showCancel: false
        })
        return
    }
    if (!checkCode.value) {
        MessageBox.error({
            title: '出错',
            content: '必须输入验证码',
            showCancel: false
        })
        return
    }
    setAccounts(acctionsCode.value, acctionsTel.value)
}

onMounted(() => {
    if (process.env.NODE_ENV === 'development') {
        commonParam.$http = 'http://127.0.0.1:3054/linkeSystemApi/V4/'
        commonParam.$picSrc = 'http://127.0.0.1:3054/linkeSystemApi/upImage/'
    } else {
        commonParam.$http = window.location.origin + '/linkeSystemApi/V4/'
        commonParam.$picSrc = window.location.origin + '/linkeSystemApi/upImage/'
    }
    getAccounts().then((rs) => {
        isAccounts.value = !!rs
    })
})
</script>

<style lang="scss" scoped>
html,body{
    overflow: hidden;
}
.input-container{
    display: flex;
    align-items: center;
    padding: 5px 0;
    span{
        display: inline-block;
        color: #fff;
        width: 60px;
    }
    button{
        width: 90px;
        height: 38px;
    }
    input{
        flex: 1;
        min-width: 0;
    }
    .acctions-input{
         flex: 1;
    }
}
.bg{
    height: 100vh;
    background-color: #4A374A;  
    background-image: url(../assets/login-bg.jpg);
    background-size: 100%;
    background-repeat: repeat;
    overflow: hidden;
}
.but-bar{
    padding-top: 20px;
    display: flex;
    cursor: pointer;
}
.reg-bar{
    padding-top: 20px;
    font-size: 13px;
    display: flex;
    cursor: pointer;
    
    &-set{
        text-decoration : none;
        color: #fff;
        padding-left: 10px;
        flex: 0 0 33.3333%;
    }
    &-reg{
        text-decoration : none;
        color: #fff;
        padding-left: 10px;
        flex: 0 0 33.3333%;
    }
    &-pwd{
        float: right;
        text-decoration : none;
        color: #fff;
        padding-right: 10px;
        flex: 0 0 33.3333%;
    }
}
#login,#initPasword,#accountsWin{   
    position: absolute;   
    top: 50%;   
    left:80%;   
    margin: -150px 0 0 -150px;   
    width: 300px;   
    height: 330px;  
    border: 1px solid #3762bc; 
    border-radius: 5px;
    padding: 0 10px;
}   

#login h1,#initPasword h1,#accountsWin h1{   
    color: #fff;   
    text-shadow:0 0 10px;   
    letter-spacing: 1px;   
    text-align: center;   
}   
h1{   
    font-size: 2em;   
    margin: 0.67em 0;   
}   
input{   
    outline: none;   
    padding: 10px;   
    font-size: 13px;     
    border-top: 1px solid #312E3D;   
    border-left: 1px solid #312E3D;   
    border-right: 1px solid #312E3D;   
    border-bottom: 1px solid #56536A;   
    border-radius: 4px;    
}   
.but{   
    width: 300px;   
    min-height: 20px;   
    background-color: #4a77d4;   
    border: 1px solid #3762bc;   
    color: #fff;  
    margin-top: 10px ; 
    padding: 9px 14px;   
    font-size: 15px;   
    line-height: normal;   
    border-radius: 5px;   
    cursor: pointer;
    margin: 0;   
}  
.but1{   
    width: 140px;   
    min-height: 20px;   
    background-color: #4a77d4;   
    border: 1px solid #3762bc;   
    color: #fff;  
    margin-top: 10px ; 
    padding: 9px 14px;   
    font-size: 15px;   
    line-height: normal;   
    border-radius: 5px;   
    cursor: pointer;
    margin: 0;   
}  
.but2{   
    width: 140px;   
    min-height: 20px;   
    background-color: #cbd44a;   
    border: 1px solid #3762bc;   
    color: #fff;  
    padding: 9px 14px;   
    margin-left: 20px;
    font-size: 15px;   
    line-height: normal;   
    border-radius: 5px;   
}  
.getcheckcodebut{
    width: 140px;   
    min-height: 20px;   
    background-color: #4a77d4;   
    border: 1px solid #3762bc;   
    color: #fff;  
    margin-top: 10px ; 
    padding: 9px 14px;   
    font-size: 12px;   
    line-height: normal;   
}
</style>
