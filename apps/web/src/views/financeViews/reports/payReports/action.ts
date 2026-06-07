import $Utils from '@v4x/utils/lkxUtil'
import {TFinanceListGridAction,TFinanceDetailGridAction} from "../../FinanceAction"
import { DataSourceType, TableMethodsType } from '@v4x/ui';
import type { PayReportsInstanceRefs } from './types'
import useAppStore from '@/stores';

export class TListGridAction extends TFinanceListGridAction<PayReportsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PayReportsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.dataSource.getParams.defaultCondition = "datediff(day,examineAt,getDate())=0"
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
            fieldName: 'shippercode',
            width: 200,
            title: '供货商',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: this.commonDatas.ShipperDatas
            },           
        },{
            dataType: 'datetime',
            fieldName: 'examineat',
            width: 120,
            inputType: 'datetime',
            title: '日期',
            readonly: false,
            format:'yyyy-MM-dd hh:mm:ss'
        },{
            fieldName: 'ExamineUserCode',
            width: 80,
            title: '操作员',
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: this.commonDatas.UserDatas
            }
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
                dropListDatas: this.commonDatas.SubjectOutDatas
            },
        },{
            dataType: 'number',
            fieldName: 'payTypeCode',
            width: 100,
            title: '支付方式',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: this.commonDatas.PayTypeDatas
            },
        },{
            dataType: 'number',
            fieldName: 'accountsCode',
            width: 100,
            title: '账号',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: this.commonDatas.AccountsDatas
            },
        },{
            dataType: 'number',
            fieldName: 'Money',
            width: 120,
            title: '金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'
            }
        },{
            fieldName: 'note',
            width: 100,
            inputType: 'datetime',
            title: '备注',
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'FinanceViews-Reports-PayReports',sep: true,expand: true,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "查糊单号",filterType: "fsLike"},
                {fieldName: "shippercode",caption: "供货商",filterType: "fsIn",inList:this.commonDatas.ShipperDatas},
                {fieldName: "examineat",caption: "日期",filterType: "fsDate"},
                {fieldName: "examineusercode",caption: "操作员",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "subjectCode",caption: "业务类型",filterType: "fsIn",inList:this.commonDatas.SubjectOutDatas},
                {fieldName: "paytypecode",caption: "支付方式",filterType: "fsIn",inList:this.commonDatas.PayTypeDatas},
                {fieldName: "accountsCode",caption: "帐号",filterType: "fsIn",inList:this.commonDatas.AccountsDatas},                    
                {fieldName: "note",caption: "备注",filterType: "fsLike"},
            ],
        }) ;
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                MoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).money
                },
            },
        }); 
        this.Events = $Utils.deepObjectMerge(this.Events,{
            gridKeyDown:(e: KeyboardEvent)=>{
                if (e.key=='Escape'){
                    this.thisInstance.Win.closeWin()
                }
            },
            expand:(data: any)=>{
                if (data.expanded){
                    this.thisInstance.gridDetailAction.dataSource.dataSet = data.rowData.detail
                } else {
                    this.thisInstance.gridDetailAction.dataSource.dataSet = []
                }
            }
        }) 
    }
}

export class TDetailGridAction extends TFinanceDetailGridAction<PayReportsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PayReportsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [
            {
                dataType: 'text',
                fieldName: 'curbillnumber',
                width: 150,
                title: '单号',
                readonly: true,
                sort: false,
                footers: {
                    align: 'center',
                    value: '合计',
                    valueType: 'fvtNone',
                }
            },{
                dataType: 'number',
                fieldName: 'curmoney',
                width: 100,
                title: '采购金额',
                format: '0.00',
                align: 'right',
                readonly: true,
                sort: false,
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'CurMoneyCalc'
                }
            },{
                dataType: 'number',
                fieldName: 'oweMoney',
                width: 100,
                title: '应付金额',
                format: '0.00',
                align: 'right',
                readonly: true,
                sort: false,
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'OweMoneyCalc'
                }
            },{
                dataType: 'number',
                fieldName: 'money',
                width: 100,
                title: '金额',
                format: '0.00',
                align: 'right',
                sort: false,
                readonly: true,
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'MoneyCalc'
                }
            },{
                fieldName: 'note',
                width: 100,
                title: '备注',
                readonly: true,
                sort: false,
            }
        ];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'FinanceViews-PayReportsDetail',sep: true,expand: false,opt:false,parger:false,readOnly: true
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                CurMoneyCalc:(datas: any): number=> {
                    return $Utils.sumArray(datas,'curmoney')
                },
                OweMoneyCalc:(datas: any): number=> {
                    return $Utils.sumArray(datas,'owemoney')
                },
                MoneyCalc:(datas: any): number=> {
                    const _M = $Utils.sumArray(datas,'money')
                    return _M
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            gridKeyDown:(e: KeyboardEvent)=>{
                if (e.key=='Escape'){
                    this.thisInstance.Win.closeWin()
                }
            }
        });
    }
}
