<template>
    <div class="win" ref="WinBox" @keydown="handleKeyDown" :tabindex="1">
       <div class="win-hearder">
            <!--<label style="padding-left:20px">请选择送货日期<input class="Input-DeliveryAt" type="date" v-model="deliveryAt" /></label>-->
            <lkx-input class="Input-DeliveryAt"
                name="ElInputDeliveryAt"
                :config="deliveryAtState.config"
                v-model="deliveryAt"
            />
            <label class="label"><input name="ELType1" class="radio" v-model="disType" type="radio" value="0" >按客户</label>
            <label class="label"><input  name="ELType2" class="radio" v-model="disType" type="radio" value="1">按分类</label>
            <label class="label"><input name="ELType3" class="radio" v-model="disType" type="radio" value="2">按货商(采购接单必须处理)</label>
            <input  name="ELinputText" class="search-input" v-model="inputText" placeholder="请输入品名 回车搜索" @keypress="handleSearch" />
            <button class="applay-button"  @click="handleApplay">应用</button>
            <label class="label"><input name="ElShowFinsh" class="radio" v-model="isShowFinsh" type="checkbox" >显示完成</label>
        </div> 
       <div class="win-body" @click="detialVisabled=false" >
            <div class="Cate-item-body" v-if="detialVisabled" @click.stop="">
                <div class="action" v-if="allowedMergeSubmit">
                    <label>一键配货只针对非称重商品</label>
                    <button @click="mergeSubmit(detailDataSource.dataSet)">一键配货</button>
                </div>
                <div class="productList">
                    <ProductGrid  class="productGrid" v-for="(rowItem,rowIndex) in detailDataSource.dataSet" 
                        :key="rowIndex" :itemData="rowItem" 
                        @itemClick = "handleDetailDisClick(rowItem,rowIndex)"
                    ></ProductGrid>
                </div>
               
            </div>
            <div class="win-body-left">
                <div class="empty" v-if="dataSource.dataSet.length==0">^-^没有配货数据^-^</div>
                <div class="grid-body" v-for="(ArrItem,ArrIndex) in dataSource.dataSet" :key="ArrIndex">
                    <div class="groupInfo">{{getTitleInf(ArrItem)}}</div>
                    <div class="item-body">
                        <ProductGrid  class="productGrid" v-for="(Item,ItemIndex) in ArrItem.children" 
                            :key="ItemIndex" :itemData="Item" 
                            @itemClick = "handleDisClick(Item,ArrIndex,+ItemIndex)"
                        ></ProductGrid>
                    </div>
                </div>
            </div>
            <div class="win-body-right">
                <div class="all-button"><button @click="openData(disType)">全部</button></div>
                <div class="item-body">
                    <div class="item" :class="{'active':listSelectedIndex==index}" v-for="(item,index) in rightDataList" :key="index" @click="handleListClick(item,index)">{{ item.name }}</div>
                </div>
            </div>
       </div>
    </div>
    <DisWin v-if="disWinState.config.open" :SerialPort="SerialPort || {}" :rest="restDis" :datas="disWinState.datas" :config="disWinState.config" :EnabledWeighing="EnabledWeighing" :rowIndex="-1"/>
</template>
<script setup lang="ts">
import { reactive, ref ,computed,watch ,nextTick} from 'vue'
import $Utils from '@v4x/utils/lkxUtil'
import { InputOptionsType, LkxInput, MessageBox, ModalResultEnum } from '@v4x/ui'
import DisWin from './disWin/index.vue'
import ProductGrid from './ProductGrid/ProductGrid.vue'
import {TDataSource} from "@/usehook/dataSource"
import {TWinForm} from "@/usehook/win"
import {TCustomerGridAction} from "./action"
import $api from '@/request/api';
import commonParam from '@/config'
import {useAppStore} from '@/stores'
const appStore = useAppStore()

