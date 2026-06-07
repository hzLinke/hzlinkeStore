import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { TableColumnsType, DataSourceType, CommondDatasParamType, MessageBox, ModalResultEnum } from '@v4x/ui';
import { PurchaseOrderGroupInstanceRefs } from '../purchaseOrderGroup/types';
import commonParam from '@/config';
import useAppStore from '@/stores';
import { WinOrderQrCode } from '@/components';
export class TListGridAction extends TGridAction<PurchaseOrderGroupInstanceRefs>{
    public getParams: object = {};
    public PrintColumns = 2;
    public PrintFontSize = 14;
    public AllDatas = [];
    private multilineout = false;//是否多行显示
    public TowColumns: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep1',//字段名
        width: 40,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
       // tooltip: '双击换货商'
    },{
        fieldName: 'name1',//字段名
        width:140,//宽度
        title: '品名',//标题
       // tooltip: '双击换货商'
    },{
        dataType: 'number',//数据类型
        fieldName: 'totalNum1',//字段名
        width: 60,//宽度
        align: 'right',
        title: '总数',//标题
       // tooltip: '双击换货商'
    },{
        dataType: 'number',//数据类型
        fieldName: 'TempStock1',//字段名
        width: 60,//宽度
        align: 'right',
        title: '存货',//标题
       // tooltip: '双击换货商'
    },{
        fieldName: 'packList1',//字段名
        width: 240,//宽度
        title: '明细',//标题
       // tooltip: '双击打包明细'
    },{
        fieldName: 'costprice1',//字段名
        width: 60,//宽度
        title: '单价',//标题
        align: 'right',
       // tooltip: '双击换货商'
    },{
        dataType: 'text',//数据类型
        fieldName: 'sep2',//字段名
        width: 40,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'name2',//字段名
        width: 140,//宽度
        title: '品名',//标题
       // tooltip: '双击换货商'
    },{
        dataType: 'number',//数据类型
        fieldName: 'totalNum2',//字段名
        width: 60,//宽度
        align: 'right',
        title: '总数',//标题
       // tooltip: '双击换货商'
    },{
        dataType: 'number',//数据类型
        fieldName: 'TempStock2',//字段名
        width: 60,//宽度
        align: 'right',
        title: '存货',//标题
       // tooltip: '双击换货商'
    },{
        fieldName: 'packList2',//字段名
        width: 260,//宽度
        title: '明细',//标题
       // tooltip: '双击打包明细'
    },{
        fieldName: 'costPrice2',//字段名
        width: 60,//宽度
        align: 'right',
        title: '单价',//标题
    }]
    public OneColumns: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep1',//字段名
        width: 50,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
       // tooltip: '双击换货商'
    },{
        fieldName: 'name1',//字段名
        width: 150,//宽度
        title: '品名',//标题
       // tooltip: '双击换货商'
    },{
        fieldName: 'packList1',//字段名
        width: 650,//宽度
        title: '明细',//标题
       // tooltip: '双击打包明细'
    },{
        dataType: 'number',//数据类型
        fieldName: 'totalNum1',//字段名
        width: 120,//宽度
        align: 'right',
        title: '总数',//标题
       // tooltip: '双击换货商'
    },{
        dataType: 'number',//数据类型
        fieldName: 'TempStock1',//字段名
        width: 120,//宽度
        align: 'right',
        title: '存货',//标题
       // tooltip: '双击换货商'
    },{
        fieldName: 'costPrice1',//字段名
        width: 100,//宽度
        title: '单价',//标题
        align: 'right',
       // tooltip: '双击换货商'
    }]
    public ChildrenColumns: TableColumnsType[] =[];
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseOrderGroupInstanceRefs>){ 
        super(dataSource,instanceRefs)
        this.multilineout = +this.commonDatas.SysParamDatas[0].multilineout===1
        this.dataSource.getParams.defaultCondition = '';

        this.PrintColumns = this.commonDatas.SysParamDatas[0].downgroupprintcolumns; 
        this.PrintFontSize = this.commonDatas.SysParamDatas[0].downgroupprintfontsize;
        this.Columns = this.PrintColumns==1?this.OneColumns:this.TowColumns;
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'downOrderGroup',sep: true,expand: false,opt:false,parger:true,readOnly: false
        });  
    }
    private buildData=(data: any)=>{
        const _data = data
        let _LineObj = {} as any;
        let _LineArr = [] as any;
        //纵向序号，
        _data.map((item: any)=>{ 
            item.children = $Utils.datasRowToColumns(item.children,this.PrintColumns,'sep')
        })
        const _TempArr = _data;
        let _TempDatas = []
        for (let i=0;i<_TempArr.length;i++){
            _TempDatas.push(_TempArr[i])
            _TempDatas = _TempDatas.concat(_TempArr[i].children)
        }
        return _TempDatas;
    }
    /**获取当日要配货的客户，货商，分类 */
    public getRigthDatas = (Datas: any[],showIsPublish: boolean)=>{
        const _Arr = []
        for (let i=0;i<Datas.length;i++){
            const _Name = Datas[i].shippercode==0?'存货':$Utils.getValueFromArray(this.commonDatas.ShipperDatas,'idcode','name',Datas[i].shippercode)
            const _a = showIsPublish
                ?_Arr.filter(item=>item.idcode ==  Datas[i].shippercode && Datas[i].examineusercode!=1)
                :_Arr.filter(item=>item.idcode ==  Datas[i].shippercode)

            if (_a.length==0)
             _Arr.push({idcode: Datas[i].shippercode,name:_Name})
        }
        return _Arr;
    }
    public async open(){
        try{
            MessageBox.loading({
                moreText: '正在加载数据...',
                mask: true
            })
            
            const res = await $api.comonRequest('/masterApi/disApi/purchase/downOrderGroup/','getFromProc',this.getParams)
            if (res){
                if (this.multilineout){//明细多行输出
                    res.datas.map((item: any)=>{
                        if (item.packlist){
                            item.packlist = item.packlist.replace(/；/g,'\n')
                        }
                    })
                }
                
                this.AllDatas = res.datas;
                this.dataSource.dataSet = $Utils.arrGroupByFields(res.datas,['shippername','billnumberlist'])
                this.dataSource.activeRowIndex = 0;
                this.PagerConfig.total = this.dataSource.dataSetRowCount
                this.dataSource.dataSet = this.buildData(this.dataSource.dataSet)
            }
        }finally{
            setTimeout(()=>{MessageBox.closeAllLoading();},300);
        }
    }

    /**商品转供应商
     * @parmar sourceShipperCode 源数据
     * @parmar targetShipperCode 目标货商编码
     * @parmar targetCostPrice 单价
     */
    public transferShipper = async (BillNumberList: string,ProductCode: string,sourceShipperCode: number,targetShipperCode: number,targetCostPrice: number)=>{
        if (sourceShipperCode == targetShipperCode){
            MessageBox.error({
                title: '出错',
                content:'目标供货商与源供货商不能相同！',
                showCancel: false
            })
            return;
        }
        MessageBox.loading({
            moreText: '正在转移供货商...',
            mask: true
        })
       // const thisRowData = this.dataSource.dataSet[this.thisRowIndex];
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'transferShipper',{
            BillNumberList      :   BillNumberList,
            ProductCode         :   ProductCode,
            TargetShipperCode   :   targetShipperCode,
            InPrice             :   targetCostPrice,
            UserCode            :   this.instanceRefs.userCode,
        })   
        if (submitRes.errCode==0){
            this.open()
           // this.dataSource.dataSet.splice(this.thisRowIndex,1)  
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
    /**
     * 送单 审核对应的采购下单
     * @parmar {number} shipperCode 供货商编码
     * @parmar {date} deliveryAt 送货日期 
     * @returns 
     */
    public sendOrder = async (shipperCode: number,deliveryAt: string,Item: any)=>{

        const r = await MessageBox.question({
            title: '确认',
            content: '确认要送单?\n确定后将审核对应的采购下货单并生成采购收货单',
            showCancel: true
        })
        if (r.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在发布订单...',
            mask: true
        })
       // const thisRowData = this.dataSource.dataSet[this.thisRowIndex];
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'sendOrder',{
            shipperCode      :   shipperCode,
            deliveryAt       :   deliveryAt,
            updateUserCode   :   this.instanceRefs.userCode,
            updateStyle      :   1
        })   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        if (submitRes.errCode==0){
            WinOrderQrCode.show({
                shipperName: $Utils.getValueFromArray(this.commonDatas.ShipperDatas,'idcode','name',shipperCode).toString(),
                deliveryAt: deliveryAt,
                qrCodeData: `https://www.hzlinke.com.cn/orderlist?billNumber=${Item.children[0].billnumberlist1}&linkname=${commonParam.$linkname}`,
            })
            return true
        }   
        return submitRes;
    }
    /**
     * 取消发布 反签对应的采购下单
     * @parmar {number} shipperCode 供货商编码
     * @parmar {date} deliveryAt 送货日期 
     * @returns 
     */
    public unSendOrder = async (shipperCode: number,deliveryAt: string)=>{
        const r = await MessageBox.question({
            title: '确认',
            content: '确认要取消订单?\n确定后将取消对应的采购订单',
            showCancel: true
        })
        if (r.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在取消订单...',
            mask: true
        })
       // const thisRowData = this.dataSource.dataSet[this.thisRowIndex];
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'sendOrder',{
            shipperCode      :   shipperCode,
            deliveryAt       :   deliveryAt,
            updateUserCode   :   this.instanceRefs.userCode,
            updateStyle      :   -1
        })   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        if (submitRes.errCode==0){
            return true
        }   
        return submitRes;
    }
}
