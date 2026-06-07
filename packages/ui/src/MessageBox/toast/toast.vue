<template>
    <Teleport to="body">
        <transition name="fade">
            <div :class="['mt_'+messageType]" :style="positionStyle">{{content}}</div>
        </transition>
    </Teleport>
</template>

<script setup lang="ts">
import { computed } from "vue";
import { type ToastOptions }  from "../messageBox";
const props = withDefaults(defineProps<ToastOptions>(), {
    content:'',
    messageType: 'success', // error|warning
    position:'top', // top|center|bottom
    duration: 2000, // 持续时间，单位为毫秒
})

// 根据 position 计算样式
const positionStyle = computed(() => {
    switch(props.position) {
        case 'top':
            return {
                top: '10%',
                left: '50%',
                transform: 'translate(-50%, -50%)'
            };
        case 'center':
            return {
                top: '50%',
                left: '50%',
                transform: 'translate(-50%, -50%)'
            };
        case 'bottom':
            return {
                top: '80%',
                left: '50%',
                transform: 'translate(-50%, -50%)'
            };
        default:
            return {
                top: '20%',
                left: '50%',
                transform: 'translate(-50%, -50%)'
            };
    }
});
</script>
<style lang="scss" scoped>
    div {
        padding: 5px 20px;
        border-radius: 40upx;
        color: #fff;
        text-align: center;
        position: fixed;
        z-index: 20000000;
        /* 移除固定的 top、left 和 transform 样式，由计算属性动态生成 */
    }
    .mt_success{
        background-color: steelblue;
    }
    .mt_warning{
        background: darkorange;
    }
    .mt_error{
        background: darkred;
    }
    /* vue动画过渡效果设置 */
    .fade-enter-active,
    .fade-leave-active {
        transition: opacity .2s;
    }
    .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
        opacity: 0;
    }
</style>