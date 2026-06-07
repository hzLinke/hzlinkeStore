<template>
    <div class="pager">
        <div class="where">{{ whereStr }}</div>
        <a href="javascript:void(0);" @mousedown.prevent="firstPage">首页</a>
        <a href="javascript:void(0);" @mousedown.prevent="prevPage">上一页</a>
        <div>
            <select v-model="size" name="ElPagerSelect" @change.prevent="pageSizeChange">
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="100">100</option>
                <option value="150">150</option>
                <option value="200">200</option>
                <option value="500">500</option>
            </select>
        </div>
        <span>{{ curPage }}/{{ totalPage }}</span>
        <a href="javascript:void(0);" @mousedown.prevent="nextPage">下一页</a>
        <a href="javascript:void(0);" @mousedown.prevent="lastPage">尾页</a>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, watch, computed } from 'vue'
import type { PagerProps } from './types'

const props = withDefaults(defineProps<PagerProps>(), {
    pageSize: 20,
    whereStr: ''
})

const emit = defineEmits<{
    setPage: [page: number]
    setPageSize: [size: number]
}>()

const size = ref(props.pageSize)

const totalPage = computed(() => {
    return props.pageSize === 0 ? 1 : Math.ceil(props.total / props.pageSize) || 1
})

const nextPage = () => {
    if (props.curPage < totalPage.value) {
        emit('setPage', props.curPage + 1)
    }
}

const prevPage = () => {
    if (props.curPage > 1) {
        emit('setPage', props.curPage - 1)
    }
}

const firstPage = () => {
    if (props.curPage > 1) {
        emit('setPage', 1)
    }
}

const lastPage = () => {
    if (props.curPage < totalPage.value) {
        emit('setPage', totalPage.value)
    }
}

const pageSizeChange = () => {
    emit('setPageSize', size.value)
}

watch(
    () => props.total,
    () => {
        // totalPage 会自动重新计算
    }
)
</script>

<style lang="scss" scope> 
    $height:40px;
    .pager>span,.pager>a,.pager>select,.pager>div{
        float: left;
        margin-left: 10px;
    }

    .pager{
        display: flex;
        justify-content: flex-end;
        padding-right: 30px;
        height: $height;
        line-height: $height;
        background: $basic-bg-color;
    }

    .pager input,.pager select{
        height:$height - 15; 
        line-height:$height -15;
        margin: 2px 0;
        outline:none; 
        border:1px solid #888; 
        box-sizing:border-box;
    }
    .pager input{
        width: 50px;
    }
    .pager .goto{
        margin-left: 20px;
    }
    .pager a{
        color: black;
        font-weight: bold;
        text-decoration: none;
    }
    .pager a:hover{
        color: green;
    }
    .where{
        position: absolute;
        left: 0;
        max-width: 300px;
    }
</style>