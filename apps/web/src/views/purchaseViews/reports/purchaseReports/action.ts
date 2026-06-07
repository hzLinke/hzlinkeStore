
import $Utils from '@v4x/utils/lkxUtil'
import type { PurchaseViewsInstanceRefs } from '../../types'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui'
import { WinPackDetail } from '@/components'
export class TUserGridAction extends TGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType,instanceRefs: PurchaseViewsInstanceRefs){ 
        super(dataSource,instanceRefs)
        this.dataSource.getParams.defaultCondition = "datediff(day,At,getDate())=0"
        this.Columns = [{
            dataType: 'text',//数据类型
            fieldName: 'billnumber',//字段名
            width: 150,//宽度
            title: '单号',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'OrderBillnumber',//字段名
            width: 150,//宽度
            title: '订单号',//标题
            readonly: true
        },{
            fieldName: 'shippercode',//字段名
            width: 200,//宽度
            title: '供货商',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'ShipperDatas',
                //dropListDatas: this.commonDatas.value.ShipperDatas
            },  
            footers: {
                align: 'center',
                value: '合计',
                calculationer: 'countCalc'//计算方法
            }                  
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'deliveryAt',//字段名
            width: 120,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '送货日',//标题
            readonly: false,
        },{
            fieldName: 'MakingUserCode',//字段名
            width: 80,//宽度
            title: '采购员',//标题
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
                //dropListDatas: this.commonDatas.value.UserDatas
            }
        },{
            fieldName: 'MrUserCode',//字段名
            width: 80,//宽度
            title: '收货人',//标题
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
                //dropListDatas: this.commonDatas.value.UserDatas
            }
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'MrAt',//字段名
            width: 120,//宽度
            title: '收货时间',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            fieldName: 'ExamineUserCode',//字段名
            width: 80,//宽度
            title: '入账人',//标题
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
                //dropListDatas: this.commonDatas.value.UserDatas
            }
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'ExamineAt',//字段名
            width: 120,//宽度
            title: '入账时间',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            dataType: 'number',//数据类型
            fieldName: 'ProductCode',//字段名
            width: 60,//宽度
            title: '货号',//标题
            readonly: true
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
            fieldName: 'catecode',//字段名
            width: 100,//宽度
            title: '分类',//标题
            customFormater:'cateFormat',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'CateDatas',
               // dropListDatas: this.commonDatas.value.CateDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'numEx',//字段名
            width: 80,//宽度
            title: '数量',//标题
            align: 'right',
            format:'0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'costprice',//字段名
            width: 80,//宽度
            title: '结算单价',//标题
            align: 'right',
            format:'0.000',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'ActualCostPrice',//字段名
            width: 80,//宽度
            title: '实际单价',//标题
            align: 'right',
            format:'0.000',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'SumMoney',//字段名
            width: 120,//宽度
            title: '结算金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'ActualSumMoney',//字段名
            width: 120,//宽度
            title: '实际金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ActualMoneyCalc'//计算方法
            }
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            inputType: 'datetime',
            title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'PurchaseViews-PurchaseReports',sep: true,expand: false,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "查糊单号",filterType: "fsLike"},
                {fieldName: "billnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "shippercode",caption: "供货商",filterType: "fsIn",inList:this.commonDatas.ShipperDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "mrat",caption: "收货日",filterType: "fsDate"},
                {fieldName: "examineat",caption: "入账日",filterType: "fsDate"},
                {fieldName: "makingusercode",caption: "采购员",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "mrusercode",caption: "收货人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "examineusercode",caption: "入帐人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "catecode",caption: "分类",filterType: "fsIn",inList:this.commonDatas.CateDatas},
                {fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customFormater:{
            
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                NumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).num
                },
                MoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).summoney
                },
                ActualMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).actualsummoney
                },
            },
        })
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
            // console.log(rowdata)
                 WinPackDetail.show({
                    title:'商品去向明细',
                    width: '80%',
                    height: '80%',
                    headerDatas: rowdata,
                    deliveryAt: rowdata.deliveryat,
                    billnumber: rowdata.billnumber,
                    productCode: rowdata.productcode,
                    saleType: rowdata.saletype,
                    billType: 'order',
                    batchNumber: rowdata.batchnumber,
                    qualityGrade: rowdata.qualityGrade
                })
            }
        })   
    }
}