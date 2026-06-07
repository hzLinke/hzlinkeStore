<template>
     <router-view></router-view>
</template>
<script lang="ts">
   
    import { defineComponent,provide,ref,reactive, getCurrentInstance } from 'vue';
    import { useRouter,useRoute  } from "vue-router";
    import './assets/css/linkeSystemIcon.css'
    import './assets/css/buttonIcon/buttonIcon.css'
    export default defineComponent({
        components: {
            
        },
        setup(){
           
            const route = useRoute()
            const router = useRouter()
            //**刷新时返回首页 
            const loginDatas = sessionStorage.getItem('loginDatas')
            router.replace(
                {
                    name:'Login'
                }
            )
            /*if (loginDatas&&route.path=='/'){
                router.replace(
                    {
                        name:'Home'
                    }
                )
            } else {
                router.replace(
                    {
                        name:'Login'
                    }
                )
            }*/
             const unload=(e: any)=> {
				e = e || window.event
				if (e) {
				// 在这里阻止默认的刷新，弹出弹框
					e.returnValue = '关闭提示'
				}
				return '关闭'
			}
           // window.addEventListener('beforeunload',unload)
            const stopF5Refresh=()=> {
               /* document.onkeydown = function(e: KeyboardEvent) {
                    var code = e.code as number;
                    //屏蔽F1---F12
                    if (code > 111 && code < 124) {
                    if (evt.preventDefault) {
                        evt.preventDefault();
                    } else {
                        evt.keyCode = 0;
                        evt.returnValue = false;
                    }
                    }
                };*/
                //禁止鼠标右键菜单
                document.oncontextmenu = function(e) {
                    return false;
                };
                //阻止后退的所有动作，包括 键盘、鼠标手势等产生的后退动作。
                history.pushState(null, 'null', document.URL);
                window.addEventListener('popstate', 
                    ()=> {
                        history.pushState(null, 'null', document.URL);
                    }
                )
            }
            stopF5Refresh()


        }
    });
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
