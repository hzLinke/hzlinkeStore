import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType,  TableRowDataType } from '@v4x/ui';
import { FinanceViewsInstanceRefs } from './types';

export class TFinanceListGridAction<T extends FinanceViewsInstanceRefs> extends TGridAction<T>{
    [x: string]: any;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                MoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).owemoney
                },
            },
        })
        this.Events = $Utils.deepObjectMerge(this.Events,{
            gridKeyDown:(e: KeyboardEvent)=>{
                if (e.key=='Escape'){
                    this.thisInstance.Win.closeWin()
                }
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                this.instanceRefs.detailVisabled!.value = true
                this.instanceRefs.headerData!.value = rowdata
            }
        })
    }
}

export class TFinanceDetailGridAction<T extends FinanceViewsInstanceRefs> extends TGridAction<T>{
    [x: string]: any;
    public toolsBarItems= [ 
        {title:'<F5>按单列表',
            idCode:'_List',
            index:1,
            dropDown:false},
        {title:'<F6>按月汇总',
            idCode:'_Month',
            index:2,
            dropDown:false}
    ] 
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.PagerConfig={curPage:1,pageSize:0,total:0};
        this.Events = $Utils.deepObjectMerge(this.Events,{
            back:()=>{
                this.thisInstance.Action.dataSource.close();
                this.instanceRefs.detailVisabled!.value = false
                this.thisInstance.Action = this.thisInstance.gridAction
            },
            gridKeyDown:(e: KeyboardEvent)=>{
                if (e.key=='Escape'){
                    this.thisInstance.Win.closeWin()
                }
            },
            expand:(data: any)=>{
                if (data.expanded){
                    this.thisInstance.Action = this.thisInstance.gridDetailListAction;
                    this.thisInstance.detailListDataSource.dataSet = data.rowData.detail
                } else {
                    this.thisInstance.detailListDataSource.dataSet = []
                    this.thisInstance.Action = this;
                }
            },
        })
    }
}

export class TFinanceDetailListGridAction<T extends FinanceViewsInstanceRefs> extends TGridAction<T>{
    [x: string]: any;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.Events = $Utils.deepObjectMerge(this.Events,{
            gridKeyDown:(e: KeyboardEvent)=>{
                if (e.key=='Escape'){
                    this.thisInstance.Win.closeWin()
                }
            }
        })
    }
}
