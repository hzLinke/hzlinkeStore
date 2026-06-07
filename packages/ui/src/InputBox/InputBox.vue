<template>
    <div class="input-box-container">
        <div class="input-box-content">
            <div class="input-box-caption">{{ description }}</div>
            <LkxInput 
                ref="inputRef"
                v-model="inputValue"
                :placeholder="placeholder"
                :config="config"
                :dropConfig="dropConfig"
            />
            <div v-if="note" class="input-box-note">{{ note }}</div>
        </div>
        <div class="input-box-actions">
            <LkxButton v-if="props.showCancel" type="default" :caption="props.cancelText" @click="handleCancel" />
            <LkxButton type="default" :caption="props.confirmText" @click="handleConfirm" />
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, nextTick, getCurrentInstance } from 'vue'
import { LkxButton, LkxInput, ModalResultEnum, InputConfigType, InputDropConfigType } from '@v4x/ui'
import { modalActionCancel, modalActionConfirm } from '@v4x/utils'
import type { InputBoxOptions } from './types'

const props = withDefaults(defineProps<InputBoxOptions>(), {
    title: '标题',
    description: '描述',
    note: '',
    defaultValue: '',
    placeholder: '',
    showCancel: true,
    confirmText: '确定',
    cancelText: '取消',
    abortText:'放弃',
    width: 400,
    height: 200,
    inputType: 'text',
    dropDataList: () => []
})

const parentInstance = getCurrentInstance()?.parent
const inputRef = ref<any>(null)
const inputValue = ref(props.defaultValue)

const config = computed<InputConfigType>(() => ({
    inputType: props.inputType === 'date' ? 'datetime' : props.inputType,
    placeholder: props.placeholder,
    border: true
}))

const dropConfig = computed<InputDropConfigType>(() => {
    const baseConfig: InputDropConfigType = {
        dropListPosition: {}
    }
    if (props.inputType === 'drop') {
        return {
            ...baseConfig,
            isDrop: true,
            clickDrop: true,
            allowInput: true,
            resultFieldName: 'idcode',
            displayFieldName: 'name',
            displayFields: 'idcode|name',
            displayFieldWidths: '100|200',
            dropListDatas: props.dropDataList || []
        }
    }
    return baseConfig
})

const handleConfirm = () => {
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: inputValue.value })
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}

onMounted(() => {
    nextTick(() => {
        const inputEl = inputRef.value?.$el?.querySelector('input')
        inputEl?.focus()
        inputEl?.select()
    })
})
</script>

<style lang="scss" scoped>
.input-box-container {
    display: flex;
    flex-direction: column;
    
    .input-box-content {
        padding: 20px;
        display: flex;
        flex-direction: column;
        gap: 10px;
        
        .input-box-caption {
            font-size: 14px;
            color: #606266;
        }
        
        .input-box-note {
            font-size: 12px;
            color: #909399;
            background-color: #f5f7fa;
            padding: 8px 12px;
            border-radius: 4px;
        }
    }
    
    .input-box-actions {
        padding: 12px 20px;
        border-top: 1px solid #e4e7ed;
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }
}
</style>
