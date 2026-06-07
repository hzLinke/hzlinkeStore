<template>
    <div class="form-container">
        <div class="win-body">
            <lkx-input class="Input-At"
                    name="startat"
                    :config="dateState.config"
                    v-model="DateCode"
            />
            <LkxButton class="opbut" type="danger"  radius=6  height="30" width="80" caption="执行" IconCls="iconfont  iconExamine" @click="handleDeleteGroup"></LkxButton>
        </div>
        <div class="win-action">
            <LkxButton caption="关闭" type='default'   @click="handleCancel" ></LkxButton>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref,  onMounted, getCurrentInstance } from 'vue'
import lkxUtil from '@v4x/utils/lkxUtil'
import $api from '@/request/api'
import { MessageBox,  ModalResultEnum, InputOptionsType } from '@v4x/ui'
import { LkxButton } from '@v4x/ui'
import { LkxInput } from '@v4x/ui'
import { modalActionCancel } from '@v4x/utils'
defineOptions({
    name: 'DeleteGroup'
})


const DateCode = ref('2021-11-01')
const ButLock = ref(false)

const dateState = ref<InputOptionsType>({
    config: {
        caption: '删除日期',
        captionWidth: 80,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        disabled: true,
        onChange: (data: any) => {
            console.log(data)
        }
    }
})


const handleDeleteGroup = async () => {
    const x = await MessageBox.question({
        title: '提问',
        content: '是否删除当前汇总？'
    })
    if (x.action === ModalResultEnum.mrCancel) return
    
    MessageBox.loading({
        moreText: '正在删除汇总...',
        mask: true
    })
    
    ButLock.value = true
    
    const param = {
        At: DateCode.value
    }
    
    setTimeout(() => {
        $api.comonRequest('/masterApi/disApi/sys/DataHandle/','DeleteGroup', param).then((rs) => {
            MessageBox.closeAllLoading()
            if (rs.errCode !== 0) {
                return
            }
            MessageBox.information({
                title: '信息',
                content: '删除成功',
                showCancel: false
            })
            DateCode.value = lkxUtil.getDate('d', -1, 'yyyy-MM-dd', DateCode.value)
        })
    }, 1000)
}

onMounted(() => {
    $api.getData('/masterapi/publicApi/',
        { tableName: 'V_GroupMaxAt',
          fields: 'At',
          sortFields: 'At' }
    ).then((rs) => {
        if (rs.datas[0].at) {
            DateCode.value = lkxUtil.getDate('d', -1, 'yyyy-MM-dd', rs.datas[0].at)
        } else {
            DateCode.value = lkxUtil.getDate()
        }
    })
})

const parentInstance = getCurrentInstance()?.parent
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
        min-height: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        .Input-At{
            margin-left: 10px ;
            width: 250px;
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