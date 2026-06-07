<template>
    <div class="form-container">
        <div class="win-body">
            <label class="checkboxTitle" v-for="(item,index) in CateList" :key="index"><input type="checkbox" v-model="item.checked">{{ item.name }}</label>
        </div>
        <div class="win-action">
            <label class="checkboxTitle checkbox-left"><input type="checkbox" v-model="checkAll">全选</label>
            <div class="action-buttons">
                <button class="modal-button" @click="handleCancel">取消</button>
                <button type="submit" class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, watch, getCurrentInstance } from 'vue'
import { ModalResultEnum } from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { CateSelectInstanceRefs, CateSelectOptions } from './types'

defineOptions({
    name: 'WinCateSelect'
})

const props = withDefaults(defineProps<CateSelectOptions>(), {
    CateListDatas: () => []
})

const checkAll = ref(false)
const CateList = JSON.parse(JSON.stringify(props.CateListDatas))
CateList.map((item: any) => {
    item.checked = false
})

const parentInstance = getCurrentInstance()?.parent

const handleConfirm = async () => {
    const data = {
        datas: CateList.filter((item: any) => item.checked)
    }
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data })
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}

watch(
    () => checkAll.value,
    (n, o) => {
        CateList.map((item: any) => {
            item.checked = n
        })
    }
)
</script>

<style lang="scss" scoped>
.form-container{
    display: flex;
    flex-direction: column;
    height: 100%;
    .win-body{
        flex: 1;
        min-height: 0;
        padding: 10px;
        overflow-y: auto;
    }
    .win-action{
        height: 40px;
        flex-shrink: 0;
        padding:5px 16px;
        border-top:1px solid #e4e7ed;
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 10px;
        .action-buttons {
            display: flex;
            gap: 10px;
        }
    }
}
.money{
    width: 60px;
    margin-right: 10px;
}
.note{
    width: 230px;
}
.checkboxTitle{
    display: inline-flex;
    line-height: 24px;
    width: 130px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
    text-align: left;
}
input{
    margin-left: 10px;
    width: 20px;
    height: 20px;
}

.modal-button {
    line-height: 1em;
    font-size: 14px;
    padding: 8px 20px;
    border: 1px solid #dcdfe6;
    outline: none;
    display: inline-block;
    border-radius: 4px;
    cursor: pointer;
    background-color: #fff;
    transition: 0.1s;
    &:hover {
        color: #409eff;
        border-color: #c6e2ff;
        background-color: #ecf5ff;
    }
    & + & {
        margin-left: 10px;
    }

    &-primary {
        background-color: #2d8cf0;
        border-color: #2d8cf0;
        color: white;
        &:hover {
            background: #66b1ff;
            border-color: #66b1ff;
            color: #fff;
        }
    }
}
</style>
