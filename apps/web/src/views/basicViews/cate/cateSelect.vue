<template>
    <form class="form">
        <lkx-input class="payType-input" 
            :name="CataState.fieldName"
            :config="CataState.config"
            :dropConfig="CataState.dropConfig"
            v-model="CateCode"
        />
        <div class="message-action">
            <LkxButton caption="取消" type='default'   @click="handleCancel" ></LkxButton>
            <LkxButton caption="确定" type="default"   @click="handleConfirm" ></LkxButton>
        </div>
    </form>

</template>
<script setup lang="ts">
import { ref,getCurrentInstance } from 'vue'
import { LkxInput ,LkxButton, ModalResultEnum} from '@v4x/ui'
import {type InputOptionsType } from '@v4x/ui'


import useAppStore from '@/stores'
import { modalActionConfirm,modalActionCancel } from '@v4x/utils'

defineOptions({
    name: 'cate-select'
})

const props = withDefaults(defineProps<{
  defaultCateCode?: string | number
}>(), {
  defaultCateCode: 0
})


const emit = defineEmits(['close'])

const CateCode = ref(props.defaultCateCode)
const CataState = ref<InputOptionsType>({
    fieldName: 'catename',
    config: {
        caption: '一级分类：',
        captionWidth: 90,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop'
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '50|100',
        dropListDatas: useAppStore().commonDatas.PCateDatas,
        onFilter: (filterValue: string) => {
            const CurArr = useAppStore().commonDatas.PCateDatas
            const arr = CurArr.filter((item: any) => {
                return item.name.toLowerCase().indexOf(filterValue.toLowerCase()) != -1
            })
            return arr
        }
    } 
})
const parentInstance = getCurrentInstance()?.parent

const handleConfirm = () => {
    modalActionConfirm(parentInstance,{ action: ModalResultEnum.mrConfirm, data: CateCode.value })
}

const handleCancel = () => {
    
    modalActionCancel(parentInstance,{ action: ModalResultEnum.mrCancel, data: null })
}

</script>
<style lang="scss" scoped>
    .form{
        display: flex;
        flex-direction: column;
        .payType-input{
            padding:10px 20px;
        }
        
    }
   input{
       margin-left: 10px;
       width: 160px;
       height: 24px;
   }
   .message-action {
        padding: 12px 16px;
        border-top:1px solid #e4e7ed;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
    }
</style>