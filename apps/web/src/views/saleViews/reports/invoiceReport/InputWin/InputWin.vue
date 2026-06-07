<template>
    <form class="form-container">
        <div class="win-body">
            <lkx-input ref="InputNumEl" class="_input" width="100px"  :config="{inputType:'text', caption:'请输入数量：',captionWidth: 100}" v-model="inputNum" @keypress.stop="handleKeyprees"/>
            <lkx-input ref="InputPriceEl"  class="_input" width="100px" :config="{inputType:'text', caption:'请输入单价：',captionWidth: 100}" v-model="inputPrice"/>
            <div style="text-align: right;">总金额{{ TotalMoney }}</div>
        </div>
        <div class="win-action">
            <LkxButton caption="取消" type='default'   @click="handleCancel" ></LkxButton>
            <LkxButton caption="确定" type='default'   @click="handleConfirm" ></LkxButton>
        </div>
    </form>
</template>
<script setup lang="ts">
import { ref, computed, getCurrentInstance, onMounted, nextTick, useTemplateRef } from "vue";
import { LkxInput,LkxButton,MessageBox, ModalResultEnum } from '@v4x/ui'
import $Utils from '@v4x/utils/lkxUtil'
import { modalActionCancel, modalActionConfirm } from '@v4x/utils'

interface Props {
    qty: number
    price: number
}

const props = withDefaults(defineProps<Props>(), {
   qty: 0,
   price: 0,
})

const InputNumEl = useTemplateRef('InputNumEl')
const InputPriceEl = useTemplateRef('InputPriceEl')



const inputNum = ref(props.qty || 0)
const inputPrice = ref(props.price || 0)

const TotalMoney = computed(() => {
    return $Utils.numberFormat(inputNum.value * inputPrice.value, '0.00')
})
const parentInstance = getCurrentInstance()?.parent


const handleKeyprees = (e: KeyboardEvent) => {
    if (e.code === 'Enter') {
        InputPriceEl.value?.focus()
    }
 }

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
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: { inputNum: inputNum.value, inputPrice: inputPrice.value } })
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