import $Utils from '@v4x/utils/lkxUtil'
import {TFinanceListGridAction,TFinanceDetailGridAction,TFinanceDetailListGridAction} from "../FinanceAction"
import { DataSourceType, TableRowDataType, TableColumnsType, TableMethodsType, ModalResultEnum } from '@v4x/ui';
import type { ReceivableInstanceRefs } from './types'
import { WinMoneyPayRes } from '@/components/WinMoneyPayRes';
import useAppStore from '@/stores';

export class TListGridAction extends TFinanceListGridAction<ReceivableInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<ReceivableInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',
            fieldName: 'idcode',
            width: 80,
            title: '编码',
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            fieldName: 'customername',
            width: 200,
            title: '名称',
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'SettlementType',
            width: 80,
            title: '结算方式',
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: this.commonDatas.SettlementTypeDatas
            },
        },{
            dataType: 'number',
            fieldName: 'AccountDay',
            width: 50,
            title: '账期',
            sort:false,
        },{
            dataType: 'text',
            fieldName: 'addr',
            width: 150,
            title: '地址',
        },{
            dataType: 'text',
            fieldName: 'person',
            width: 100,
            title: '联系人',
        },{
            dataType: 'text',
            fieldName: 'tel',
            width: 150,
            title: '电话',
        },{
            dataType: 'number',
            fieldName: 'owemoney',
            width: 150,
            title: '欠款',
            format: '0.00',
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'
            }
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'financeViews-receivableList',sep: true,expand: false,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "name",caption: "名称",filterType: "fsLike"},
                {fieldName: "tel",caption: "电话",filterType: "fsLike"},
                {fieldName: "addr",caption: "地址",filterType: "fsLike"},
                {fieldName: "person",caption: "联系人",filterType: "fsLike"},
                {fieldName: "settlementtype",caption: "结算方式",filterType: "fsIn",inList:this.commonDatas.SettlementTypeDatas},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })  
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                MoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).owemoney
                },
            },
        });
        this.Events =  $Utils.deepObjectMerge(this.Events,{
            gridKeyDown:(e: KeyboardEvent)=>{
                if (e.key=='Escape'){
                    this.thisInstance.Win.closeWin()
                }
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                this.instanceRefs.detailVisabled!.value = true

                console.log(this.instanceRefs.gridDetailAction)
                this.instanceRefs.headerData!.value = rowdata
                this.instanceRefs.detailDataSource.close()
                this.instanceRefs.detailMonthDataSource.close()
                this.instanceRefs.gridDetailAction.Columns = this.instanceRefs.gridDetailAction.ListColumns
                this.instanceRefs.gridDetailAction.dataSource = this.instanceRefs.detailDataSource;
                this.instanceRefs.gridDetailAction.dataSource.getParams.condition = '';
                this.instanceRefs.gridDetailAction.dataSource.getParams.mustCondition = `customerCode=${rowdata.idcode}`;
                this.instanceRefs.gridDetailAction.open() 
                this.instanceRefs.detailMonthDataSource.getParams.condition = '';
                this.instanceRefs.detailMonthDataSource.getParams.mustCondition = `customerCode=${rowdata.idcode}`;
                this.instanceRefs.detailMonthDataSource.open({curPage:1,pageSize:0}) 
            }
        })
    }
}

