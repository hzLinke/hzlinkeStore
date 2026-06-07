<template>
    <div class="form-container">
        <div class="but-container">
            <button class="lkx-col-but" @click="handleSave">保存</button>
        </div>
        <div class="container">
            <lkx-row :gutter="10">
                <lkx-col class="lkxCol" :span="16">
                    <fieldset class="col-box">
                        <legend>基本信息</legend>
                        <div class="col-box-item">
                            <label>名称</label>
                            <input type="text" v-model="RowData.mchname" />
                        </div>
                        <div class="col-box-item">
                            <label>电话</label>
                            <input type="text" v-model="RowData.mchtel"/>
                        </div>
                        <div class="col-box-item">
                            <label>地址</label>
                            <input type="text" v-model="RowData.mchaddr"/>
                        </div>
                        <div class="col-box-item">
                            <label>公告</label>
                            <input type="text" v-model="RowData.noticetext"/>
                        </div>
                    </fieldset>
                </lkx-col>
            </lkx-row>
            <lkx-row :gutter="10">
                <lkx-col class="lkxCol" :span="8">
                    <fieldset class="col-box">
                        <legend>公司logo(110*110图片)</legend>
                        <LkxUploadImgs
                            :limitCount="1"
                            :limitSize="1"
                            :imageStyle="imageStyle"
                            :imageList="srcList.vipSrcList"
                            @picChange="handleVipChange"
                            @picDelete="handleVipDelete"
                            @after-read="handleVipAfterRead"
                        ></LkxUploadImgs>
                    </fieldset>
                </lkx-col>
                 <lkx-col class="lkxCol" :span="8">
                    <fieldset class="col-box">
                        <legend>客服二维码</legend>
                         <LkxUploadImgs
                            :limitCount="1"
                            :limitSize="1"
                            :imageStyle="{height:'150px',width:'150px'}"
                            :imageList="srcList.serviceSrcList"
                            @picChange="handleServiceChange"
                            @picDelete="handleServiceDelete"
                            @after-read="handleServiceAfterRead"
                        ></LkxUploadImgs>
                    </fieldset>
                </lkx-col>
            </lkx-row>
            <lkx-row :gutter="10">
                <lkx-col class="lkxCol" :span="16">
                    <fieldset class="col-box">
                        <legend>轮播(750*250图片)</legend>
                        <LkxUploadImgs
                            :limitCount="4"
                            :limitSize="2"
                            :imageStyle="imageStyle"
                            :imageList="srcList.carouselSrcList"
                            @picChange="handleCarouselChange"
                            @picDelete="handleCarouselDelete"
                            @after-read="handleCarouselAfterRead"
                        ></LkxUploadImgs>
                    </fieldset>
                </lkx-col>
            </lkx-row>
            <lkx-row :gutter="10">
                <lkx-col class="lkxCol" :span="16">
                    <fieldset class="col-box">
                        <legend>公司资质</legend>
                        <LkxUploadImgs
                            :limitCount="20"
                            :limitSize="2"
                            :imageStyle="imageStyle"
                            :imageList="srcList.certificateSrcList"
                            @picChange="handleCertificateChange"
                            @picDelete="handleCertificateDelete"
                            @after-read="handleCertificateAfterRead"
                        ></LkxUploadImgs>
                    </fieldset>
                </lkx-col>
            </lkx-row>
            <lkx-row :gutter="10">
                <lkx-col class="lkxCol" :span="16">
                    <fieldset class="col-box col-box-wx">
                        <legend>小程序(请不要随便更改)</legend>
                        <div class="col-box-item">
                            <label>APPID</label>
                            <input type="text" v-model="RowData.appid" />
                        </div>
                        <div class="col-box-item">
                            <label>APPSECRET</label>
                            <input type="text" v-model="RowData.appsecret" />
                        </div>
                    </fieldset>
                </lkx-col>
            </lkx-row>
            <lkx-row :gutter="10">
                <lkx-col class="lkxCol" :span="16">
                    <fieldset class="col-box col-box-pay">
                        <legend>支付(请不要随便更改)</legend>
                        <div class="col-box-pay-check">
                            <div class="col-box-pay-check-pay">
                                <label><input type="checkbox" :checked="RowData.allowpay==1?true:false" v-model="RowData.allowpay"/>启用在线支付</label>
                            </div>
                        </div>
                        <div class="col-box-item">
                            <label>商户号</label>
                            <input type="text" v-model="RowData.pay_mchid" />
                        </div>
                        <div class="col-box-item">
                            <label>支付密钥</label>
                            <input type="text" v-model="RowData.pay_key"/>
                        </div>
                        <div class="col-box-item">
                            <label>证书路径</label>
                            <input type="text" v-model="RowData.pay_cert_path"/>
                            <button style="width:105px;height:35px">上传证书</button>
                        </div>
                        <div class="col-box-item">
                            <label>回调路径</label>
                            <input type="text" v-model="RowData.pay_notify_url"/>
                        </div>
                    </fieldset>
                </lkx-col>
            </lkx-row>
        </div>
    </div>  
