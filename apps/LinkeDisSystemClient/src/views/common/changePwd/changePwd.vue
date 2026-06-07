<template>
    <lkx-modal :config= "modalConfig" :datas="RowData" @close="handleClose">
            <lkx-row gutter=10 >
                <lkx-col class="lkxCol" :span="24">
                     <div class="col-box-item">
                        <label>原密码</label>
                        <input type="password" required autocomplete="new-password" autofocus placeholder="请输入原密码" v-model="RowData.curPassWord" />
                    </div>
                </lkx-col>
            </lkx-row>
            <lkx-row gutter=10 >
                <lkx-col class="lkxCol" :span="24">
                     <div class="col-box-item">
                        <label>新密码</label>
                        <input type="password" required autocomplete="new-password" placeholder="新密码" v-model="RowData.newPassWord" />
                    </div>
                </lkx-col>
            </lkx-row>
            <lkx-row gutter=10 >
                <lkx-col class="lkxCol" :span="24">
                     <div class="col-box-item">
                        <label>确认密码</label>
                        <input type="password" required autocomplete="new-password" placeholder="确认密码" v-model="RowData.ConfirmPassWord" />
                    </div>
                </lkx-col>
            </lkx-row>
    </lkx-modal>
</template>
<script lang="ts">
/**密码修改 */
import { defineComponent,ref,getCurrentInstance } from "vue";
import { LkxModal, LkxRow, LkxCol, MessageBox } from "@v4x/ui"
import $api from '@/request/api'
import md5 from 'js-md5'

export default defineComponent({
    name: "OperationModal",
    components:{
        LkxModal,
        LkxRow,
        LkxCol
    },
    props: {
        open: {
            type: Boolean,
            default: false
        }
    },
    setup(props, ctx) {
        const  modalConfig = ref({
                open: props.open,
                title:'密码修改',
                type:'edit',
                width:'400px',
        })
        const RowData = ref({
            ConfirmPassWord:'',
            newPassWord:'',
            curPassWord:''
        })
        const handleClose = async (e: any)=>{
           if (e.type == 'mrOk'){
                const loginDatas = JSON.parse(sessionStorage.getItem('loginDatas')||'');
                const ApiPath = '/masterapi/publicApi/'
                console.log(md5(RowData.value.curPassWord),ApiPath,loginDatas)
                if (md5(RowData.value.curPassWord)!=loginDatas.pwd){
                    MessageBox.warning({
                        title: '警告',
                        content: '原密码不正确',
                        showCancel: false
                    })
                    return
                }
                 if (!RowData.value.newPassWord){
                    MessageBox.warning({
                        title: '警告',
                        content: '请输入新密码',
                        showCancel: false
                    })
                    return
                }
                if (RowData.value.newPassWord!=RowData.value.ConfirmPassWord){
                    MessageBox.warning({
                        title: '警告',
                        content: '两次密码不相等',
                        showCancel: false
                    })
                    return
                }
                const res = await $api.editData(ApiPath,{
                    tableName:      'L_Basic_User_Tab',
                    keyFieldName:   'idCode',
                    keyFieldValue:  loginDatas.idcode,
                    datas:          [{passWord:md5(RowData.value.ConfirmPassWord),pwd:md5(RowData.value.ConfirmPassWord)}]
                })
                if (res&&res.errCode != 0){
                    return
                } else {
                     MessageBox.information({
                        title: '信息',
                        content: '密码修改成功',
                        showCancel: false
                    })
                }
           }
           modalConfig.value.open = false
           ctx.emit('close',e)
        }
        return { 
            RowData,
            modalConfig,
            handleClose
        }; 
    }
});
</script>
<style lang="scss" scoped>
    .lkxCol{
        display: flex;
        &-title{
           flex:1;
        }
    }
        .col-box-item{
            display: flex;
            align-items: center;
            padding: 10px;
            height: 24px;
            flex: 1;
            label{
                width: 60px;
            }
            input{
                height: 24px;
                flex:1;
                outline:none;
                outline-color: red;
                :active{
                    border: 1px solid red; // 如何改成别的颜色？
                }
            }
        }
</style>