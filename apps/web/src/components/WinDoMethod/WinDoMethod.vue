<template>
    <div class="modal-body">
        <div class="List-item"
            v-for="(item, index) in lists"
            :class="{ 'active': index == selectIndex }"
            :key="index"
            @dblclick="handleSelect(item)"
        >
            {{ item }}
        </div>
    </div>
</template>

<script setup lang="ts">
import { computed, reactive, ref, nextTick, onMounted, getCurrentInstance } from "vue";
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { ModalResultEnum } from "@v4x/ui";

interface Props {
   datas?: string;
}

const props = withDefaults(defineProps<Props>(), {
    title: "",
    datas: '',
    showCancel: true,
    defaultButton: 'mrCancel',
    width: "200px",
    height: "300px",
    okText: "确定",
    cancelText: "取消",
    closeModal: undefined,
})

const Win = ref<HTMLElement | null>(null)
const selectIndex = ref(0)

const lists = computed(() => {
    return props.datas.split('/')
})

onMounted(() => {
    nextTick(() => {
        setTimeout(() => {
            Win.value?.focus()
        }, 200)
    })
})

const parentInstance = getCurrentInstance()?.parent

const handleSelect = (item: string) => {
   modalActionConfirm(parentInstance,{ action: ModalResultEnum.mrConfirm, data: item })
}
</script>

<style lang="scss" scoped>
.List-item {
    display: flex;
    cursor: default;
    padding: 5px 10px;
    span:last-child {
        flex: 1
    }
    &:hover {
        background-color: #85b0fe;
    }
}

.active {
    background-color: #CCEEFF;
}

.modal {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 19000;

    &-mask {
        width: 100vw;
        height: 100vh;
        background-color: rgba($color: #000000, $alpha: 0.4);
    }

    &-content {
        position: absolute;
        display: flex;
        outline: 0;
        flex-direction: column;
        top: 50%;
        left: 70%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        border-radius: 8px;
        z-index: 1;
        font-size: 14px;
    }

    &-header {
        padding: 12px 16px;
        border-bottom: 1px solid #e4e7ed;
        height: 20px;
    }

    &-footer {
        padding: 12px 16px;
        border-top: 1px solid #e4e7ed;
        text-align: right;
        height: 30px;
    }

    &-body {
        display: flex;
        flex-direction: column;
        overflow: hidden;
        flex: 1;

        .filter_body {
            height: 30px;
            line-height: 30px;
            border-bottom: 1px solid #eeee;

            input {
                width: 400px;
                outline-color: blue;
            }
        }
    }

    &-close {
        position: absolute;
        top: 12px;
        right: 12px;
        width: 16px;
        height: 16px;
        cursor: pointer;

        &::before,
        &::after {
            content: "";
            display: block;
            position: absolute;
            left: 8px;
            top: 0;
            width: 1px;
            height: 16px;
            background-color: #999;
            border-radius: 0.5px;
            transform: rotate(-45deg);
            z-index: -1;
        }

        &::before {
            transform: rotate(45deg);
        }

        &:hover::before,
        &:hover::after {
            background-color: #444;
        }
    }

    &-button {
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
}
</style>
