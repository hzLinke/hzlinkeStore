
import $Utils from '@v4x/utils/lkxUtil'
import { TReportsAction } from "../../reportsAction"
import { DataSourceType } from '@v4x/ui';

export class TProductInOutReport extends TReportsAction {
    constructor(dataSource: DataSourceType, instanceRefs: any) {
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',
            fieldName: 'ProductCode',
            width: 60,
            title: '货号',
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        }, {
            dataType: 'text',
            fieldName: 'barcode',
            width: 120,
            title: '条码',
        }, {
            dataType: 'text',
            fieldName: 'selfcode',
            width: 120,
            title: '自编码',
        }, {
            fieldName: 'name',
            width: 150,
            title: '品名',
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        }, {
            dataType: 'text',
            fieldName: 'spec',
            width: 100,
            title: '规格',
        }, {
            dataType: 'text',
            fieldName: 'unit',
            width: 60,
            title: '单位',
            align: 'center',
            sort: false,
        }, {
            dataType: 'number',
            fieldName: 'catecode',
            width: 100,
            title: '分类',
            customFormater: 'cateFormat',
            inputType: 'drop',
            dropListConfig: {
                allowFilter: true,
                resultFieldName: 'idcode',
                displayFieldName: 'name',
                displayFields: 'idcode|name',
                displayFieldWidths: '50|200',
                dropListDatasName: 'CateDatas',
            },
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
        }, {
            dataType: 'number',
            fieldName: 'startNum',
            width: 80,
            title: '期初|数量',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StartNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'startMoney',
            width: 80,
            title: '期初|金额',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StartMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'purchaseNum',
            width: 80,
            title: '本期采购|数量',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'PurchaseNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'purchaseMoney',
            width: 80,
            title: '本期采购|金额',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'PurchaseMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'saleNum',
            width: 80,
            title: '本期销售|数量',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SaleNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'saleMoney',
            width: 80,
            title: '本期销售|金额',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SaleMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'stockSwapNum',
            width: 80,
            title: '本期拆零|数量',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockSwapNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'StockSwapMoney',
            width: 80,
            title: '本期拆零|金额',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockSwapMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'stockChangeNum',
            width: 80,
            title: '本期损溢|数量',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockChangeNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'stockChangeMoney',
            width: 80,
            title: '本期损溢|金额',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockChangeMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'stockReceiveNum',
            width: 80,
            title: '本期领用|数量',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockReceiveNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'stockReceiveMoney',
            width: 80,
            title: '本期领用|金额',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockReceiveMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'diffNum',
            width: 80,
            title: '退货差额|数量',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'DiffNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'DiffMoney',
            width: 80,
            title: '退货差额|金额',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'DiffMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'endNum',
            width: 80,
            title: '期末|数量',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'EndNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'EndMoney',
            width: 80,
            title: '期末|金额',
            align: 'right',
            format: '0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'EndMoneyCalc'
            }
        }];
        this.TableConfig = Object.assign(this.TableConfig, {
            id: 'ReportsViews-InoutReports-ProductInOutReport',
            sep: true,
            expand: false,
            opt: false,
            parger: true,
            readOnly: true,
            allowedOperations: { alopSearch: false }
        });
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig, {
            fields: [
                { fieldName: "catecode", caption: "分类", filterType: "fsIn", inList: this.commonDatas.CateDatas },
                { fieldName: "productcode", caption: "货号", filterType: "fsNone" },
                { fieldName: "barcode", caption: "条码", filterType: "fsstrList" },
                { fieldName: "name", caption: "品名", filterType: "fsLike" },
                { fieldName: "spec", caption: "规格", filterType: "fsLike" },
                { fieldName: "note", caption: "备注", filterType: "fsLike" }
            ],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods, {
            customFormater: {

            },
            sumCalculated: {
                countCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).count
                },
                StartNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).startnum
                },
                StartMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).startmoney
                },
                EndNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).endnum
                },
                EndMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).endmoney
                },
                PurchaseNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).purchasenum
                },
                PurchaseMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).purchasemoney
                },
                SaleNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).salenum
                },
                SaleMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).salemoney
                },
                StockSwapNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).stockswapnum
                },
                StockSwapMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).stockswapmoney
                },
                StockChangeNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).stockchangenum
                },
                StockChangeMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).stockchangemoney
                },
                StockReceiveNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).stockreceivenum
                },
                StockReceiveMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).stockreceivemoney
                },
                DiffNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).diffnum
                },
                DiffMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).diffmoney
                },
            },
        });
    }
}
