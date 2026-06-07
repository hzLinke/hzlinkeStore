
import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import { DataSourceType,  TableMethodsType } from '@v4x/ui';
import { StockInfBoxInstanceRefs } from './types';

export class TAction extends TGridAction<StockInfBoxInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: StockInfBoxInstanceRefs){ 
        super(dataSource, instanceRefs)
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'StockInfBox',sep: true,expand: false,opt:false,parger:false,readOnly: true,endAutoAppend: false
        }); 
        this.PagerConfig.pageSize = 0;
        this.Columns = [{
            dataType: 'number',
            fieldName: 'areacode',
            width: 120,
            title: '仓库',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: this.commonDatas.AreaDatas
            },
        },{
            dataType: 'number',
            fieldName: 'num',
            width: 120,
            title: '数量|库存',
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'NumCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'waitInNum',
            width: 120,
            title: '数量|待入量',
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'WaitInNumCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'waitOutNum',
            width: 120,
            title: '数量|待出量',
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'WaitOutNumCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'allowedNum',
            width: 120,
            title: '数量|可用量',
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'AllowedNumCalc'
            }
        }];
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                NumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).num
                },
                WaitInNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).waitinnum
                },
                WaitOutNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).waitoutnum
                },
                AllowedNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).allowednum
                },
                SumMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).summoney
                },            
            },
        })
    }
}
