
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui';
export class TStockGridAction extends TGridAction{
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs)
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 60,//宽度
            title: '货号',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'barcode',//字段名
            width: 120,//宽度
            title: '条码',//标题
        },{
            fieldName: 'name',//字段名
            width: 150,//宽度
            title: '品名',//标题
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            align: 'center',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'catecode',//字段名
            width: 80,//宽度
            title: '分类',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'CateDatas',
                //dropListDatas: this.commonDatas.value.CateDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '可用量',//标题
            align: 'right',
            format:'0.00',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'LowerLimit',//字段名
            width: 80,//宽度
            title: '下限',//标题
            align: 'right',
            format:'0.00',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'qNum',//字段名
            width: 80,//宽度
            title: '欠数',//标题
            align: 'right',
            format:'0.00',
            sort: false,
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'stocksViews-Qstock',sep: true,expand: false,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "productcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "catecode",caption: "分类",filterType: "fsIn",inList:this.commonDatas.CateDatas}
            ],
        }) 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customColor:(rowItem: TableRowDataType,cellItem: object): string=>{
                if (rowItem.allowednum<0) return 'red';
                return ''
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                NumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).num
                },
                qNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).qNum
                },
            },
        })    
    }    

}
