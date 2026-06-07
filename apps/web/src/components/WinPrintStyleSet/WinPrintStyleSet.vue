<template>
    <div class="form-container">
        <div class="win-grid">
            <LkxGrid ref='lkxGrid' class="grid"
                :columns="gridAction.Columns"
                :dataSource="dataSource"
                :gridAction="gridAction"
                :methods="gridAction.Methods"
                :events="gridAction.Events"
                :tableConfig="gridAction.TableConfig"
                :serachBoxConfig="gridAction.SerachBoxConfig"
                :pagerConfig="gridAction.PagerConfig"
                :power="gridAction.PowerList"
                :loading="gridAction.Loading"
                :loadText="gridAction.LoadText"
            >
            </LkxGrid>
        </div>
        <div class="win-action">
            <div class="action-buttons">
                <button class="modal-button" @click="handleCancel">取消</button>
                <button type="submit" class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, getCurrentInstance, inject, onMounted } from 'vue'
import { ModalResultEnum } from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { TDataSource } from "@/usehook/dataSource"
import { TPrintStyleSetAction } from './action'
import { WinPrintStyleSetInstanceRefs, WinPrintStyleSetOptions } from './types'
import { LkxGrid } from '@v4x/ui'

defineOptions({
    name: 'WinPrintStyleSet'
})

const props = withDefaults(defineProps<WinPrintStyleSetOptions>(), {
    type: 'order'
})

const parentInstance = getCurrentInstance()?.parent

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/sale/printStyleSet/',
        KeyFieldName: 'xh',
        NotAllowOperationList: [],
        getParmars: { sortFields: 'xh', pageSize: 0 }
    })
)

const gridAction = reactive(new TPrintStyleSetAction(dataSource, {}, props.type))
const lkxGrid = ref<null | HTMLElement>(null)

onMounted(() => {
    gridAction.open()
})

const handleConfirm = async () => {
    const res = await gridAction.update()
    if (res) {
        modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: null })
    }
}

const handleCancel = () => {
    gridAction.cancel(false)
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
</script>

<style lang="scss" scoped>
.form-container {
    display: flex;
    flex-direction: column;
    height: 100%;

    .win-grid {
        flex: 1;
        position: relative;
        min-height: 0;
    }

    .win-action {
        height: 50px;
        flex-shrink: 0;
        padding: 10px 16px;
        border-top: 1px solid #e4e7ed;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;

        .action-buttons {
            display: flex;
            gap: 10px;
        }
    }
}

.grid {
    position: absolute;
    left: 0;
    top: 3px;
    right: 0;
    height: 100%;
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
