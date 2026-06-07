<template>
    <span
        class="button-body"
        :class="props.disabled ? 'button-body-disabled' : `button-body-${props.type}`"
        :style="{ height: `${props.height}px`, width: `${props.width}px`, borderRadius: `${props.radius}px` }"
        @click="handleClick"
    >
        <i v-if="props.iconCls" class="button-icon" :class="props.iconCls"></i>
        <span :style="{ marginLeft: props.iconCls ? '-15px' : '' }" class="button-caption">{{ props.caption }}</span>
    </span>
</template>

<script setup lang="ts">
import type { ButtonProps } from './types'

const props = withDefaults(defineProps<ButtonProps>(), {
    type: 'default',
    caption: '按钮',
    height: 27,
    width: 60,
    radius: 2,
    iconCls: '',
    disabled: false
})

const emit = defineEmits<{
    ButClick: [event: MouseEvent]
}>()

const handleClick = (e: MouseEvent) => {
    if (props.disabled) return
    emit('ButClick', e)
}
</script>

<style lang="scss" scoped> 
    .button-body{
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        outline: 0;
        border: 1px solid transparent;
        transition: all 0.2s ease;
        &-disabled{
            border-color: #e4e7ed;
            background: #f5f7fa;
            color: #c0c4cc;
            cursor: not-allowed;
            opacity: 0.6;
        }
        
        &-default{
            border-color: #d3d3d3;
            background: #f0f0f0;
            color: #333333;
            &:hover{
                background: #e5e5e5;
                border-color: #c0c0c0;
            }
            &:active{
                background: #d6d6d6;
                border-color: #a8a8a8;
            }
        }
        
        &-primary{
            border-color: #409eff;
            background: #409eff;
            color: #ffffff;
            &:hover{
                background: #66b1ff;
                border-color: #66b1ff;
            }
            &:active{
                background: #3a8ee6;
                border-color: #3a8ee6;
            }
        }
        
        &-success{
            border-color: #67c23a;
            background: #67c23a;
            color: #ffffff;
            &:hover{
                background: #85ce61;
                border-color: #85ce61;
            }
            &:active{
                background: #5daf34;
                border-color: #5daf34;
            }
        }
        
        &-info{
            border-color: #909399;
            background: #909399;
            color: #ffffff;
            &:hover{
                background: #a6a9ad;
                border-color: #a6a9ad;
            }
            &:active{
                background: #82848a;
                border-color: #82848a;
            }
        }
        
        &-warning{
            border-color: #e6a23c;
            background: #e6a23c;
            color: #ffffff;
            &:hover{
                background: #ebb563;
                border-color: #ebb563;
            }
            &:active{
                background: #cf9236;
                border-color: #cf9236;
            }
        }
        
        &-danger{
            border-color: #f56c6c;
            background: #f56c6c;
            color: #ffffff;
            &:hover{
                background: #f78989;
                border-color: #f78989;
            }
            &:active{
                background: #dd6161;
                border-color: #dd6161;
            }
        }
        
        .button-icon{
            width: 20px;
            padding: 0 2px;
            text-align: center;
        }
        
        .button-caption{
            flex: 1;
            text-align: center;
        }
    }
</style>
