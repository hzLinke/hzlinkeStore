<template>
<div class="form">
            <div class="one">
                <lkx-input class="Input-At"
                    name="startat"
                    :config="startDateState.config"
                    v-model="StartDateCode"
                />
                <lkx-input class="Input-At"
                    name="endat"
                    :config="endDateState.config"
                    v-model="EndDateCode"
                />
                <LkxButton class="opbut"  type="danger" :disabled="ButLock"  radius=6  height="30" width="80" caption="执行" IconCls="iconfont  iconExamine" @click="handleDataGroup"></LkxButton>
            </div>
            <div class="tow">
                <label>当前日期
                    <input name="today" type="text"  :value='thisDateCode' disabled/>
                </label>
                <LkxButton class="opbut"   radius=6  height="30" width="80" caption="退出" IconCls="iconfont  iconClose" @click="handleClose"></LkxButton>
            </div>
            <div class="actioninf">
                <table :border="1" cellspacing="0" cellpadding="0">
                    <colgroup>
                        <col width='50px'/>
                        <col width='130px'/>
                        <col width='110px'/>
                        <col width='110px'/>
                        <col width='80px'/>
                    </colgroup>
                    <thead>
                        <tr>
                            <td>序号</td>
                            <td>项目</td>
                            <td>开始时间</td>
                            <td>结束时间</td>
                            <td>状态</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item,index) in Action" :key="index">
                            <td  style="text-align:center">{{item.idcode}}</td>
                            <td>{{item.name}}</td>
                            <td>{{item.startat}}</td>
                            <td>{{item.endat}}</td>
                            <td  style="text-align:center">{{item.status}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
</template>
<script setup lang="ts">
import { ref, reactive, computed, getCurrentInstance } from "vue";
import lkxUtil from '@v4x/utils/lkxUtil';
import $api from '@/request/api'
import {TWinForm} from "@/usehook/win"
import { InputOptionsType, LkxModal, ModalResultEnum } from '@v4x/ui'
import { LkxInput } from '@v4x/ui'
import { LkxButton } from '@v4x/ui'
import {MessageBox} from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { useAppStore } from '@/stores'

const appStore = useAppStore()
defineOptions({
    name: 'GroupWin'
})  

const props = withDefaults(defineProps<{
    datas: object
    rowIndex: number
}>(), {
    datas: () => ({}),
    rowIndex: -1
})

const ButLock = ref(false)
const config = reactive(
    {
        title:'日汇总',
        width: '500px',
        open: true,
        hideFooter: true
    } as any
)

const Action = reactive([
    {idcode:1,name:'复制进销存',startat:'',endat:'',status:'等待',action:'Group_Copy'},
    {idcode:2,name:'汇总进销存',startat:'',endat:'',status:'等待',action:'Group_InOut'},
    {idcode:3,name:'汇总销售数据',startat:'',endat:'',status:'等待',action:'Group_Sale'},
    {idcode:4,name:'整理',startat:'',endat:'',status:'等待',action:'Group_Extend'},
    {idcode:5,name:'汇总完成',startat:'',endat:'',status:'等待',action:'Group_End'},
])
const thisDateCode = ref(lkxUtil.getDate())
const StartDateCode = ref('2021-11-01')
const EndDateCode = ref(lkxUtil.getDate())
const startDateState = ref<InputOptionsType>({
    config:{
        caption: '日期 从', 
        captionWidth:60,
        align: 'left',
        captionAlign:'right',
        inputType:'datetime',
        format:'yyyy-MM-dd',
        disabled:true,
    }
}) 
const endDateState = ref<InputOptionsType>({
    config:{
        caption: '到', 
        captionWidth:40,
        align: 'left',
        captionAlign:'right',
        inputType:'datetime',
        format:'yyyy-MM-dd',
    }
})

const initAction = ()=>{
    Action.forEach(item => {
        item.startat = '';
        item.endat = '';
        item.status = '等待'
    });
}

const doGroup = async (groupAt: string,action: string)=>{
    const param = {
        At   :   groupAt,
    }
    return $api.comonRequest('/masterApi/disApi/sys/DataGroup/',action,param);
}

const handleDataGroup = async () =>{
    if (EndDateCode.value>lkxUtil.getDate() ){
        MessageBox.warning({
            title:'警告',
            content:'结束日期不能大于当前时期',
            showCancel: false
        })
        return;
    }
    if (EndDateCode.value<StartDateCode.value ){
        MessageBox.warning({
            title:'警告',
            content:'结束日期不能小于开始日期',
            showCancel: false
        })
        return;
    }
    const x = await MessageBox.question({
        title:'提问',
        content:'是否要对数据进行汇总计算？'
    })
    if (x.action !== ModalResultEnum.mrConfirm) return 
    MessageBox.loading({
        moreText:'正在汇总....',
        mask: true
    })
    ButLock.value = true
    let error = false
    do { 
        initAction();
        for (let i=0;i<Action.length;i++){
            Action[i].startat = lkxUtil.getDate('none',0,'HH:mm:ss')
            const res = await doGroup(StartDateCode.value,Action[i].action)
            error= res.errCode!=0
            if (error) break;  
            Action[i].endat = lkxUtil.getDate('none',0,'HH:mm:ss')
            Action[i].status = '完成'
        }
        if (error) break;    
        StartDateCode.value = lkxUtil.getDate('d',1,'yyyy-MM-dd',StartDateCode.value)   
    } while (StartDateCode.value<=EndDateCode.value);
    MessageBox.closeAllLoading()
}



$api.getData('/masterapi/publicApi/',{tableName:'V_GroupMaxAt',
    fields:'At',
    sortFields:'At'}
).then((rs)=>{
    if (rs.datas[0].at){
        StartDateCode.value = lkxUtil.getDate('d',0,'yyyy-MM-dd',rs.datas[0].at)
    } else {
        StartDateCode.value = lkxUtil.getDate()
    }
    EndDateCode.value = lkxUtil.getDate('d',-1,'yyyy-MM-dd')
})

const parentInstance = getCurrentInstance()?.parent

const handleClose = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
    
}


</script>
<style lang="scss" scoped>
    .form{
        display: flex !important;
        flex-direction: column;
        margin-top: 5px;
        .one{
            display: flex;
            flex-direction: row;
            padding-bottom: 5px;
            .Input-At{
                 width: 200px;
            }
            input{
                outline: 0;
                height: 30px;
                border: 1px solid #eeee;
                border-radius: 4px;
                width: 150px;
                &:focus{
                    border: 1px solid blue;
                }
            }
            .opbut{
                margin-left: 9px ;
            }
        }
        .tow{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            padding: 0 10px;
            input{
                outline: 0;
                height: 30px;
                border: 1px solid #eeee;
                border-radius: 4px;
                width: 150px;
                &:focus{
                    border: 1px solid blue;
                }
            }
        }
        .actioninf{
            height: 200px;
            margin-top: 5px ;
            border-top: 1px solid #eeee ;
        }
    }
   
    table{
         border-collapse:collapse;
        
    }
    tablead td{
        text-align: center;
    }
    td{
        padding: 3px;
    }
</style>
