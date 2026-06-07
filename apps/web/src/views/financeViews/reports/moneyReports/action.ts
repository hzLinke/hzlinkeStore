import $Utils from '@v4x/utils/lkxUtil'
import {TFinanceListGridAction} from "../../FinanceAction"
import { DataSourceType, TableMethodsType } from '@v4x/ui';
import type { MoneyReportsInstanceRefs } from './types'
import useAppStore from '@/stores';

export class TListGridAction extends TFinanceListGridAction<MoneyReportsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<MoneyReportsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.Columns = [{
            dataType: 'text',
            fieldName: 'at',
            width: 150,
            title: '日期',
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'number',
            fieldName: 'inMoney',
            width: 100,
            title: '收入',
            align: 'right',
            format: '0.00',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'InMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'OutMoney',
            width: 120,
            title: '支出金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'OutMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'CMoney',
            width: 120,
            title: '余额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'CMoneyCalc'
            }
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'FinanceViews-Reports-MoneyReports',sep: true,expand: true,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "at",caption: "日期",filterType: "fsDate"}
            ],
        }) ;
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                InMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).inmoney
                },
                OutMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).outmoney
                },
                CMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).cmoney
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