defineOptions({
    name:'disAction'
})
const printDom = ref<null | HTMLElement>(null)
const WinBox = ref<null | HTMLElement>(null)
const userCode = appStore.loginDatas.idcode;
const deliveryAt = ref($Utils.getDate('d',0));
const disType = ref(0);
const shipperCode = ref(0); 
const cateCode = ref(0); 
const listSelectedIndex = ref(-1);
const detialVisabled = ref(false);
const isShowFinsh = ref(true)
const arrMainIndex = ref(-1);
const arrSubIndex = ref(-1);
const detailIndex = ref(-1)
const EnabledWeighing = ref(false);
const SerialPort = ref(null);
const inputText = ref('')
const restDis = ref(false);
const forceOver = ref(false);
const thisItem = ref({} as any);
const thisParentItem = ref({} as any);
const detailDataIsChange = ref(false);
const disWinState = reactive({
    datas:{},
    config:{
        open: false,
        title:'称重配货',
        width:'830px',
        hideFooter: true,
        handleClose: async (data: any)=>{
            disWinState.config.open = false;
            if (data.type=='mrOk'){
                submit(thisItem.value,data.thisDisNum)
                return;
            }
            restDis.value = false;
        }
    }
});
const dataSource = reactive(
    new TDataSource({
        ApiPath:'/masterApi/disApi/dis/disDisTribution/',
        KeyFieldName: 'ProductCode',
        NotAllowOperationList: [],
        getParmars: {}
    })
);
const detailDataSource = reactive(
    new TDataSource({
        ApiPath:'/masterApi/disApi/dis/disDisTribution/',
        KeyFieldName: 'ProductCode',
        NotAllowOperationList: [],
        getParmars: {}
    })
);

const Win = reactive(new TWinForm({}));


const gridAction = reactive(new TCustomerGridAction(dataSource,{}));

const rightDataList =  ref(gridAction.commonDatas.CustomerDatas)
const deliveryAtState = ref<InputOptionsType>({
    config:{
        caption: '请选择送货日期', 
        captionWidth:120,
        align: 'left',
        captionAlign:'right',
        inputType:'datetime',
        format:'yyyy-MM-dd',
        onChange:(data: any)=>{
            openData(disType.value)
        }
    }
}) 
const shipperState = ref<InputOptionsType>({
    config:{
        caption: '客户', 
        captionWidth:70,
        align: 'left',
        captionAlign:'right',
        inputType:'drop',
    },dropConfig:{
        allowInput: false,
        allowFilter: true,
        dropListPosition:{},
        resultFieldName:'idcode',
        displayFieldName: 'name',
        displayFields:'idcode|name',
        displayFieldWidths:'50|300',
        dropListDatas: gridAction.commonDatas.CustomerDatas,
        onFilter:(filterValue: string)=>{
            const arr = gridAction.commonDatas.CustomerDatas?.filter((item: any)=>{
                return item.name.indexOf(filterValue)!=-1
            })
            return arr
        }
    }
})
const cateState = ref<InputOptionsType>({
    config:{
        caption: '分类', 
        captionWidth:70,
        align: 'left',
        captionAlign:'right',
        inputType:'drop',
        onChange:(data: any)=>{
        }
    },dropConfig:{
        allowInput: false,
        allowFilter: true,
        dropListPosition:{},
        resultFieldName:'idcode',
        displayFieldName: 'name',
        displayFields:'idcode|name',
        displayFieldWidths:'50|300',
        dropListDatas: gridAction.commonDatas.CateDatas,
        onFilter:(filterValue: string)=>{
            const arr = gridAction.commonDatas.CateDatas?.filter((item: any)=>{
                return item.name.indexOf(filterValue)!=-1
            })
            return arr
        }
    }
})

