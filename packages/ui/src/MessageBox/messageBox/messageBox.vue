<template>
    <div  class="message-container" >
        <div class="message-content">
            <img class="message-content-icon" :src="messageIcon" />
            <div class="message-content-message">{{content}}</div>
        </div>
        <div class="message-action">
            <LkxButton v-if="showCancel" type = 'default' :caption="cancelText"  @click="handleCancel" ></LkxButton>
            <LkxButton v-if="showAbort" type='default' :caption="abortText" @click="handleAbort" ></LkxButton>
            <LkxButton type="default"  :caption="confirmText" @click="handleConfirm" ></LkxButton>
        </div>
    </div>

</template>

<script setup lang="ts">
import { computed, getCurrentInstance, onMounted, useTemplateRef, nextTick } from "vue";
import { type MessageOptions } from "../messageBox";
import { getExposed, hasExposed, ModalResultEnum } from '@v4x/ui'
import type { ModalExposed } from '@v4x/ui'
import {modalActionCancel,modalActionAbort,modalActionConfirm} from '@v4x/utils'

import {LkxButton} from '@v4x/ui'
// 导入图片资源
import informationIcon from '../pics/information.png';
import errorIcon from '../pics/error.png';
import warningIcon from '../pics/warning.png';
import questionIcon from '../pics/question.png';

const props = withDefaults(defineProps<MessageOptions>(), {
    messageType: 'information' ,
    showCancel:false,
    showAbort:false,
    defaultButton: ModalResultEnum.mrConfirm,
    confirmText: '确认',
    cancelText: '取消',
    abortText:'中断',
})

// 获取父组件或传入组件实例
const parentInstance = props.parentInstance || getCurrentInstance()?.parent

const messageIcon = computed(()=>{
    switch (props.messageType){
        case "information":
            return informationIcon;
        case "error":
            return errorIcon;
        case "warning":
            return warningIcon;
        case "question":
            return questionIcon;
        default:
            return informationIcon;
    }
})


const handleCancel = ()=>{
    modalActionCancel(parentInstance,{ action: ModalResultEnum.mrCancel, data: null })
   /*  const exposed = getExposed<ModalExposed>(parentInstance || undefined)
    if (exposed) {
        // 完整的类型推断 
        exposed.resultValue.value = { action: ModalResultEnum.mrCancel, data: null }
        exposed.close()
    } */
}
const handleAbort = ()=>{
    modalActionAbort(parentInstance,{ action: ModalResultEnum.mrAbort, data: null })
    /* const exposed = getExposed<ModalExposed>(parentInstance || undefined)
    if (exposed) {
        // 完整的类型推断 
        exposed.resultValue.value = { action: ModalResultEnum.mrAbort, data: null }
        exposed.close()
    } */
}
const handleConfirm = () => {
    modalActionConfirm(parentInstance,{ action: ModalResultEnum.mrConfirm, data: null })
    /* const exposed = getExposed<ModalExposed>(parentInstance || undefined)
    if (exposed) {
        // 完整的类型推断 
        exposed.resultValue.value = { action: ModalResultEnum.mrConfirm, data: null }
        exposed.close()
    }*/
}
</script>
<style lang="scss" scoped>
    .message-container {
        .message-content {
            margin: 16px;
            display: flex;
            align-items:center;
            overflow: auto;
            max-height: 150px;
            &-icon{
                padding: 0 10px;
                width: 60px;
                text-align: center;
            }
            &-message{
                flex: 1;
                padding:0 10px;
                white-space:pre-wrap;//识别\n换行
                word-break:break-all;
                word-wrap:break-word;
                overflow-x: hidden;
                overflow-y: auto;
                max-height: 150px;
            }
        }

        .message-action {
            padding: 12px 16px;
            border-top:1px solid #e4e7ed;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
        }

    }
</style>
