<template>
    <lkx-modal :config= "config" :datas='rowData' :rowIndex="rowIndex" @close="(config as any).handleClose">
        <div class="form">
            <div class="op-body">
                <div class="info-body">
                    <div class="dataList">
                        <div class="dataList-left">
                            <img :src="ImgUrl" @error="handleImgError">
                        </div>
                        <div class="dataList-center">
                            <div class="dataList-title lk-title lk-ellipsis">{{rowData.name + (rowData.note?'【'+rowData.note+'】':'')}}</div>
                            <div class="dataList-spec lk-h5 lk-ellipsis">规格：{{rowData.spec||'/'}}</div>
                            <div class="dataList-at lk-h5 lk-ellipsis">送货日：{{rowData.deliveryat}}</div>
                        </div>
                        <div class="dataList-right"> 
                            <div class="dataList-stock lk-ellipsis">{{rowData.productcode}}#</div>
                            <div class="dataList-saleType lk-h5 lk-ellipsis">{{getSaleType}}</div>
                            <div class="dataList-saleType lk-h5 lk-ellipsis">{{rowData.customershortname}}</div>
                        </div>
                    </div>
                    <div class="action-body" >
                        <div class="from-body">
                            <div class="from-inf">商品来源</div>
                            <div class="from-list" v-for="(item,index) in rowData.stockFrom" :key="index">
                                <div class="from-list-name lkx-ellipsis">{{item.shippername}}</div>
                                <div  class="from-list-num lkx-ellipsis">{{getFrom(item)}}</div>
                                <div  class="from-list-note lkx-ellipsis">{{item.note}}</div>
                            </div>
                        </div>
                        <div class="input-body">
                            <div class="dataList-saleType lk-h5 lk-ellipsis">{{ rest?'重配货':'' }}</div>
                            <div style="margin-top: 40px"  class="dataList-saleType lk-h5 lk-ellipsis">应配数量：{{getOrderNumber}}</div>
                            <label>配货数量：<input name="ElInputNumEx" ref="InputNumEx" v-model="disNum" @keypress="handleKeyprees"/>{{getDisUnit}}</label>
                        </div>
                    
                    </div>
                </div>
                <div class="keyboard-body">
                    <KeyBoard class="keyBoard"  @KeyBoardInput="handleKeyBoardInput" @KeyBoardClose="handleKeyBoardClose"/>
                </div>
            </div>
        </div>
    </lkx-modal>
</template>
<script setup lang="ts">
import { ref, computed, nextTick, onMounted, onUnmounted } from "vue";
import { LkxModal } from '@v4x/ui'
import WeightScreen from "./weightScreen/index.vue";
import KeyBoard from "./keyboard/index.vue"
import $Utils,{clearDecimal} from '@v4x/utils/lkxUtil'
import commonParam from '@/config'
import errorImage from '@/assets/errorImage.jpg'
import { useAppStore } from '@/stores'

const appStore = useAppStore()
defineOptions({
    name: 'disWin'
})

const props = withDefaults(defineProps<{
    SerialPort?: object
    rest: boolean
    datas: { }
    rowIndex: number
    EnabledWeighing: boolean
    config: object
}>(), {
    SerialPort: () => ({}),
    rest: false,
    datas: () => ({ num: 0 }),
    rowIndex: -1,
    EnabledWeighing: false,
    config: () => ({})
})

const InputNum = ref<null | HTMLElement>(null)
const InputNumEx = ref<null | HTMLElement>(null)
const scaleWeight = ref('0.00');
const scaleStatus = ref([0,0,0,0]);
const linkeStatus = ref(-1);
const disNum = ref(0);
const rowData = ref({} as any);
rowData.value = Object.assign({},props.datas);
if (props.rest) { rowData.value.owenumex = rowData.value.ordernum}
disNum.value = rowData.value.owenumex;

const connectSerial = async() =>{
    let _data = '';
    if (!props.SerialPort){
        return;
   }
   if (!(props.SerialPort as any).readable){
       const openRes = await (props.SerialPort as any).open({ baudRate: 9600 });
   }
   const reader = (props.SerialPort as any).readable.getReader();
    try {
        while (true) {
            const { value, done } = await reader.read();
            if (done) {
                break;
            }
            const data = new TextDecoder().decode(value);
            if (data.trim()){
                _data += data.trim()
                if (_data.charAt(_data.length-1)=='g'){
                    const start = _data.lastIndexOf(',')+1
                    const end = _data.lastIndexOf('kg')
                    const _val = _data.substring(start,end)
                    rowData.value.owenumex = _val
                    reader.releaseLock();
                    (props.SerialPort as any).close()
                    handleKeyBoardClose('Confirm')
                    break;
                }
            }
        }
    } finally {
        reader.releaseLock();
    }
}

const getSaleType = computed(()=>{
    let res = ''
    switch (parseInt((props.datas as any).saletype)){
        case 0:
            res = '称重'
            break;
        case 1:
        case 3:
            res = '按量'
            break;
        case 2:
            res = '称重+量'
            break;
    }
    return res;
})

