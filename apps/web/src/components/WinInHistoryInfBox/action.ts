
import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import { DataSourceType, TableMethodsType } from '@v4x/ui';

export class TAction extends TGridAction{
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource, instanceRefs)
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'basicViews-Area',sep: true,expand: false,opt:false,parger:false,readOnly: true,endAutoAppend: false
        }); 
        this.PagerConfig.pageSize = 0;
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
            fieldName: 'shipperCode',
            width: 200,
            title: '供应高',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'ShipperDatas',
                dropListDatas: this.commonDatas.ShipperDatas
            },  
            footers: {
                align: 'center',
                value: '合计',
                calculationer: 'countCalc'
            }         
        },{
            dataType: 'datetime',
            fieldName: 'deliveryAt',
            width: 120,
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '送货日期',
            readonly: false,
        },{
            dataType: 'datetime',
            fieldName: 'at',
            width: 120,
            title: '审核日期',
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            dataType: 'number',
            fieldName: 'numex',
            width: 80,
            title: '结算量',
            align: 'right',
            format:'0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'costPrice',
            width: 80,
            title: '单价',
            align: 'right',
            format:'0.000',
            sort: false,
        }];
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                NumCalc:(datas: any): number=> {
                    return $Utils.sumArray(datas,'numex')
                },
            },
        });
    }
}
