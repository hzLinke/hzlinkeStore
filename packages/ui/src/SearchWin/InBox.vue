<template>
    <div class="list-box">
        <li v-for="(item, index) in Lists" :key="index" @click="sels = index">
            {{ sels === index ? '' : item.title }}
            <lkx-input v-show="sels === index"
                class="inputList"
                v-bind="inputConfig"
                v-model="item[inputConfig.fieldName]"
            />
        </li>
    </div>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue'
import LkxInput from '../LkxInput/input.vue'
import { InputOptionsType } from '../LkxInput/types'

defineOptions({
    name: 'InBox'
})

interface ListDataType {
    idCode: string
    title: string
    [key: string]: any
}

interface Props {
    ListDatas?: any[]
    KeyFieldName?: string
    DisplayFieldName?: string
    DisplayFields?: string
}

const props = withDefaults(defineProps<Props>(), {
    ListDatas: () => [],
    KeyFieldName: '',
    DisplayFieldName: '',
    DisplayFields: ''
})

const emit = defineEmits<{
    inChange: [idCode: string]
}>()

const sels = ref(0)
const Lists = ref<ListDataType[]>(Array.from({ length: 15 }, () => ({
    idCode: '',
    title: ''
})))

const DropListDatas = ref(props.ListDatas)

const inputConfig = {
    fieldName: 'idCode',
    config: {
        inputType: 'drop' as const,
        tag: 0,
        onChange: (e: any) => {
            Lists.value[sels.value].title = e[props.KeyFieldName || 'idcode'] + '-' + e.name
            emit('inChange', Lists.value[sels.value].idCode)
        },
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: props.KeyFieldName || 'idcode',
        displayFieldName: props.DisplayFieldName || 'name',
        displayFields: props.DisplayFields || 'idcode|name',
        displayFieldWidths: '50|300',
        dropListDatas: DropListDatas.value,
        onFilter: (filterValue: string) => {
            const arr = DropListDatas.value.filter((item: any) => {
                return item[props.DisplayFieldName || 'name'].indexOf(filterValue) != -1
            })
            return arr
        }
    }
} satisfies InputOptionsType

watch(
    () => props.ListDatas,
    (newVal) => {
        DropListDatas.value = newVal
    }
)
</script>
<style lang="scss" scoped>
    .list-box{
        margin-top: 5px;
        border: 1px solid #eeee;
        overflow-y: auto;
        height: 100%;
    }
    li{
        list-style-type: none;
        padding: 2px 5px;
        height: 26px;
        line-height: 26px;
    }
    .inputList{
        width: 100%;
    }

</style>