const getTitleInf =(item: any)=>{
    if (disType.value == 0){
        const _Name = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas,'idcode','name',item.customercode)
        const _SelfCode = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas,'idcode','selfcode',item.customercode)
        const _DeliveryAt = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas,'idcode','deliveryat',item.customercode)
        return '【'+_SelfCode+'】'+ _Name.toString() + '  送货时间：'+_DeliveryAt.toString()
    } 
    if (disType.value == 1) {
        const _Name = $Utils.getValueFromArray(gridAction.commonDatas.CateDatas,'idcode','name',item.catecode)         
        return '【'+item.catecode+'】'+_Name 
    }
    if (disType.value == 2) {
        const _Name = item.shippercode==0?'存货':$Utils.getValueFromArray(gridAction.commonDatas.ShipperDatas,'idcode','name',item.shippercode)         
        return '【'+item.shippercode+'】'+_Name 
    }
}
const getRigthDatas = ()=>{
    const _Arr = []
    if (disType.value == 0){
        for (let i=0;i<dataSource.dataSet.length;i++){
            const _Name = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas,'idcode','name',dataSource.dataSet[i].customercode)
            _Arr.push({idcode: dataSource.dataSet[i].customercode,name:_Name})
        }
       
    }  
    if (disType.value == 1){
        for (let i=0;i<dataSource.dataSet.length;i++){
            const _Name = $Utils.getValueFromArray(gridAction.commonDatas.CateDatas,'idcode','name',dataSource.dataSet[i].catecode)
            _Arr.push({idcode: dataSource.dataSet[i].catecode,name:_Name})
        }
    } 
    if (disType.value == 2){
        for (let i=0;i<dataSource.dataSet.length;i++){
            const _Name =  dataSource.dataSet[i].shippercode==0?'存货':$Utils.getValueFromArray(gridAction.commonDatas.ShipperDatas,'idcode','name',dataSource.dataSet[i].shippercode)
            _Arr.push({idcode: dataSource.dataSet[i].shippercode,name:_Name})
        }
    } 
    return _Arr;
}

const thisH = $Utils.getDatePart('h');
if (gridAction.commonDatas.SysParamDatas[0].exceedtimetoday<thisH){
    deliveryAt.value = $Utils.getDate('d',1)
}
dataSource.getParams.extraData = 'none';
dataSource.getParams.sortFields = 'DisAt,customerCode,productcode'
dataSource.getParams.condition=`deliveryAt='${deliveryAt.value}'`;
gridAction.getParams = {
    procName:'sp_build_DisAction_FromCustomer',
    procParmars:{
        DeliveryAt: deliveryAt.value,
        Condition: ''
    }
}

