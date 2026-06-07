import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { TableColumnsType, DataSourceType, CommondDatasParamType, MessageBox } from '@v4x/ui';
import useAppStore from '@/stores';

export class TListGridAction extends TGridAction{
    public isDetail = false;
    public OrderColumns = [{
        dataType: 'number',//数据类型
        fieldName: 'sep',//字段名
        width: 50,//宽度
        title: '序号',//标题
        align:'center'
    },{
        dataType: 'number',//数据类型
        fieldName: 'productcode',//字段名
        width: 80,//宽度
        title: '编码',//标题
    },{
        fieldName: 'name',//字段名
        width: 250,//宽度
        title: '品名',//标题
        readonly: true,
    },{
        fieldName: 'spec',//字段名
        width: 100,//宽度
        title: '规格',//标题
        readonly: true,
    },{
        fieldName: 'unit',//字段名
        width: 60,//宽度
        title: '单位',//标题
        readonly: true,
        sort: false,
        align:'center',
    },{
        dataType: 'number',
        fieldName: 'SettlementNumEx',//字段名
        width: 80,//宽度
        title: '数量',//标题
        align: 'right',
        format:'0.00',
    },{
        fieldName: 'saleprice',//字段名
        dataType: 'number',//数据类型
        width: 80,//宽度
        title: '单价',//标题
        format:'0.00',
        align:'right',
        customFormater:(val: any,rowItem: any)=>{
            return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
        }
    },{
        fieldName: 'SettlementMoney',//字段名
        fieldKind: 'fkCalculated',
        dataType: 'number',//数据类型
        width: 100,//宽度
        title: '金额',//标题
        format:'0.00',
        align:'right',
        excelFormula:'=round(g{n}*h{n},2)',
        customFormater:(val: any,rowItem: any)=>{
            return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
        }
    },{
        fieldName: 'note',//字段名
        width: 100,//宽度
        title: '备注',//标题
        sort: false,
        
    }] as TableColumnsType[];
    public ListColumns = [{
        dataType: 'number',//数据类型
        fieldName: 'sep',//字段名
        width: 50,//宽度
        title: '序号',//标题
        align:'center'
    },{
        dataType: 'string',//数据类型
        fieldName: 'billnumber',//字段名
        width: 120,//宽度
        title: '单号',//标题
    },{
        dataType: 'string',//数据类型
        fieldName: 'DeliveryAt',//字段名
        width: 100,//宽度
        title: '送货日期',//标题
    },{
        fieldName: 'name',//字段名
        width: 180,//宽度
        title: '品名',//标题
        readonly: true,
    },{
        fieldName: 'spec',//字段名
        width: 80,//宽度
        title: '规格',//标题
        readonly: true,
    },{
        fieldName: 'unit',//字段名
        width: 60,//宽度
        title: '单位',//标题
        readonly: true,
        sort: false,
        align:'center',
    },{
        dataType: 'number',
        fieldName: 'SettlementNumEx',//字段名
        width: 80,//宽度
        title: '数量',//标题
        align: 'right',
        format:'0.00',
    },{
        fieldName: 'saleprice',//字段名
        dataType: 'number',//数据类型
        width: 80,//宽度
        title: '单价',//标题
        format:'0.00',
        align:'right',
        customFormater:(val: any,rowItem: any)=>{
            return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
        }
    },{
        fieldName: 'SettlementMoney',//字段名
        fieldKind: 'fkCalculated',
        dataType: 'number',//数据类型
        width: 100,//宽度
        title: '金额',//标题
        format:'0.00',
        align:'right',
        excelFormula:'=round(g{n}*h{n},2)',
        customFormater:(val: any,rowItem: any)=>{
            return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
        }
    },{
        fieldName: 'note',//字段名
        width: 100,//宽度
        title: '备注',//标题
        sort: false,
        
    }] as TableColumnsType[];
    public ChildrenColumns: TableColumnsType[] =[];
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs)
        const { accountBookCode } = useAppStore();
        this.dataSource.getParams.defaultCondition = ''
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'sep',//字段名
            width: 50,//宽度
            title: '序号',//标题
            align:'center'
        },{
            dataType: 'string',//数据类型
            fieldName: 'billnumber',//字段名
            width: 120,//宽度
            title: '单号',//标题
        },{
            dataType: 'string',//数据类型
            fieldName: 'DeliveryAt',//字段名
            width: 100,//宽度
            title: '送货日期',//标题
        },{
            fieldName: 'name',//字段名
            width: 180,//宽度
            title: '品名',//标题
            readonly: true,
        },{
            fieldName: 'spec',//字段名
            width: 80,//宽度
            title: '规格',//标题
            readonly: true,
        },{
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            readonly: true,
            sort: false,
            align:'center',
        },{
            dataType: 'SettlementNumEx',
            fieldName: 'numex',//字段名
            width: 80,//宽度
            title: '数量',//标题
            align: 'right',
            format:'0.00',
        },{
            fieldName: 'saleprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '单价',//标题
            format:'0.00',
            align:'right',
            customFormater:(val,rowItem)=>{
                return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
            }
        },{
            fieldName: 'SettlementMoney',//字段名
            fieldKind: 'fkCalculated',
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '金额',//标题
            format:'0.00',
            align:'right',
            excelFormula:'=round(g{n}*h{n},2)',
            customFormater:(val,rowItem)=>{
                return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
            }
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
            sort: false,
            
        }];
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'SaleViews-Reports-SaleCheck',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
    }
    /*
    public Events: LkxTableEventsType = $Utils.deepObjectMerge(this.Events,{
        gridKeyDown:(e: KeyboardEvent)=>{
            if (e.key=='Escape'){
                this.thisInstance.Win.closeWin()
            }
        }
    })*/
    public async open(){
        if (!this.isDetail){//非明细
            super.open()
            return;
        }
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
            this.dataSource.dataSet = $Utils.arrGroup(this.dataSource.dataSet,'billnumber')
            this.dataSource.activeRowIndex = 0;
            this.PagerConfig.total = this.dataSource.dataSetRowCount
        }
        setTimeout(()=>{MessageBox.closeAllLoading();},300);
    }
}
