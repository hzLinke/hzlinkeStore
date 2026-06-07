<template>
  <DisAction/>
</template>

<script  lang = 'ts'>
import { defineComponent,onMounted, toRaw,ref,reactive,getCurrentInstance,provide,inject} from 'vue'
import DisAction from "@/views/disAction/index.vue"
export default defineComponent({
  name: 'home',
  components:{
    DisAction
  },
  setup(props,ctx){
   
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
