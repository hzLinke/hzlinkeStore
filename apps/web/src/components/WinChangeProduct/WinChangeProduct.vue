<template>
    <div class="form-container">
        <div class="win-body">
            <lkx-input ref="InputNumEl" class="_input" width="100px"  :config="{inputType:'text', caption:'请输入数量：',captionWidth: 100}" v-model="inputNum" @keypress.stop="handleKeyprees"/>
            <lkx-input ref="InputDoMethodEl"  class="_input" width="100px" :config="{inputType:'text', caption:'请输入做法：',captionWidth: 100}" v-model="inputDoMethod"/>
        </div>
      
        <div class="win-action">
            <LkxButton caption="取消" type='default'   @click="handleCancel" ></LkxButton>
            <LkxButton caption="确定" type='default'   @click="handleConfirm" ></LkxButton>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref,  nextTick, onMounted, getCurrentInstance,useTemplateRef } from 'vue'
import { LkxButton, ModalResultEnum, MessageBox,LkxInput } from '@v4x/ui'
import { modalActionCancel, modalActionConfirm } from '@v4x/utils'
import { ChangeProductOptions } from './types';

defineOptions({
    name: 'changeProductNumer'
})


const props = withDefaults(defineProps<ChangeProductOptions>(), {
    inputNum: 0,
    inputDoMethod: '',
})

const InputNumEl = useTemplateRef('InputNumEl')
const InputDoMethodEl = useTemplateRef('InputDoMethodEl')

const inputNum = ref(props.inputNum || 0)
const inputDoMethod = ref(props.inputDoMethod)


const handleKeyprees = (e: KeyboardEvent) => {
    if (e.code === 'Enter') {
        InputDoMethodEl.value?.focus()
    }
}

const parentInstance = getCurrentInstance()?.parent

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}

const handleConfirm = () => {
    if (inputNum.value === 0) {
        MessageBox.warning({
            title: '出错',
            content: '请输入数量',
        })
        return
    }
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: { inputNum: inputNum.value, inputDoMethod: inputDoMethod.value } })
}

onMounted(() => {
    nextTick(() => {
       InputNumEl.value?.focus()
    })
})
</script>
<style lang="scss" scoped>
    .form-container{
        display: flex;
        flex-direction: column;
        height: 100%;
        .win-body{
            flex: 1;
            flex-shrink: 0;
            display: flex;
            margin: 15px;
            flex-direction: column;
            gap: 10px;
            align-items: center;
            justify-content: center;
           ._input{
                width: 350px;
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