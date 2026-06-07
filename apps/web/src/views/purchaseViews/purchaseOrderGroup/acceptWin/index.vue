<template>
    <form class="form">
            <div class="dataList" >
                <div class="dataList-left">
                    <img :src="getShrinkSrc">
                </div>
                <div class="dataList-center">
                    <div class="dataList-title lk-title lk-ellipsis">{{rowData.name + (rowData.note?'【'+rowData.note+'】':'')}}</div>
                    <div class="dataList-spec lk-h5 lk-ellipsis">规格：{{rowData.spec||'/'}}</div>
                    <div class="dataList-at lk-h5 lk-ellipsis">送货日：{{rowData.deliveryat}}</div>
                </div>
                <div class="dataList-right"> 
                    <div class="dataList-saleType lk-h5 lk-ellipsis">换子：{{clearDecimal(rowData.downwg)+rowData.unit+'/'+rowData.downunit}}</div>
                    <div class="dataList-saleType lk-h5 lk-ellipsis">{{getSaleType}}</div>
                    <div class="dataList-saleType lk-h5 lk-ellipsis">欠数：{{getOwe(rowData)}}</div>
                </div>
            </div>
            <div class="action-body" >
                <div class="from-body">
                    <lkx-input class="shipper-input"
                       
                        :config="ShipperState.config"
                        :dropConfig="ShipperState.dropConfig"
                        v-model="shipperCode"
                    />
                   
                </div>
                <div class="input-body">
                    <label>可用库存：{{rowData.stock+rowData.downunit}}</label>
                    <label>下单数量：<input ref="InputNum" class="_input" v-model="acceptNum" @keypress="handleKeyprees"/>{{rowData.downunit}}</label>
                    <label>单价：<input ref="InputPrice"  class="_input" v-model="accetpCostPrice"/>{{rowData.saletype==2||rowData.saletype==3?rowData.unit:rowData.downunit}}</label>
                    <label class="money">{{Money}}</label>
                    <label class="free"><input type="checkbox"  v-model="acceptFree"/>免采</label>
                </div>
                
            </div>
            <div class="win-action">
                <LkxButton caption="取消" type='default'   @click="handleCancel" ></LkxButton>
                <LkxButton caption="确定" type="default"   @click="handleConfirm" ></LkxButton>
            </div>
    </form>
</template>
<script setup lang="ts">
import { ref, computed, nextTick, onMounted, onUnmounted, watch, getCurrentInstance } from "vue"
import { LkxButton, LkxInput, MessageBox, InputOptionsType, ModalResultEnum } from '@v4x/ui'
import $Utils, { clearDecimal } from '@v4x/utils/lkxUtil'
import commonParam from '@/config'
import { modalActionConfirm,modalActionCancel } from '@v4x/utils'
import errorImage from '@/assets/errorImage.jpg'
import { useAppStore } from '@/stores'

const appStore = useAppStore()
defineOptions({
    name: 'acceptWin'
})

interface Props {
    defaultShipperCode?: number|string
    datas?: any
    shipperDatas?: any[]
    rowIndex?: number
}

const props = withDefaults(defineProps<Props>(), {
    defaultShipperCode: 0,
    datas: () => ({ num: 0 }),
    shipperDatas: () => [],
    rowIndex: -1,
})

const emit = defineEmits<{
    close: [data: any]
}>()

 const InputNum = ref<null | HTMLElement>(null)
const InputPrice = ref<null | HTMLElement>(null)
const shipperCode = ref(props.defaultShipperCode)

const acceptFree = ref(false)
const isMounted = ref(true)


const rowData = computed(() => props.datas)
const acceptNum = ref(rowData.value.num)
const accetpCostPrice = ref(rowData.value.costprice)


const Money = ref((acceptNum.value * (rowData.value.saletype == 2 || rowData.value.saletype == 3 ? rowData.value.downwg : 1) * accetpCostPrice.value).toFixed(2))

const ShipperState = ref<InputOptionsType>({
    config: {
        caption: '供货商',
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
        }
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|shortname|name',
        displayFieldWidths: '50|80|300',
        dropListDatas: props.shipperDatas,
        onFilter: (filterValue: string) => {
            const CurArr = props.shipperDatas
            const arr = CurArr.filter((item: any) => {
                return item.shortname.toLowerCase().indexOf(filterValue.toLowerCase()) != -1 || item.name.toLowerCase().indexOf(filterValue.toLowerCase()) != -1
            })
            return arr
        }
    }
} )

const getShrinkSrc = computed(() => {
    const imgSrcList = props.datas.picsrc.split(';')
    return imgSrcList[0] ? commonParam.$picSrc + 'product/' + imgSrcList[0] : errorImage
})

const getSaleType = computed(() => {
    let res = ''
    switch (parseInt(props.datas.saletype)) {
        case 0:
            res = '称重'
            break
        case 1:
        case 3:
            res = '按量'
            break
        case 2:
            res = '称重+量'
            break
    }
    return res
})

