<template>
    <div class="weigh-body" >
        <div class="weigh-info-body">
            <label class="value-info-unit">斤</label>
            <label :class="[item=='.'?'value-info-point':'value-info']" v-for="(item,index) in getWeight" :key="index">{{item}}</label>
        </div>
        <div class="weigh-status-body">
            <div class="status-body">
                <label class="status-style" :class="{'status-active':status[0]==1}"></label>
                <label class="status-info">零位</label>
            </div>
            <div class="status-body">
                <label class="status-style" :class="{'status-active':status[1]==1}"></label>
                <label class="status-info">稳定</label>
            </div>
            <div class="status-body">
                <label class="status-style" :class="{'status-active':status[2]==1}"></label>
                <label class="status-info">去皮</label>
            </div>
            <div class="status-body">
                <label class="status-style" :class="{'status-active':status[3]==1}"></label>
                <label class="status-info">超载</label>
            </div>
            <div class="status-body">
                <label class="status-style" :class="{'status-active':status[5]==1}"></label>
                <label class="status-info">异常</label>
            </div>
            <div class="status-body">
                <label class="status-style" :class="{'status-active':status[6]==1}"></label>
                <label class="status-info">锁定</label>
            </div>
            <div class="status-body">
                <label class="status-style" :class="{'status-active':status[7]==1}"></label>
                <label class="status-info">I/O</label>
            </div>
        </div>
        <div class="weigh-action">
            <div class="link-status" :class="{'err':linkStatus>0}">{{getLinkeStatus}}</div>
            <div class="action-body">
                <span class="action-but">置零</span>
                <span class="action-but">去皮</span>
            </div>
           
        </div>
    </div>
</template>
<script setup lang="ts">
import { computed } from "vue";
import { useAppStore } from '@/stores'

const appStore = useAppStore()
defineOptions({
    name: 'weightScreen'
})

const props = withDefaults(defineProps<{
    weight: string | number
    status: number[]
    linkStatus: number
}>(), {
    weight: '0.00',
    status: () => [0,0,0,1,1],
    linkStatus: 0
})

const getWeight = computed(()=>{
    return (props.weight as string).split('').reverse()
})

const getLinkeStatus = computed(()=>{
    let res = '';
    switch (props.linkStatus){
        case -1:
            res = '正在连接...';
            break;
        case 0:
            res = '称重设备连接正常';
            break;
        case 10001:
            res = '称重服务无启动';
            break;
    }
    return res;
})
</script>
<style lang="scss" scoped>
   .weigh-body{
        display: flex;
        flex-direction: column;
        position: relative;
        padding-bottom: 5px;
        .weigh-info-body{
            display: flex;
            flex-direction: row-reverse;
            align-items: center;
            height: 70px;
            margin: 0 10px 0 10px;
            border: 1px solid black;
            label{
                margin-left: 5px ;
                text-align: center;
            }
            .value-info-unit{
                display: block;
                margin-top:20px;
                font-size: 30px;
            }
            .value-info-point{
                display: block;
                margin-top:10px;
                width: 10px;
                font-size: 50px;
            }
            .value-info{
                display: block;
                width: 30px;
                margin-top:10px;
                font-size: 50px;
            }
        }
        .weigh-status-body{
            display: flex;
            flex-direction: row-reverse;
            margin: 10px 10px 0 10px;
            .status-body{
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                 margin-left: 40px;
                .status-active{
                    background: #000;
                }
                .status-style{
                    display: block;
                    width: 15px;
                    height: 15px;
                    border:1px solid black;
                    border-radius: 50%;
                }
                .status-info{
                    text-align: center;
                    padding-top: 5px;
                }
            }
        }
        .weigh-action{
            display: flex;
            flex-direction: row;
            margin-top: 10px;
            .err{
                color: red;
            }
            .link-status{
                flex: 1;
                line-height: 40px;
                font-size: 20px;
            }
            .action-body{
                width: 300px;
                display: flex;
                flex-direction: row-reverse;
                span{
                    margin: 0 10px; 
                    width: 100px;
                    height: 40px;
                    line-height: 40px;
                    display: block;
                    text-align: center;
                    border: 1px solid #eeee;
                    border-radius: 10px;
                }
                .action-but{
                    cursor: pointer;
                    &:hover{
                        background: blue;
                        color: white;
                    }
                    &:active{
                        background: blueviolet;
                    }
                }
            }
        }
    }
    
</style>