EnabledWeighing.value = gridAction.commonDatas.SysParamDatas[0].enabledweighing==1;
const allowedMergeSubmit = computed(()=>{
    const _Arr = detailDataSource.dataSet.filter(item=>item.distributionstatus<2);
    return _Arr.length >0&&(_Arr[0].saletype==1||_Arr[0].saletype==3)
})
const format=(rowItem: any,cellItem: any, fieldName: string)=>{
    if (cellItem.customFormater){
        if(typeof cellItem.customFormater =='function'){
            return cellItem.customFormater(rowItem[fieldName],rowItem)
        }
    } else {
        return  rowItem[fieldName]
    }
}
const openDetailData = (Condition: string = '',FromType: string = '')=>{
    detailDataSource.close()
    detailDataSource.getParams.extraData = FromType;
    detailDataSource.getParams.condition = Condition;
    detailDataSource.open({pageSize:0,curPage:1,total:0})
}
const openData = (Type: number,Condition: string = '')=>{
    detialVisabled.value = false;
    if (Type==0) {
        gridAction.getParams = {
            procName:'sp_build_DisAction_FromCustomer',
            procParmars:{
                DeliveryAt: deliveryAt.value,
                Condition: Condition
            }
        }
    }
    if (Type==1) {
            gridAction.getParams = {
                procName:'sp_build_DisAction_FromCate',
                procParmars:{
                    DeliveryAt: deliveryAt.value,
                    Condition: Condition
                }
            } 
        }
    if (Type==2) {
            gridAction.getParams = {
            procName:'sp_build_DisAction_FromShipper',
                procParmars:{
                    DeliveryAt: deliveryAt.value,
                    Condition: Condition
                }
        }
    }
    gridAction.open(isShowFinsh.value).then(res=>{
        if (!Condition)
            rightDataList.value =  getRigthDatas()
    })
}
const restOpenData = async (DisType: number,Condition: string = '',FromType: string = '')=>{
    let Params = {}
    if (DisType==0) {
       Params = {
            procName:'sp_build_DisAction_FromCustomer',
            procParmars:{
                DeliveryAt: deliveryAt.value,
                Condition: Condition
            }
        }
    }
    if (DisType==1) {
        Params = {
                procName:'sp_build_DisAction_FromCate',
                procParmars:{
                    DeliveryAt: deliveryAt.value,
                    Condition: Condition
                }
            } 
        }
    if (DisType==2) {
        Params = {
            procName:'sp_build_DisAction_FromShipper',
                procParmars:{
                    DeliveryAt: deliveryAt.value,
                    Condition: Condition
                }
        }
    } 
    if (DisType==3) {
        Params = {
            pageSize:0,
            curPage:1,
            total:0,
            KeyFieldName: 'productcode',
            extraData: FromType,
            condition: Condition
        }
    }
    return gridAction.restOpen(DisType,Params)
}
const handleListClick = (item: any,rowIndex: number)=>{
    let _Condition = ''
    if (disType.value == 0)
            _Condition = item.idcode!=0?`customerCode = ${item.idcode}`:''
     if (disType.value == 1)
           _Condition = `cateCode = ${item.idcode}`
     if (disType.value == 2)
            _Condition = `shipperCode = ${item.idcode}`
    listSelectedIndex.value = rowIndex;
    openData(disType.value,_Condition)
}
const handleApplay = (e: Event)=>{
    openData(disType.value)
}
const handleDisClick = async (data: any,ArrIndex: number,ItemIndex: number)=>{
    arrSubIndex.value = ItemIndex;
    arrMainIndex.value = ArrIndex;
    thisParentItem.value = data;
    thisItem.value = data;
    if (disType.value==0&&data.distributionstatus==2) {
        const res = await MessageBox.question({
            title:'提问',
            content:  "配货完成商品，请选择操作类型！！",
            showAbort: true,
            abortText: '重配货',
            confirmText:'打标签'
        })
        if (res.action === ModalResultEnum.mrCancel || res.action === ModalResultEnum.mrClose){return; }
        if (res.action === ModalResultEnum.mrConfirm){
            handlePrint(data)
            return;
        }
        if (res.action === ModalResultEnum.mrAbort){
            restDis.value = true;
        }
    }
    if (disType.value==0&&data.distributionstatus==1) {
        const res = await MessageBox.question({
            title:'提问',
            content:  "部分配货商品，请选择操作类型！！",
            showAbort: true,
            abortText: '强制完成',
            confirmText:'继续配货'
        })
        if (res.action === ModalResultEnum.mrCancel || res.action === ModalResultEnum.mrClose){return; }
        if (res.action === ModalResultEnum.mrAbort){ 
            forceOver.value = true;
            submit(thisItem.value, 0)
            return;
        }
        if (res.action !== ModalResultEnum.mrConfirm){return; }
    }
   
    
    let _Condition = ''
    if (disType.value!=0){
        _Condition = `DeliveryAt = '${deliveryAt.value}' and ProductCode = ${data.productcode} and SaleType = ${data.saletype}`
        if (!isShowFinsh.value){
            _Condition = _Condition + ` and distributionstatus<2`
        }
        if (disType.value==2){
            _Condition = _Condition + ` and ShipperCode = ${data.shippercode}`
            if (!isShowFinsh.value){
                _Condition =  _Condition + ` and distributionstatus<2`
            }
        }
        detialVisabled.value = true
        openDetailData(_Condition,disType.value==2?'FromShipper':'FromCate')
        return
    }
    gridAction.setFrom(data).then((res: any)=>{
        data.stockFrom = res.From;
        data.stock = res.Stock;
        disWinState.config.open = true
        disWinState.datas = data
    })
    
}
const handleDetailDisClick = async (data: any,Index: number)=>{
    detailIndex.value = Index;
    thisItem.value = data;
    console.log(data)
    if (data.distributionstatus==2) {
        const res = await MessageBox.question({
            title:'提问',
            content:  "配货完成商品，请选择操作类型！！",
            showAbort: true,
            abortText: '重配货',
            confirmText:'打标签'
        })
        if (res.action === ModalResultEnum.mrCancel || res.action === ModalResultEnum.mrClose){return; }
        if (res.action === ModalResultEnum.mrConfirm){
            handlePrint(data)
            return
        }
        if (res.action === ModalResultEnum.mrAbort){
            restDis.value = true;
        }
        
    }
    if (data.distributionstatus==1) {
        const res = await MessageBox.question({
            title:'提问',
            content:  "部分配货商品，请选择操作类型！！",
            showAbort: true,
            abortText: '强制完成',
            confirmText:'继续配货'
        })
        if (res.action === ModalResultEnum.mrCancel || res.action === ModalResultEnum.mrClose){return; }
        if (res.action === ModalResultEnum.mrAbort){
            forceOver.value = true;
            submit(thisItem.value,0);
            return;
        }
        
    }
    gridAction.setFrom(data).then((res: any)=>{
        data.stockFrom = res.From;
        data.stock = res.Stock;
        disWinState.config.open = true
        disWinState.datas = data
    })
    
}
const  submit= async(thisItem: any,ThisDisNum: number,mergeSubmit: boolean=false)=>{
    if (!mergeSubmit){
        MessageBox.loading({
            moreText: '正在配货...',
            mask: true
        })
    }
    const _thisDisNum = (+ThisDisNum).toFixed(1);
    const submitRes = await $api.comonRequest('/masterApi/disApi/dis/disDisTribution/','submit',{
        idkey: thisItem.idkey,
        num: thisItem.num,
        numex: _thisDisNum,
        price: thisItem.saleprice,
        UserCode: userCode,
        Rest: Number(restDis.value),
        ForceOver: Number(forceOver.value)
    })   
    if (submitRes.errCode==0&&!mergeSubmit){
        let _PrintDatas = [],_res
        let _thisChildrenArr = 
                disType.value==0?
                gridAction.dataSource.dataSet[arrMainIndex.value]['children']:
                detailDataSource.dataSet;
        const _DisType = detialVisabled.value?3:disType.value;
        _res = await restOpenData(_DisType,`idkey='${thisItem.idkey}'`,disType.value==2?'FromShipper':'FromCate');
        _PrintDatas = JSON.parse(JSON.stringify(_res[0]));
        
        disType.value==0?_thisChildrenArr[arrSubIndex.value] = _res[0]:_thisChildrenArr[detailIndex.value] = _res[0]
        const _delItemArr = disType.value==0? _thisChildrenArr.splice(arrSubIndex.value,1):_thisChildrenArr.splice(detailIndex.value,1)
        if (isShowFinsh.value){_thisChildrenArr.push(_delItemArr[0]);}
        if (disType.value !=0){
            const _fArray = detailDataSource.dataSet.filter((item)=>{
                return item.distributionstatus != 2
            })
            if (_fArray.length==0){
                detialVisabled.value = false;
                thisParentItem.value.distributionstatus = 2;
            } else {
                console.log('更新欠数')
            }
        }
        if (disType.value==0&&_thisChildrenArr.length==0){
            gridAction.dataSource.dataSet.splice(arrMainIndex.value,1)
        }
        detailDataIsChange.value = disType.value!=0;
        if (_PrintDatas.distributionstatus==2)
            handlePrint(_PrintDatas)
    }   
    restDis.value = false;
    forceOver.value = false;
    if (!mergeSubmit){
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }
    return submitRes;
}
const mergeSubmit = async(DisList: any[] )=>{
    MessageBox.loading({
        moreText: '正在配货...',
        mask: true
    })
    const _DisList = DisList.filter(item=>item.distributionstatus<2)
    const _Arr = JSON.parse(JSON.stringify(_DisList));
    for (let i=0;i<_Arr.length;i++){
        await submit(_Arr[i],_Arr[i].owenumex,true)
        if (i==_Arr.length-1){
            detialVisabled.value = false;
            detailDataIsChange.value = true;
            MessageBox.closeAllLoading()    
        }
    }
}
const handlePrint = async (printDatas: any)=>{
    if (printDatas.saletype==1) return;
    const _PrintDatas = Object.assign({},{},printDatas)
    _PrintDatas.Url = `https://www.hzlinke.com.cn/linkeDisSystem/checkReports/index.html?linkename=${commonParam.$linkname}&billnumber=${printDatas.billnumber}`
    _PrintDatas.distributionnum =  $Utils.clearDecimal(_PrintDatas.distributionnum)+_PrintDatas.unit
    _PrintDatas.numex = $Utils.clearDecimal(_PrintDatas.numex)+_PrintDatas.unit;
    const _Datas =JSON.stringify({datas:[_PrintDatas]})
    const Pramars = {
        Command:'PrintLabel',
        Datas:_Datas,
        DefaultPrintName:  gridAction.commonDatas.SysParamDatas[0].lableprintname,
        Preview: '0'
    }
    $api.getScaleInfo('',Pramars).then((res: any)=>{
    if (res.errCode!=0){
        console.log('服务器无启动')
        return;
    } 
})
}
const handleKeyDown = (e: KeyboardEvent)=>{
    if (e.key=='Escape'){
        Win.closeWin()
    }
}
const handleSearch = (e: KeyboardEvent)=>{
    if (e.key == 'Enter'){
       openData(disType.value,inputText.value?`name like '%${inputText.value}%'`:'')
       inputText.value = '';
    }
}
nextTick(()=>{
    (WinBox.value as HTMLDivElement).focus()
})
const connectSerial = async() =>{
    if (EnabledWeighing.value){
        try {
            SerialPort.value = await (navigator as any).serial.requestPort();
        } catch (error) {
            MessageBox.warning({
                title:'警告',
                content: '电子称(串口)授权出错',
                showCancel: false
            })
        }
    }
    return true;    
}
connectSerial().then(res=>{
    openData(0)
});
watch(()=>detialVisabled.value,(n,o)=>{
    if (!n&&detailDataIsChange.value){
        const _condition = disType.value == 1
            ? `cateCode=${thisParentItem.value.catecode} and productCode=${thisParentItem.value.productcode} and a.SaleType=${thisParentItem.value.saletype}`
            : `shipperCode=${thisParentItem.value.shippercode} and productCode=${thisParentItem.value.productcode} and a.SaleType=${thisParentItem.value.saletype}`
        const _thisChildrenArr = gridAction.dataSource.dataSet[arrMainIndex.value]['children'];
        restOpenData(disType.value,_condition,disType.value==2?'FromShipper':'FromCate').then((_res: any)=>{
            thisParentItem.value.distributionnum = _res[0].distributionnum;
            thisParentItem.value.distributionstatus = _res[0].distributionstatus;
            thisParentItem.value.owenumex = _res[0].owenumex;
            const _delItemArr = _thisChildrenArr.splice(arrSubIndex.value,1)
            if (isShowFinsh.value){_thisChildrenArr.push(_delItemArr[0]);}
            if (_thisChildrenArr.length==0){
                gridAction.dataSource.dataSet.splice(arrMainIndex.value,1)
            }
        })
        detailDataIsChange.value = false;
    }
})
watch(
    ()=>disType.value,
    (n,o)=>{
        listSelectedIndex.value = -1;
        detialVisabled.value = false;
        switch (Number(n)){
            case 0:
                rightDataList.value = gridAction.commonDatas.CustomerDatas;
                gridAction.Columns = gridAction.CustomerColumns;
                gridAction.arrGroupFieldName = 'customercode'
                dataSource.dataSet = []
                openData(disType.value)
                break;
            case 1:
                gridAction.Columns = gridAction.CateColumns;
                rightDataList.value = gridAction.commonDatas.CateDatas;
                gridAction.arrGroupFieldName = 'catecode'
                dataSource.dataSet = []
                 openData(disType.value)
                break;
            case 2:
                rightDataList.value = gridAction.commonDatas.ShipperDatas;
                gridAction.arrGroupFieldName = 'shippercode'
                dataSource.dataSet = []
                 openData(disType.value)
                break;
        }
    }
)
watch(
    ()=>isShowFinsh.value,
    (n,o)=>{
        openData(disType.value)
    }
)
</script>

