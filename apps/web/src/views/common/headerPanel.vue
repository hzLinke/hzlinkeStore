<template>
    <form style="padding-left:20px">
        <lkx-row gutter="4" v-for="(rowItem,rowIndex) in config.items" :key="rowIndex" class="lkx-row">
            <lkx-col class="lkxCol" v-for="(colItem,colIndex) in rowItem" :key="colIndex" :span="colItem.span">
                <lkx-input
                    class="lkxCol-title"
                    :name="colItem.fieldName"
                    :data-index="colItem.config?.tag"
                    :config="colItem.config"
                    :dropConfig="colItem.dropConfig"
                    @keypress="handleKeyPress"
                    v-model="datas[colItem.fieldName||''] as string | number"
                />
            </lkx-col>
        </lkx-row>
    </form>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue'
import { LkxRow, LkxCol, LkxInput, TableRowDataType, EditModalConfigParamType, InputConfigType, InputDropConfigType, InputOptionsType } from '@v4x/ui'  
import { useAppStore } from '@/stores'

const appStore = useAppStore()

defineOptions({
    name: 'headerPanel'
})
export interface HeaderConfigType {
    disabled?: boolean
    items?: InputOptionsType[][]
}
interface Props {
    rowData?: TableRowDataType
    config?: HeaderConfigType
}

const props = withDefaults(defineProps<Props>(), {
    rowData: () => ({}),
    config: () => ({ disabled: false, items: [] })
})

const focusCtrl = ref(0)
const currentIndex = ref(0)
const actionType = ref('next')
const datas = ref<Record<string, unknown>>({ ...props.rowData })

const setFocus = (xactionType: string, index = 0): void => {
    if (xactionType === 'jump') {
        currentIndex.value = index
    }
    focusCtrl.value++
    actionType.value = xactionType
}

const setFocusIndex = (index: number): void => {
    currentIndex.value = index
}

const handleKeyPress = (e: KeyboardEvent): void => {
    if (e.code === 'Enter') {
        setFocus('next')
    }
}

watch(
    () => props.rowData,
    (newData) => {
        datas.value = { ...datas.value, ...(newData as Record<string, unknown>) }
    },
    {
        deep: true
    }
)
</script>

<style lang="scss" scoped>
    form {
        border-bottom: 1px solid #eeee;
    }
    .lkxCol {
        display: flex;
        &-title {
            flex: 1;
        }
    }
    :deep(.lkx-row) {
        margin-bottom: 0;
    }
</style>
