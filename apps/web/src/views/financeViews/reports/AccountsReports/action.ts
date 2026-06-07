import $Utils from '@v4x/utils/lkxUtil'
import {TFinanceListGridAction} from "../../FinanceAction"
import { DataSourceType, TableMethodsType } from '@v4x/ui';
import type { AccountsReportsInstanceRefs } from './types'
import useAppStore from '@/stores';

export class TListGridAction extends TFinanceListGridAction<AccountsReportsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<AccountsReportsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'idcode',//字段名
            width: 90,//宽度
            title: '编码',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'name',//字段名
            width: 150,//宽度
            title: '名称',//标题
            readonly: true
        },{
            dataType: 'number',//数据类型
            fieldName: 'Money',//字段名
            width: 100,//宽度
            title: '余额',//标题
            align: 'right',
            format: '0.00',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'//计算方法
            }
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'FinanceViews-Reports-AccountsReports',sep: true,expand: false,opt:false,parger:true,readOnly: true
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