const getOrderNumber = computed(()=>{
    if (parseInt(rowData.value.saletype)==2){
        return $Utils.clearDecimal(rowData.value.num)+rowData.value.downunit+'/'+$Utils.clearDecimal(rowData.value.numex)+rowData.value.unit
    } else {
        return $Utils.clearDecimal(rowData.value.owenumex)+rowData.value.downunit
    }
})

const getDisUnit = computed(()=>{
    if (parseInt(rowData.value.saletype)==2){
        return rowData.value.unit
    } else {
        return rowData.value.downunit
    }
})

const getFrom=(item: any)=>{
    return item.saletype==2? $Utils.clearDecimal(item.num)+item.downunit +'/'+$Utils.clearDecimal(item.numex)+item.unit:$Utils.clearDecimal(item.numex)+item.unit;
}

const handleKeyprees=(e: KeyboardEvent)=>{
    if (e.code == 'Enter'||e.key == 'Enter'){
        handleKeyBoardClose('Confirm')
    }
}

const handleKeyBoardInput = (data: string)=>{
    disNum.value = +data
}

const handleKeyBoardClose = (action: string)=>{
    if (action == 'Cancel'){
        (props.config as any).handleClose({type:'mrCancel',thisDisNum: disNum.value})
    }
    if (action == 'Confirm'){
        if (disNum.value<=0) return;
        (props.config as any).handleClose({type:'mrOk',thisDisNum: disNum.value})
    }
}

const ImgUrl = computed(()=>{
    return $Utils.getfirstImg(`https://www.hzlinke.com.cn/LinkeServiceSystem/upImage/${commonParam.$linkname}/product/`,rowData.value.picsrc,errorImage)||''
})

const handleImgError = (e: Event) => {
    const img = e.target as HTMLImageElement
    img.src = errorImage
    img.onerror = null
}

if (props.EnabledWeighing){
    if (rowData.value.saletype!=1){
          connectSerial()
    }
}

onMounted(()=>{
    nextTick(()=>{
        (InputNumEx.value as HTMLInputElement).select()
    })
})


</script>
<style lang="scss" scoped>
    .form{
        display: flex;
        flex-direction: column;
        .payType-input{
            padding-bottom: 10px;
        }
    }
    .lk-title{
        font-size: 30px;
        color: black;
    }
    .lk-h5{
        padding: 5px 10px;
        font-size: 20px;
        color: #8f8f94;
    }
    .lk-price{
        &:before{
            content: '¥ ';
            font-size: 10px;
        }
    }
    .lk-num{
        &:before{
            content: 'x ';
            font-size: 10px;
            bottom:1px;
            position: relative;
        }
    }
    .dataList-saleType{
        color: red;
    }
    .lk-ellipsis {overflow: hidden; white-space: nowrap; text-overflow: ellipsis;}
    .dataList{
        display: flex;
        position: relative;
        padding: 2px;
        margin-top: 5px;
        margin-bottom: 5px;
        &:after{
                position: absolute;
                right:5px;
                bottom: -2px;
                left: 15px;
                height:1px;
                content: '';
                background-color:#c8c7cc;
            }
       &-left{
           width: 100px;
           img{
               width:100px;
               height: 100px;
           }
       }
       &-center{
           flex: 1;
           .dataList-title{
                padding-top: 8px ;
                padding-left: 5px;
           }
           .dataList-customer{
                padding-left: 4px;
           }
       }
       &-right{
            width: 200px;
            text-align: right;
            .dataList-stock{
                padding: 10px 10px;
                font-size: 20px;
                color: #8f8f94;
            }
            .dataList-num{
                 padding: 5px 10px;
                 font-size: 20px;
                 color: #8f8f94;
                 &:before{
                    content: 'x ';
                    font-size: 8px;
                }
            }
       }
   }
    .op-body{
        display: flex;
        border-top:1px solid #bbb ;
        .info-body{
            flex: 1;
            position: relative;
            overflow: hidden;
            .action-body{
                display: flex;
                flex-direction: row;
                position: relative;
                margin-top: 2px;
                .from-body{
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                    .from-inf{
                        height: 30px;
                        line-height: 30px;
                        border-bottom:1px solid #bbb ;
                    }
                    .from-list{
                        display: flex;
                        flex-direction: row;
                        padding-top: 3px;
                        &-name{
                            flex: 1;
                        }
                        &-num{
                            width: 100px;
                            text-align: right;
                        }
                        &-note{
                            width: 50px;
                            text-align: right;
                        }
                    }
                }
            .input-body{
                    width: 240px;
                    padding: 10px;
                    display: flex;
                    text-align: right;
                    flex-direction:column;
                    input{
                        margin-top: 10px;
                        height: 40px;
                        width: 120px;
                        text-align: right;
                        font-size: 20px;
                        outline-color: blue;

                    }
                }
            }
        }
        .keyboard-body{
            width: 300px;
            .keyBoard{
                margin-top: 10px;
            }
        }
    }
   
   

</style>