</template>

<script setup lang="ts">
import { reactive, ref,  onMounted } from "vue"
import { LkxRow, LkxCol, LkxUploadImgs, MessageBox } from '@v4x/ui'
import type { UploadImgsFileItem } from '@v4x/ui'
import $api from '@/request/api'
import comonParam from '@/config'

defineOptions({
    name: "wxSysParmas"
})

const $AipPath = '/masterApi/disApi/Sys/WxSysParams/'

const RowData = ref({
    mchname: '',
    mchaddr: '',
    mchtel: '',
    noticetext: '',
    allowpay: 0,
    pay_mchid: '',
    pay_key: '',
    pay_cert_path: '',
    pay_notify_url: '',
    appid: '',
    appsecret: ''
})

const imageStyle = {
    width: '300px',
    height: '150px'
}

const srcList = reactive({
    vipSrcList: [] as UploadImgsFileItem[],
    serviceSrcList: [] as UploadImgsFileItem[],
    carouselSrcList: [] as UploadImgsFileItem[],
    certificateSrcList: [] as UploadImgsFileItem[],
    vipSrcShortList: [] as string[],
    vipSrcFiles: [] as File[],
    serviceSrcShortList: [] as string[],
    serviceSrcFiles: [] as File[],
    carouselSrcShortList: [] as string[],
    carouselSrcFiles: [] as File[],
    certificateSrcShortList: [] as string[],
    certificateSrcFiles: [] as File[],
})

const getDefaultParam = {
    fieldName: '*',
    sortFields: 'idCode',
}

const getData = async (api: string, param: any) => {
    const defaultParam = {
        fieldName: '*',
        condition: '',
        returnTotal: false,
        totalFieldSql: '',
        page: 1,
        pageSize: 0
    }
    const res = await $api.getData(api, Object.assign(defaultParam, param))
    if (res && res.errCode == 0) {
        RowData.value = res.datas[0]
        const picHttp = `${comonParam.$picSrc}/WxSysParms/`
        const _vipsrc = (RowData.value as any).logopic
        const vipsrc = _vipsrc ? _vipsrc.split(';') : []
        srcList.vipSrcShortList = vipsrc
        srcList.vipSrcList = vipsrc.map((item: string) => {
            return {
                name: item,
                url: `${picHttp}${item}`
            }
        })
        const _serviceqrsrc = (RowData.value as any).serviceqrsrc
        const serviceqrsrc = _serviceqrsrc ? _serviceqrsrc.split(';') : []
        srcList.serviceSrcShortList = serviceqrsrc
        srcList.serviceSrcList = serviceqrsrc.map((item: string) => {
            return {
                name: item,
                url: `${picHttp}${item}`
            }
        })
        const _carouselSrcList = (RowData.value as any).adpicurl
        const carouselSrcList = _carouselSrcList ? _carouselSrcList.split(';') : []
        srcList.carouselSrcShortList = carouselSrcList
        srcList.carouselSrcList = carouselSrcList.map((item: string) => {
            return {
                name: item,
                url: `${picHttp}${item}`
            }
        })

        const _certificateSrcList = (RowData.value as any).certificatepic
        const certificateSrcList = _certificateSrcList ? _certificateSrcList.split(';') : []
        srcList.certificateSrcShortList = certificateSrcList
        srcList.certificateSrcList = certificateSrcList.map((item: string) => {
            return {
                name: item,
                url: `${picHttp}${item}`
            }
        })
    }
}

const editData = async (api: string, parmas: any) => {
    const res = await $api.editData(api, parmas)
    if (res && res.errCode == 0) {
        console.log('ok')
        MessageBox.information({
            title: '提示',
            content: '参数保存成功',
            showCancel: false
        })
    }
}

