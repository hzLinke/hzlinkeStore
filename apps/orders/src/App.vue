<template>
     <router-view></router-view>
</template>
<script setup lang="ts">
    import { useRouter, useRoute } from 'vue-router'
    import commonParam from '@/config';
    import './assets/css/linkeSystemIcon.css'
    import './assets/css/buttonIcon/buttonIcon.css'

    const router = useRouter()
    const route = useRoute()


    const urlParams = new URLSearchParams(window.location.search)
    const billNumber = urlParams.get('billNumber') || ''
    const linkname = urlParams.get('linkname') || ''
    commonParam.$linkname = linkname

    router.replace({
        name: 'Login',
        query: billNumber ? { billNumber } : {}
    })

</script>
<style lang='scss'>
    html,body{
        margin: 0;
        padding: 0;
        font-family: Arial, "宋体";
        font-size: $font-size + 1;
    }
   
    /*表单里面元素就无法继承body的字体属性需要单独设置*/
    input, label, select, option, textarea, button, fieldset, legend { 
        font-family: Arial, "宋体";
        font-size:$font-size+1;
    }
    #app {
       
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }
    .updatePng{
        position: absolute;
        left: 10px;
        top : 10px;
        height: 100px;
        width: 130px;
        z-index: 10;
    }
    .payPng{
        position: absolute;
        left: 170px;
        top : 10px;
        height: 100px;
        width: 130px;
        z-index: 10;
    }

     /*// 设置滚动条的样式
        ::-webkit-scrollbar {
            width:12px;
            height: 12px;
            background-color: rgb(245, 245, 245);
        }
        // 滚动槽 
        ::-webkit-scrollbar-track {
            border-radius:80px;
        }
        // 滚动条滑块 
        ::-webkit-scrollbar-thumb {
            border-radius:10px;
            background:sandybrown;
        }
*/

</style>
