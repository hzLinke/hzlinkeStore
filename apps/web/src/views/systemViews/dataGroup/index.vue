<template>
    
</template>
<script setup lang="ts">
import { WinModal } from "@v4x/ui";
import {TWinForm} from "@/usehook/win"
import  GroupWin from './GroupWin/index.vue'
import { reactive } from "vue";
const Win = reactive(new TWinForm({}))
defineOptions({ name: 'dataGroup' })

WinModal.open({
    title:'汇总计算',
    width:'500px',
    height:'400px',
    open:false,
    content:GroupWin
}).then(()=>{
    Win.closeWin()
})



</script>
<style lang="scss" scoped>
    .form{
        display: flex !important;
        flex-direction: column;
        margin-top: 5px;
        .one{
            display: flex;
            flex-direction: row;
            padding-bottom: 5px;
            .Input-At{
                 width: 200px;
            }
            input{
                outline: 0;
                height: 30px;
                border: 1px solid #eeee;
                border-radius: 4px;
                width: 150px;
                &:focus{
                    border: 1px solid blue;
                }
            }
            .opbut{
                margin-left: 9px ;
            }
        }
        .tow{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            input{
                outline: 0;
                height: 30px;
                border: 1px solid #eeee;
                border-radius: 4px;
                width: 150px;
                &:focus{
                    border: 1px solid blue;
                }
            }
        }
        .actioninf{
            height: 200px;
            margin-top: 5px ;
            border-top: 1px solid #eeee ;
        }
    }
   
    table{
         border-collapse:collapse;
        
    }
    tablead td{
        text-align: center;
    }
    td{
        padding: 3px;
    }
</style>