const handleVipChange = (_files: UploadImgsFileItem[]) => {
    srcList.vipSrcList = _files
    srcList.vipSrcShortList = _files.map(f => f.name)
}
const handleVipAfterRead = (_files: any[], newFiles: File[]) => {
    srcList.vipSrcFiles.push(...newFiles)
}
const handleVipDelete = async (index: number) => {
    const res = await deleteImage(srcList.vipSrcShortList[index])
    if (!res) return
    srcList.vipSrcShortList.splice(index, 1)
}
const handleServiceChange = (_files: UploadImgsFileItem[]) => {
    srcList.serviceSrcList = _files
    srcList.serviceSrcShortList = _files.map(f => f.name)
}
const handleServiceAfterRead = (_files: any[], newFiles: File[]) => {
    srcList.serviceSrcFiles.push(...newFiles)
}
const handleServiceDelete = async (index: number) => {
    const res = await deleteImage(srcList.serviceSrcShortList[index])
    if (!res) return
    srcList.serviceSrcShortList.splice(index, 1)
}
const handleCarouselChange = (_files: UploadImgsFileItem[]) => {
    srcList.carouselSrcList = _files
    srcList.carouselSrcShortList = _files.map(f => f.name)
}
const handleCarouselAfterRead = (_files: any[], newFiles: File[]) => {
    srcList.carouselSrcFiles.push(...newFiles)
}
const handleCarouselDelete = async (index: number) => {
    const res = await deleteImage(srcList.carouselSrcShortList[index])
    if (!res) return
    srcList.carouselSrcShortList.splice(index, 1)
}
const handleCertificateChange = (_files: UploadImgsFileItem[]) => {
    srcList.certificateSrcList = _files
    srcList.certificateSrcShortList = _files.map(f => f.name)
}
const handleCertificateAfterRead = (_files: any[], newFiles: File[]) => {
    srcList.certificateSrcFiles.push(...newFiles)
}
const handleCertificateDelete = async (index: number) => {
    const res = await deleteImage(srcList.certificateSrcShortList[index])
    if (!res) return
    srcList.certificateSrcShortList.splice(index, 1)
}

const deleteImage = async (fileName: string) => {
    MessageBox.loading({ moreText: '正在删除...' })
    const deleteParam = {
        FileName: `${comonParam.$picSrc}/wxSysParms/${fileName}`,
        path: `${comonParam.$picSrc}/wxSysParms/`
    }
    const res = await $api.comonRequest(comonParam.$http + 'controller/commonApi/DeleteImage/index.php', '', deleteParam, true)
    setTimeout(() => {
        MessageBox.closeAllLoading()
    }, 500)
    if (res && res.errCode == 0) {
        return true
    }
    return false
}

const handleSave = async () => {
    MessageBox.loading({ moreText: '正在保存...' })
    const files = [...srcList.vipSrcFiles, ...srcList.serviceSrcFiles, ...srcList.carouselSrcFiles, ...srcList.certificateSrcFiles]
    ;(RowData.value as any).logopic = srcList.vipSrcShortList.join(';') || ''
    ;(RowData.value as any).serviceqrsrc = srcList.serviceSrcShortList.join(';') || ''
    ;(RowData.value as any).adpicurl = srcList.carouselSrcShortList.join(';') || ''
    ;(RowData.value as any).certificatepic = srcList.certificateSrcShortList.join(';') || ''
    const uploadParam = {
        files: files,
        path: `${comonParam.$picSrc}/wxSysParms/`,
        fileNames: Object.keys(files)
    }
    if (files.length > 0) {
        const res = await $api.uploadFile(comonParam.$http + 'controller/commonApi/UploadImage/index.php', uploadParam)
        if (res && res.errCode == 0) {
            const param = {
                keyFieldName: 'idCode',
                keyFieldValue: (RowData.value as any).idcode,
                datas: [RowData.value]
            }
            srcList.vipSrcFiles = []
            srcList.serviceSrcFiles = []
            srcList.carouselSrcFiles = []
            srcList.certificateSrcFiles = []
            editData($AipPath, param)
            MessageBox.closeAllLoading()
        } else {
            MessageBox.closeAllLoading()    
            MessageBox.error({
                title: '提示',
                content: '图片上传失败' + res.errMsg,
                showCancel: false
            })
        }
    } else {
        const param = {
            keyFieldName: 'idCode',
            keyFieldValue: (RowData.value as any).idcode,
            datas: [RowData.value]
        }
        editData($AipPath, param)
        MessageBox.closeAllLoading()
    }
}

onMounted(() => {
    getData($AipPath, getDefaultParam)
})
</script>

<style lang="scss" scoped>
.form-container{
    flex: 1;
    display: flex;
    flex-direction: column;
}
.but-container{
    height: 25px;
    padding: 8px 20px;
    border-bottom: 1px solid #eee;
    .lkx-col-but{
        width: 100px;
        background: rgb(104, 104, 206);
        color: white;
    }
}
.container{
    flex: 1;
    position: absolute;
    margin-top: 10px;
    width: 100%;
    top: 40px;
    bottom: 0;
    overflow-y: auto;
    overflow-x: hidden;
    fieldset{
        border-radius: 5px;
        border-color: rgb(203, 203, 241);
    }
}

.col-box{
    margin-left: 20px ;
    &-item{
        display: flex;
        align-items: center;
        padding: 10px;
        height: 30px;
        label{
            width: 40px;
        }
        input{
            height: 30px;
            flex:1;
            outline:none;
            outline-color: red;
            :active{
                border: 1px solid red;
            }
        }
    }
}
.col-box-wx{
    label{
        width: 100px;
    }
}
.col-box-pay{
    label{
        width: 80px;
    }
    &-check{
        display: flex;
        padding-left: 20px;
        height: 30px;
        &-pay{
            display: flex;
            label{
                width: 100px;
            }
        }
    }
}
.group-Vip{
    width:300px
}
</style>
