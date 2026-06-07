
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui';
export class TUserGridAction extends TGridAction{
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
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
            dataType: 'text',//数据类型
            fieldName: 'MainNote',//字段名
            width: 150,//宽度
            title: '单据备注',//标题
            readonly: true
        },{
            fieldName: 'customercode',//字段名
            width: 200,//宽度
            title: '客户',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'CustomerDatas',
                dropListDatas: this.commonDatas.CustomerDatas
            },  
            footers: {
                align: 'center',
                value: '合计',
                calculationer: 'countCalc'//计算方法
            }         
        },{
            dataType: 'number',//数据类型
            fieldName: 'Pcode',//字段名
            width: 150,//宽度
            title: '项目名称',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'ProjectDatas',
                //dropListDatas: this.commonDatas.value.LtdDatas
            },
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'deliveryAt',//字段名
            width: 120,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '送货日期',//标题
            readonly: false,
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'at',//字段名
            width: 120,//宽度
            title: '审核日期',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            fieldName: 'examineUserCode',//字段名
            width: 80,//宽度
            title: '审核人',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
                //dropListDatas: this.commonDatas.value.UserDatas
            },           
        },{
            fieldName: 'DisTributionUserCode',//字段名
            width: 80,//宽度
            title: '配货人',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
            },           
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
        },{
            dataType: 'text',//数据类型
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'QualityGrade',//字段名
            width: 100,//宽度
            title: '质量',//标题
            sort: true,
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: [{idcode:0,name:'不定'},{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]
            },
        },{
            dataType: 'text',//数据类型
            fieldName: 'unit',//字段名
            width: 80,//宽度
            title: '结算单位',//标题
            align: 'center',
            sort: true,
        },{
            dataType: 'text',//数据类型
            fieldName: 'minunit',//字段名
            width: 80,//宽度
            title: '存货单位',//标题
            align: 'center',
            sort: true,
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
            fieldName: 'ExChangeNumEx',//字段名
            width: 80,//宽度
            title: '转换量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ExChangeNumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'numex',//字段名
            width: 80,//宽度
            title: '结算量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'CostPrice',//字段名
            width: 120,//宽度
            title: '成本价',//标题
            align: 'right',
            format:'0.0000',
            sort: true,
        },{
            dataType: 'number',//数据类型
            fieldName: 'ActualCostPrice',//字段名
            width: 120,//宽度
            title: '成本价(含报损）',//标题
            align: 'right',
            format:'0.00000',
            sort: true,
        },{
            dataType: 'number',//数据类型
            fieldName: 'ActualCostMoney',//字段名
            width: 120,//宽度
            title: '成本金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ActualCostMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'saleprice',//字段名
            width: 80,//宽度
            title: '单价',//标题
            align: 'right',
            format:'0.000',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'SaleMoney',//字段名
            width: 120,//宽度
            title: '销售金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SaleMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'replaceNumEx',//字段名
            width: 80,//宽度
            title: '代打量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ReplaceNumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'ReplaceSaleMoney',//字段名
            width: 120,//宽度
            title: '代打金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ReplaceSaleMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'KsMoney',//字段名
            width: 120,//宽度
            title: '亏损金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'KsMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'Profit',//字段名
            width: 100,//宽度
            title: '毛利',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ProfitCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'ProfitRate',//字段名
            width: 100,//宽度
            title: '毛利率',//标题
            format: '0.00%',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ProfitRateCalc'//计算方法
            }
        },{
            fieldName: 'note',//字段名
            width: 200,//宽度
            inputType: 'text',
            title: '备注',//标题
            sort: false
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'saleViews-Reports-saleReports',sep: true,expand: true,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "billnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "customercode",caption: "客户",filterType: "fsIn",inList:this.commonDatas.CustomerDatas},
                {fieldName: "pcode",caption: "项目名称",filterType: "fsIn",inList:this.commonDatas.ProjectDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "at",caption: "审核日",filterType: "fsDate"},
                {fieldName: "mainnote",caption: "单据备注",filterType: "fsLike"},    
                {fieldName: "makingusercode",caption: "制单人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "distributionuserCode",caption: "配货人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "QualityGrade",caption: "质量",filterType: "fsIn",inList:[{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]},
                {fieldName: "catecode",caption: "分类",filterType: "fsIn",inList:this.commonDatas.CateDatas},
                {fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customColor:(rowItem: TableRowDataType,cellItem: any): string=>{
                if (rowItem.numex<0&&(cellItem.fieldName == 'numex'||cellItem.fieldName == 'SaleMoney')) return 'red';
                return ''
            },
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                ExChangeNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).exchangenum
                },
                NumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).num
                },
                ReplaceNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).replacenum
                },
                
                ActualCostMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).actualcostmoney
                },
                SaleMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).salemoney  
                },
                ReplaceSaleMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).replacesalemoney  
                },
                KsMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).ksmoney  
                },
                ProfitCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).profit
                },
                ProfitRateCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).profit/(this.dataSource.totalData as any).salemoney*100
                },
            },
        });
    }
}