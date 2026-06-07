<template>
  
  <div class="container">
    <div class="container-left"></div>
    <div class="container-center"><WorkProcess/></div>
    <div class="container-right"></div>
  </div>
    
</template>

<script  lang = 'ts'>
import { defineComponent,onMounted, toRaw,ref,reactive,getCurrentInstance,provide,inject} from 'vue'

import WorkProcess from "@/views/common/ProcessNav/index.vue"
import {fireHtmlEvent,fireMoseEvent} from '@/usehook/fireEvents';
import { debounce } from 'lodash';
export default defineComponent({
  name: 'home',
  components:{
    WorkProcess
  },
  setup(props,ctx){
    const keyUp = debounce((e: any)=>{console.log(e)},300)
   /* const r = `鲜鸡 2只
小白菜 3斤`;
    const r1 = r.split('\n')[0]
    console.log( r1.split(' '))*/
    return {keyUp}
  }
});
</script>

<style lang="scss" scoped>
  .container{
    display: flex;
    &-left{
      width: 200px;
    }
    &-center{
      width: 700px;
    }
    &-right{
      flex:1
    }
  }
</style>