const getOwe = (item: any) => {
    return item.saletype == 2 ? $Utils.clearDecimal(item.num) + item.downunit + '/' + $Utils.clearDecimal(item.numex) + item.unit : $Utils.clearDecimal(item.numex) + item.downunit
}

const handleKeyprees = (e: KeyboardEvent) => {
    if (e.code == 'Enter')
        (InputPrice.value as HTMLInputElement).select()
}

watch(
    () => acceptNum.value,
    (o, n) => {
        if (!isMounted.value) return
        Money.value = (o * (rowData.value.saletype == 2 || rowData.value.saletype == 3 ? rowData.value.downwg : 1) * accetpCostPrice.value).toFixed(2)
    }
)
watch(
    () => accetpCostPrice.value,
    (o, n) => {
        if (!isMounted.value) return
        Money.value = (acceptNum.value * (rowData.value.saletype == 2 || rowData.value.saletype == 3 ? rowData.value.downwg : 1) * o).toFixed(2)
    }
)



watch(
    () => rowData.value,
    (o, n) => {
        if (!isMounted.value) return
        Money.value = (o.inputnum * (o.saletype == 2 || o.saletype == 3 ? o.downwg : 1) * o.costprice).toFixed(2)
    },
    { deep: true }
)

onMounted(() => {
    nextTick(() => {
        (InputNum.value as HTMLInputElement).select()
    })
})

onUnmounted(() => {
    isMounted.value = false
})

const parentInstance = getCurrentInstance()?.parent

const handleConfirm = () => {
    if (shipperCode.value == 0) {
        MessageBox.warning({
            title: '出错',
            content: '请指定供货商',
            showCancel: false
        })
        return
    }
    if (+acceptNum.value === 0) {
        MessageBox.warning({
            title: '出错',
            content: '请输入数量',
            showCancel: false
        })
        return
    }
    const acceptData = {
        ...rowData.value,
        productcode:rowData.value.idcode,
        shippercode:shipperCode.value,
        num:  Math.abs(acceptNum.value),
        numex: rowData.value.saletype==2? Math.abs(acceptNum.value)*rowData.value.downwg: Math.abs(acceptNum.value),// data.numex,
        inputnum: rowData.value.saletype==2? Math.abs(acceptNum.value)*rowData.value.downwg: Math.abs(acceptNum.value),// data.numex,
        price: Math.abs(accetpCostPrice.value),
        deliveryat:rowData.value.deliveryat,
        orderlist:rowData.value.orderlist,
        free:Number(acceptFree.value),
        type:0
    }
    modalActionConfirm(parentInstance,{ action: ModalResultEnum.mrConfirm, data: acceptData })
}

const handleCancel = () => {
    modalActionCancel(parentInstance,{ action: ModalResultEnum.mrCancel, data: null })
}
</script>
<style lang="scss" scoped>
    .shipper-input{
        margin-top: 50px ;
    }
.form{
        display: flex;
        flex-direction: column;
        height: 100%;
        .win-hearder{
            height: 40px;
            flex-shrink: 0;
            border-bottom: 1px solid #e4e7ed ;
            display: flex;
            align-items: center;
            .Input-At{
                margin-left: 10px ;
                width: 250px;
            }
            .shipper-input{
                width: 300px;
            }
            button{
                margin-left: 10px ;
                width: 100px;
            }
        }
        .win-grid{
            flex: 1;
            min-height: 0;
            .grid{
                height: 100%;
            }
        }
        .win-action{
            height: 40px;
            flex-shrink: 0;
            padding: 5px 16px;
            border-top:1px solid #e4e7ed;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
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
            bottom: 1px;
            position: relative;
        }
    }
    .dataList-saleType{
        color: red;
    }
    /* 文本溢出隐藏 */
    .lk-ellipsis {overflow: hidden; white-space: nowrap; text-overflow: ellipsis;}
    .dataList{
        display: flex;
        position: relative;
        padding: 2px;
        &:after{
                position: absolute;
                right: 5px;
                bottom: -2px;
                left: 15px;
                height: 1px;
                content: '';
                background-color:#c8c7cc;
            }
       &-left{
           width: 100px;
           img{
               width: 100px;
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
            width: 240px;
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
   .action-body{
        display: flex;
        flex-direction: row;
        
        .from-body{
            flex: 1;
            display: flex;
            flex-direction: column;
            
            .from-inf{
                height: 30px;
                line-height: 30px;
                border-bottom: 1px solid #bbb ;
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
            ._input{
                margin-top: 10px;
                height: 40px;
                width: 120px;
                text-align: right;
                font-size: 20px;
                outline-color: blue;
            }
            .free{
                margin-top: 10px;
                margin-left: 40px;
                height: 20px;
                width: 180px;
                display: flex;
                align-items: center;
                text-align: right;
                font-size: 20px;
                outline-color: blue;
                input{
                    height: 20px;
                    width: 40px;
                }
            }
        }
        
    }
   .money{
    color: red;
    font-size: 22px;
    padding-top: 10px;
    padding-right: 5px;
    &:before{
		content: '￥';
		font-size: 26upx;
	}
   }
</style>