export class TDetailGridAction extends TFinanceDetailGridAction<ReceivableInstanceRefs>{
    public ListColumns = [
        {
            dataType: 'text',
            fieldName: 'billnumber',
            width: 160,
            title: '单号',
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',
            fieldName: 'orderbillnumber',
            width: 150,
            title: '订单号',
            readonly: true,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        },{
            dataType: 'datetime',
            fieldName: 'DeliveryAt',
            width: 120,
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '日期',
            readonly: false,
            
        },{
            dataType: 'number',
            fieldName: 'subjectCode',
            width: 100,
            title: '业务类型',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: this.commonDatas.SubjectInDatas
            },
        },{
            dataType: 'number',
            fieldName: 'saleMoney',
            width: 120,
            title: '销售金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SaleMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'alreadyMoney',
            width: 120,
            title: '已付金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'AlreadyMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'oweMoney',
            width: 120,
            title: '应付金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'OweMoneyCalc'
            }
        },{
            fieldName: 'note',
            width: 165,
            title: '备注',
        }
    ] as TableColumnsType[]
    public MontColumns = [
        {
            dataType: 'text',
            fieldName: 'monthText',
            width: 150,
            title: '年月',
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'number',
            fieldName: 'saleMoney',
            width: 120,
            title: '销售金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SaleMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'alreadyMoney',
            width: 120,
            title: '已付金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'AlreadyMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'oweMoney',
            width: 120,
            title: '应付金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'OweMoneyCalc'
            }
        }
    ] as TableColumnsType[];
    constructor(dataSource: DataSourceType, instanceRefs: Partial<ReceivableInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = this.ListColumns;
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'financeViews-receivableDetail',sep: true,expand: true,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "ordeerbillnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "deliveryat",caption: "送货日期",filterType: "fsDate"}                  
            ],
            handleClose: (filterData: any)=>{
                this.closeSearchWin();
                if (filterData.type=='mrOk'){
                    this.PagerConfig.curPage = 1;
                    this.dataSource.getParams.defaultCondition = ''
                    this.dataSource.getParams = Object.assign(this.dataSource.getParams,{condition:filterData.filter})
                    this.thisInstance.Win.ActiveGridAction.open()
                }
            }
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                AlreadyMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).alreadymoney
                },
                SaleMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).salemoney
                },
                OweMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).owemoney
                },
                
            },
            customColor:(rowItem: TableRowDataType,cellItem: Object)=>{
                if (rowItem.owemoney<0) return 'red'; else return '';
            }
        })
        this.Events = $Utils.deepObjectMerge(this.Events,{
            expand:(data: any)=>{
                if (data.expanded){
                    this.thisInstance.Action = this.thisInstance.gridDetailListAction;
                    this.thisInstance.detailListDataSource.dataSet = data.rowData.detail
                } else {
                    this.thisInstance.detailListDataSource.dataSet = []
                    this.thisInstance.Action = this;
                }
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                const res = await WinMoneyPayRes.show({
                    title:'收款',
                    type:'res',
                    look: false,
                    commonDatas:this.commonDatas, 
                    companyCode:this.instanceRefs.headerData?.value?.customercode || 0,
                    curBillNumber: rowdata.billnumber,
                    condition:this.instanceRefs.detailDataSource.getParams.condition
                })
                if (res.action === ModalResultEnum.mrConfirm) {

                    this.open()
                }
            }
        })
    }
}
export class TDetailListGridAction extends TFinanceDetailListGridAction<ReceivableInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<ReceivableInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',
            fieldName: 'productcode',
            width: 80,
            title: '货号',
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
                calculationer: 'countCalc'
            }
        },{
            fieldName: 'spec',
            width: 100,
            title: '规格',
            readonly: true,
        },{
            dataType:'number',
            fieldName: 'downwg',
            width: 60,
            title: '个重',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: false
        },{
            fieldName: 'unit',
            width: 60,
            title: '单位',
            readonly: true,
            sort: false,
            align:'center',
            customFormater:'unitFormat'
        },{
            dataType: 'number',
            fieldName: 'num',
            width: 80,
            title: '下单量',
            format:'0.00',
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'numex',
            width: 80,
            title: '结算量',
            align: 'right',
            format:'0.00',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numExCalc'
            }
        },{
            fieldName: 'costprice',
            dataType: 'number',
            width: 80,
            title: '单价',
            format:'0.0000',
            align:'right',
            sort: false
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
            calculationer:'calculaMoney',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'moneyCalc'
            }
        },{
            fieldName: 'note',
            width: 100,
            title: '备注/做法',
            sort: false,
            indicatorButtons:[{iconType:'more'}],
            indicatorButtonEventName:'indicatorDoMethodButtonEvent'
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'PurchaseViews-receivableDetailEx',sep: true,expand: false,opt:false,parger:false,readOnly: true,
            allowedOperations:{alopSearch: false}
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            rowCalculated:{
                calculaMoney:(rowItem: any): number=>{
                    return $Utils.toFixedFun(rowItem.numex * rowItem.costprice,2)
                },
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return  this.dataSource.dataSetRowCount
                },
                numCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'num')
                },
                numExCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'numex')
                },
                moneyCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'money')
                },
            },
            customFormater:{
                unitFormat:(value: string,rowItem: TableRowDataType)=>{
                    return rowItem.unit||''
                }
            }
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            gridKeyDown:(e: KeyboardEvent)=>{
                if (e.key=='Escape'){
                    this.thisInstance.Win.closeWin()
                }
            }
        })
    }
}
