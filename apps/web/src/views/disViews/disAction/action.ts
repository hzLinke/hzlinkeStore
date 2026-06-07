
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { TableColumnsType, DataSourceType, CommondDatasParamType, MessageBox } from '@v4x/ui';
export class TCustomerGridAction extends TGridAction{
    public getParams: object = {
        procName:'',
        procParmars:{
            DeliveryAt: '',
            Condition: ''
        }
    };
    public arrGroupFieldName: string = 'customercode';
    public ChildrenColumns: TableColumnsType[] =[];
    public BakDataSet = [] as any;
    public AllDataSet = [] as any;
    public CateColumns = [{
            dataType: 'text',//数据类型
            fieldName: 'sep',//字段名
            width: 50,//宽度
            title: '序号',//标题
            align:'center',
            readonly: true,
        },{
            fieldName: 'name',//字段名
            width: 100,//宽度
            title: '品名',//标题
        },{
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'num',//字段名
            width: 150,//宽度
            align: 'right',
            title: '应配数量',//标题
            customFormater:(fieldVal: any,rowItem: any)=>{
                if (rowItem.saletype==2)
                    return $Utils.clearDecimal(rowItem.num)+rowItem.downunit+'/'+ $Utils.clearDecimal(rowItem.numex)+rowItem.unit+ (rowItem.note? '【'+rowItem.note+'】':'')
                else 
                return $Utils.clearDecimal(rowItem.numex)+rowItem.unit+ (rowItem.note? '【'+rowItem.note+'】':'')
            }  
        },{
            fieldName: 'customerselfcode',//字段名
            width: 75,//宽度
            title: '客户编码',//标题
        },{
            fieldName: 'customername',//字段名
            width: 180,//宽度
            title: '客户',//标题
        },{
            fieldName: 'disat',//字段名
            width: 75,//宽度
            title: '送货时间',//标题
        },{
            fieldName: '',//字段名
            width: 120,//宽度
            title: '实配数量',//标题
        },{
            fieldName: '',//字段名
            width: 100,//宽度
            title: '备注',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'opt',//字段名
            width: 100,//宽度
            title: '操作',//标题
            align:'center',
            readonly: true,
        }] as TableColumnsType[]
    public CustomerColumns = [{
            dataType: 'text',//数据类型
            fieldName: 'sep',//字段名
            width: 50,//宽度
            title: '序号',//标题
            align:'center',
            readonly: true,
        },{
            fieldName: 'name',//字段名
            width: 130,//宽度
            title: '品名',//标题
        },{
            fieldName: 'spec',//字段名
            width: 130,//宽度
            title: '规格',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'num',//字段名
            width: 150,//宽度
            align: 'right',
            title: '应配数量',//标题
            customFormater:(fieldVal: any,rowItem: any)=>{
                if (rowItem.saletype==2)
                    return $Utils.clearDecimal(rowItem.num)+rowItem.downunit+'/'+ $Utils.clearDecimal(rowItem.numex)+rowItem.unit+ (rowItem.note? '【'+rowItem.note+'】':'')
                else 
                return $Utils.clearDecimal(rowItem.numex)+rowItem.unit+ (rowItem.note? '【'+rowItem.note+'】':'')
            }  
        },{
            fieldName: '',//字段名
            width: 120,//宽度
            title: '实配数量',//标题
        },{
            fieldName: '',//字段名
            width: 100,//宽度
            title: '备注',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'opt',//字段名
            width: 100,//宽度
            title: '操作',//标题
            align:'center',
            readonly: true,
        }] as TableColumnsType[]
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs)
        this.dataSource.getParams.defaultCondition = ''
        this.Columns = this.CustomerColumns;
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'DisViews-disPrint',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
    }

   /* public async open(){
        MessageBox.loading({
            moreText: '正在加载数据...',
            mask: true
        })
        const res = await this.dataSource.open(
            this.PagerConfig,
            ()=>{return this.beforeOpen()},
            (deataSet)=>{this.afterOpen(deataSet)}
        )
        if (res){
            this.BakDataSet = this.dataSource.dataSet
            this.dataSource.dataSet = $Utils.arrGroup(this.BakDataSet,this.thisInstance.disType==0? 'customercode':'catecode')
            console.log(this.dataSource.dataSet)
            this.dataSource.activeRowIndex = 0;
            this.PagerConfig.total = this.dataSource.dataSetRowCount
        }
        setTimeout(()=>{MessageBox.closeLoading();},300);
    }*/
    public async open(isShowFinsh: boolean = false){
        MessageBox.loading({
            moreText: '正在加载数据...',
            mask: true
        })
        const res = await $api.comonRequest('/masterApi/disApi/dis/disDisTribution/','getFromProc',this.getParams)
        if (res.errCode==0){
            this.AllDataSet = res.datas;
            this.dataSource.dataSet = $Utils.arrGroup(this.buildData(isShowFinsh),this.arrGroupFieldName)
            this.dataSource.activeRowIndex = 0;
            this.PagerConfig.total = this.dataSource.dataSetRowCount
            //console.log(this.dataSource.dataSet)
        }
        setTimeout(()=>{MessageBox.closeAllLoading();},300);
    }
    public buildData = (isShowFinsh: boolean = false)=>{
        if (isShowFinsh) return this.AllDataSet;
        const _Data = this.AllDataSet.filter((item: any)=>{
            return item.distributionstatus!=2
        })
        return _Data;
    }
    public async setFrom(data: any){
        let _From = [] as any;
        let _Stock = 0;
        let _getParams = {
            pageSize: 0,
            condition: `DeliveryAt='${data.deliveryat}' and saleorderidkey = '${data.orderidkey||data.saleorderidkey}'`
        }  
       
        const FromRes = await $api.comonRequest('/masterApi/disApi/dis/disDisTribution/','getFrom',_getParams)
        if (FromRes.errCode==0){
            _From = FromRes.datas;
        }
        _getParams = {
            pageSize: 0,
            condition: `productCode=${data.productcode}`
        }
        const StockRes = await $api.comonRequest('/masterApi/disApi/dis/disDisTribution/','getStock',_getParams)
        if (StockRes.errCode == 0){
            _Stock = StockRes.datas.length>0? StockRes.datas[0].stock : 0
        }
        return {From: _From,Stock:_Stock};
    }
    public async restOpen(DisType: number,Params: any){
        let _resArr = []
        if (DisType != 3){
            const res = await $api.comonRequest('/masterApi/disApi/dis/disDisTribution/','getFromProc',Params)
            if (res.errCode==0){
                _resArr = res.datas;
            }
        } else {
            const res = await $api.comonRequest('/masterApi/disApi/dis/disDisTribution/','get',Params)
            if (res.errCode==0){
                _resArr = res.datas;
            }
        }
        return _resArr;
    }
    
}