<style lang="scss" scoped>
@media print {
    .win-body{
        display:block !important;
       
    } 
     .lkx-table-body-row{
         height: 18px;
    }
}
.win{
   position: absolute;
    top: 0;
    left: 0;
    right:0;
    bottom: 0;
}
.win-hearder{
    height: 40px;
    border-bottom: 1px solid red ;
    display: flex;
    align-items: center;
    .Input-DeliveryAt{
        margin-left: 10px ;
        outline-color: blue;
        width: 300px;
    }
    .shipper-input{
        width: 300px;
    }
    button{
        margin-left: 10px ;
        width: 100px;
    }
}
.label{
    display: inline-flex;
    align-items: center;
    padding: 3px;
    margin-right: 10px;
}
.radio{
    height: 30px;
    width: 30px;
    padding: 0;
    margin: 0;
    outline: 0;
    margin-right: 5px;
}
.win-body{
    position: absolute;
    top: 40px;
    left: 0;
    right:0;
    bottom: 0;
    overflow: hidden;
    padding-left: 20px ;
    padding-top: 5px ;
    display: flex;
    flex-direction: row;
    .win-body-left{
        flex: 1;
        display: flex;
        flex-direction: column;
        overflow: auto;
        .grid-body{
            display: flex;
            flex-direction: column;
            .groupInfo{
                background: blueviolet;
                padding: 5px;
                color: white;
                font-size: 22px;
            }
            .item-body{
                padding: 5px;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                .productGrid{
                    margin: 5px;
                }
            }
        }
        .empty{
            text-align: center;
            margin-top: 50px;
            font-size: 20px;
            color: #999;
        }
    }
    .win-body-right{
        width: 200px;
        border-left: 1px solid #ccc;
        .all-button{
            padding: 10px;
            button{
                width: 100%;
                height: 30px;
            }
        }
        .item-body{
            overflow: auto;
            height: 100%;
            .item{
                padding: 10px;
                cursor: pointer;
                border-bottom: 1px solid #eee;
                &:hover{
                    background: #f5f5f5;
                }
                &.active{
                    background: #e6f7ff;
                    color: #1890ff;
                }
            }
        }
    }
    .Cate-item-body{
    position: absolute;
    display: flex;
    flex-direction: column;
    border: 1px solid #bbb;
    background-color: rgba(255, 255, 255,1);
    overflow: auto;
    height: 80%;
    width: 700px;
    left: 15%;
    top: 10px;
    padding: 5px;
    .productList{
        flex: 1;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        gap: 10px;//上下左右间距
        align-content: flex-start; 
        .productGrid{
            height: 100px;
            width: 340px;
        }
    }
    .action{
        height: 40px;
        background: blue;
        display: flex;
        align-items: center;
        margin-bottom: 3px;
        label{
            flex: 1;
            color: white;
            padding-left: 10px;
        }
        button{
            width: 120px;
            height: 36px;
            float: right;
            background: blue;
            color: white;
            cursor: pointer;
            border-color: red;
            border-radius: 5px;
            margin-right: 5px;
        }
    }
}
}
.applay-button{
    background: #1890ff;
    color: white;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    height: 30px;
}
.search-input{
    margin-left: 10px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}
</style>
