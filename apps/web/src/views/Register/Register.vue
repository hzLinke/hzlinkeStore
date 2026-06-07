<template>
  <div class="container">
    <div class="list"><label>执照号码：</label><input class="_input" placeholder="营业执照号码"/></div>
    <div class="list"><label>执照名称：</label><input class="_input" placeholder="营业执照名称"/></div>
    <div class="list"><label>简称：</label><input class="_input" placeholder="营业执照简称"/></div>
    <div class="list"> <label>注册代表：</label><input class="_input" placeholder="用于生成系统管理员的姓名"/></div>
    <div class="list"><label>代表手机：</label><input class="_input" placeholder="用于生成系统管理员的手机号码"/></div>
    <div class="list"><label>验证码：</label><input class="inp_checkcode"/><button class="but_checkcode">获取验证码</button></div>
    <div class="list"><input type="checkbox"/>同意协议</div>
    <div class="action">
        <button>注册</button>
        <button @click="handleBack">返回</button>
    </div>
  </div>
</template>
  
  <script  lang = 'ts'>
  import { defineComponent,onMounted, toRaw,ref,reactive,getCurrentInstance,provide,inject} from 'vue'
  import { debounce } from 'lodash';
  import { useRouter,useRoute  } from "vue-router";
  export default defineComponent({
    name: 'home',
    components:{

    },
    setup(props,ctx){
      const router = useRouter();
      const handleBack = ()=>{
        router.replace({
            name:'Login',
            params:{}
        })
      }
      return {handleBack}
    }
  });
  </script>
  
  <style lang="scss" scoped>
    .container{
      position: absolute;   
      top: 50%;   
      left:50%;   
      margin: -250px 0 0 -250px;   
      width: 430px;   
      height: 430px;  
      border: 1px solid #3762bc; 
      border-radius: 5px;
      padding: 20px 10px;
      display: flex;
      flex-direction: column;
      .inp_checkcode{
        height:30px;
        width: 210px;
      }
      .but_checkcode{
        height: 36px;
      }
      .list{
        display: flex;
        line-height: 40px;
      }
      label{
        display: block;
        width: 80px;
      }
      ._input{
        height:30px;
        width: 300px;
      }
      div{
        padding: 6px;
      }
      .action{
        display: flex;
        button{
          margin: 0 20px;
          width: 50px;
          height: 40px;
          flex: 0 0 40%;
        }
      }
    }
  </style>
  