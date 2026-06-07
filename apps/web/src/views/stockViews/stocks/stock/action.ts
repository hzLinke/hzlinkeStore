
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"

import pageAction from '@/views/pageAction'
import { DataSourceType, TableRowDataType, CommondDatasParamType } from '@v4x/ui';
import { StockInstanceRefs } from './types';
import useAppStore from '@/stores';

export class TStockGridAction extends TGridAction<StockInstanceRefs>{
    constructor(dataSource: DataSourceType,instanceRefs: StockInstanceRefs){ 
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
            dataType: 'text',//数据类型
            fieldName: 'selfcode',//字段名
            width: 120,//宽度
            title: '自编码',//标题
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
            fieldName: 'areacode',//字段名
            width: 80,//宽度
            title: '仓库',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'AreaDatas',
                //dropListDatas: this.commonDatas.value.AreaDatas
            },
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
            fieldName: 'qualityGrade',//字段名
            width: 80,//宽度
            title: '质量',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: [
                    {
                        idcode: '1',
                        name: '标准'
                    },
                    {
                        idcode: '2',
                        name: '次级'
                    },
                    {
                        idcode: '3',
                        name: '高级'
                    },
                ]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '数量|库存',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'NumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'waitInNum',//字段名
            width: 80,//宽度
            title: '数量|待入量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'WaitInNumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'waitOutNum',//字段名
            width: 80,//宽度
            title: '数量|待出量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'WaitOutNumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'allowedNum',//字段名
            width: 80,//宽度
            title: '数量|可用量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'AllowedNumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'avgprice',//字段名
            width: 80,//宽度
            title: '进价',//标题
            align: 'right',
            format:'0.0000',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'sumMoney',//字段名
            width: 80,//宽度
            title: '金额',//标题
            align: 'right',
            format:'0.00',
            sort: false,
            footers: {
                valueType: 'fvtSum',
                calculationer: 'SumMoneyCalc'//计算方法
            }
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            inputType: 'datetime',
            title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'stocksViews-stock',sep: true,expand: true,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "productcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "selfcode",caption: "自编码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "QualityGrade",caption: "质量",filterType: "fsIn",inList:[{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]},
                {fieldName: "areacode",caption: "仓库",filterType: "fsIn",inList:this.commonDatas.AreaDatas},
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
                RuningNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).runingnum
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
        this.Events = $Utils.deepObjectMerge(this.Events,{

            expand:(data: any)=>{
                if (data.expanded){
                    this.instanceRefs.gridWaitInAction!.dataSource.getParams.condition = `areaCode = ${data.rowData.areacode} and productCode = ${data.rowData.productcode}  and QualityGrade = ${data.rowData.qualitygrade}`
                    this.instanceRefs.gridWaitInAction?.open()
                    this.instanceRefs.gridWaitOutAction!.dataSource.getParams.condition = `areaCode = ${data.rowData.areacode} and productCode = ${data.rowData.productcode}  and QualityGrade = ${data.rowData.qualitygrade}`
                    this.instanceRefs.gridWaitOutAction?.open()
                } else {
                    this.instanceRefs.gridWaitOutAction?.dataSource.close();
                    this.instanceRefs.gridWaitInAction?.dataSource.close();
                }
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                const ActionItem = {
                    rowid: "52",
                    level: "2",
                    idcode: "60102",
                    pcode: "601",
                    "checked": "1",
                    "title": "单品历史",
                    "viewpath": "InoutReports/ProductHistory",
                    "iconcls": "",
                    "showmodel": "",
                    "guid": "d76dcaa4-70a9-4f25-b688-795cc1d2fcb6",
                    "open": false,
                    productInfo: JSON.stringify(rowdata)
                }
                pageAction.toPage(this.instanceRefs.router,ActionItem)
            }
        })
    }
}

export class TWaitInkGridAction extends TGridAction<StockInstanceRefs>{
    constructor(dataSource: DataSourceType,instanceRefs: StockInstanceRefs){ 
        super(dataSource,instanceRefs)
        this.Columns = [{
                dataType: 'text',
                fieldName: 'billnumber',//字段名
                width: 150,//宽度
                title: '单号',//标题
                sort: false
            },{
                dataType: 'datetime',//数据类型
                fieldName: 'deliveryAt',//字段名
                width: 120,//宽度
                inputType: 'datetime',
                format:'yyyy-MM-dd',
                readonly: false,
                title: '送货日',//标题
            },{
                fieldName: 'shippercode',//字段名
                width: 200,//宽度
                title: '供货商',//标题
                inputType: 'drop',
                readonly: true,
                sort: false,
                dropListConfig:{
                    allowFilter: true,
                    resultFieldName:'idcode',/**下拉返回字段 */
                    displayFieldName: 'name',/**下拉显示字段 */
                    displayFields:'idcode|name',
                    displayFieldWidths:'50|200',
                    dropListDatasName:'ShipperDatas',
                   // dropListDatas: this.commonDatas.value.ShipperDatas
                },
            },{
                dataType: 'number',
                fieldName: 'num',//字段名
                width: 80,//宽度
                title: '数量',//标题
                format:'0.00',
                align: 'right',
                sort: false,
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'NumCalc'//计算方法
                }
            }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'stockViews-WaitInDetail',sep: true,expand: false,opt:false,parger:false,readOnly: true
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            sumCalculated:{
                NumCalc:(datas: TableRowDataType[]): number=> {
                    return  $Utils.sumArray(datas,'num')
                },
            },
        })
    }
}

export class TWaitOutkGridAction extends TGridAction<StockInstanceRefs>{
    constructor(dataSource: DataSourceType,instanceRefs: StockInstanceRefs){ 
        super(dataSource,instanceRefs)
        this.Columns = [{
                dataType: 'text',
                fieldName: 'billnumber',//字段名
                width: 150,//宽度
                title: '单号',//标题
                sort: false
            },{
                dataType: 'datetime',//数据类型
                fieldName: 'deliveryAt',//字段名
                width: 120,//宽度
                inputType: 'datetime',
                format:'yyyy-MM-dd',
                readonly: false,
                title: '送货日',//标题
            },{
                fieldName: 'customercode',//字段名
                width: 200,//宽度
                title: '客户',//标题
                inputType: 'drop',
                readonly: true,
                sort: false,
                dropListConfig:{
                    allowFilter: true,
                    resultFieldName:'idcode',/**下拉返回字段 */
                    displayFieldName: 'name',/**下拉显示字段 */
                    displayFields:'idcode|name',
                    displayFieldWidths:'50|200',
                    dropListDatasName:'CustomerDatas',
                   // dropListDatas: this.commonDatas.value.CustomerDatas
                },
            },{
                dataType: 'number',
                fieldName: 'Ordernum',//字段名
                width: 80,//宽度
                title: '下单数量',//标题
                format:'0.00',
                align: 'right',
                sort: false,
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'OrderNumCalc'//计算方法
                }
            },{
                dataType: 'number',
                fieldName: 'num',//字段名
                width: 80,//宽度
                title: '配货数量',//标题
                format:'0.00',
                align: 'right',
                sort: false,
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'NumCalc'//计算方法
                }
            }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'stockViews-WaitOutDetail',sep: true,expand: false,opt:false,parger:false,readOnly: true
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            sumCalculated:{
                NumCalc:(datas: TableRowDataType[]): number=> {
                    return  $Utils.sumArray(datas,'num')
                },
                OrderNumCalc:(datas: TableRowDataType[]): number=> {
                    return  $Utils.sumArray(datas,'ordernum')
                }
            }
        })
    }
    
}