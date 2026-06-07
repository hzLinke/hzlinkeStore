import $Utils from '@v4x/utils/lkxUtil'
import {TStockListGridAction,TStockDetailGridAction} from "../StockAction"
import { DataSourceType, TableRowDataType, SetFieldValueType } from '@v4x/ui';
import type { StockViewsInstanceRefs } from '../types'
import useAppStore from '@/stores';

export class TListGridAction extends TStockListGridAction<StockViewsInstanceRefs>{
    public billType = 7;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<StockViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.dataSource.getParams.defaultCondition = 'ExamineUserCode=0'
        this.dataSource.getParams.mustCondition = `accountBookCode=${accountBookCode}`
        this.Columns = [{
            dataType: 'text',
            fieldName: 'billnumber',
            width: 150,
            title: '单号',
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            fieldName: 'outareacode',
            width: 200,
            title: '调出仓库',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'AreaDatas',
            },
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        },{
            fieldName: 'inareacode',
            width: 200,
            title: '调入仓库',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'AreaDatas',
            },
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        },{
            dataType: 'datetime',
            fieldName: 'ExamineAt',
            width: 120,
            inputType: 'datetime',
            format:'yyyy-MM-dd HH:mm:ss',
            title: '日期',
            readonly: false,
        },{
            fieldName: 'ExamineUserCode',
            width: 80,
            title: '审核',
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
            }
        },{
            dataType: 'number',
            fieldName: 'costMoney',
            width: 120,
            title: '金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'saleMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'status',
            width: 80,
            title: '状态',
            customFormater:'statusFormat',
            inputType: 'drop',
            readonly: true,
            dropListConfig:{
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'未生效'},{idcode:1,name:'生效'}]
            },
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'StockViews-StockAreaSwap',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "outareacode",caption: "调出仓",filterType: "fsIn",inList:this.commonDatas.AreaDatas},
                {fieldName: "inareacode",caption: "调入仓",filterType: "fsIn",inList:this.commonDatas.AreaDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        }) ;
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            allowEdit:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            },
            allowDel:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            }
        });
    }
}

export class TDetailGridAction extends TStockDetailGridAction<StockViewsInstanceRefs>{
    public billType = 7;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<StockViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',
            fieldName: 'productcode',
            width: 80,
            title: '货号',
            allowInputString: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
            indicatorButtons:[{iconType:'more'}],
            indicatorButtonEventName:'indicatorButtonEvent'
        },{
            fieldName: 'barcode',
            width: 100,
            title: '条码',
            readonly: true,
        },{
            fieldName: 'name',
            width: 200,
            title: '品名',
            readonly: true,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'CountCalc'
            }
        },{
            fieldName: 'spec',
            width: 100,
            title: '规格',
            readonly: true,
        },{
            fieldName: 'unit',
            width: 60,
            title: '单位',
            readonly: true,
            sort: false,
            align:'center'
        },{
            dataType: 'number',
            fieldName: 'stocknum',
            width: 80,
            title: '可用存量',
            format:'0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'num',
            width: 80,
            title: '数量',
            format:'0.00',
            numberFlg:'+',
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'
            }
        },{
            fieldName: 'costprice',
            dataType: 'number',
            width: 80,
            title: '单价',
            format:'0.0000',
            numberFlg:'+',
            align:'right',
            sort: false,
            readonly: true
        },{
            fieldName: 'money',
            fieldKind: 'fkCalculated',
            dataType: 'number',
            width: 100,
            title: '金额',
            format:'0.00',
            align:'right',
            readonly: true,
            sort: false,
            calculationer:'CalculaMoney',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'
            }
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
            sort: false,
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'StockViews-StockAreaSwapDetail',sep: true,expand: false,opt:false,parger:false,readOnly: false,
            allowedOperations: {
                alopSubmit: true
            }
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        }) ;
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            rowCalculated:{
                CalculaMoney:(rowItem: any): number=>{
                    return rowItem.num * rowItem.costprice
                }
            },
            sumCalculated:{
                CountCalc:(datas: any): number=> {
                    return  datas.length
                },
                StockCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'stocknum')
                },
                NumCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'num')
                },
                MoneyCalc:(datas: any): number=> {
                    const _Money = $Utils.sumArray(datas,'money')
                    this.instanceRefs.headerData!.value.salemoney = _Money
                    return  _Money
                },
            },
            customFormater:{
    
            }
        }) 
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        if (data.fieldName == 'num'){
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = data.fieldValue as number - rowItem.stocknum;
            this.dataSource.setFieldValue('changenum',_NumEx);
            return true
        } else {
            return super.onSetFieldValue(data,rowItem)
        }
    }
}
