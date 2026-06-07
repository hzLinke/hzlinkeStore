
import $Utils from '@v4x/utils/lkxUtil'
import { TReportsAction } from "../../reportsAction"
import { DataSourceType } from '@v4x/ui';

export class TTotalSaleReport extends TReportsAction {
    constructor(dataSource: DataSourceType, instanceRefs: any) {
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'DateTime',
            fieldName: 'at',
            width: 110,
            title: '日期',
            readonly: true,
            format: 'yyyy-MM-dd',
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        }, {
            dataType: 'number',
            fieldName: 'num',
            width: 100,
            title: '销量',
            align: 'right',
            format: '0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'CostMoney',
            width: 100,
            title: '销售成本',
            align: 'right',
            format: '0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'CostMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'SaleMoney',
            width: 100,
            title: '销售金额',
            align: 'right',
            format: '0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SaleMoneyCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'ProFit',
            width: 100,
            title: '毛利',
            align: 'right',
            format: '0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ProFitCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'ProFitRate',
            width: 100,
            title: '毛利率',
            align: 'right',
            format: '0.00%',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ProFitRateCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'salePer',
            width: 100,
            title: '销占比',
            align: 'right',
            format: '0.00%',
            sort: true
        }, {
            dataType: 'number',
            fieldName: 'ProFitPer',
            width: 100,
            title: '毛利占比',
            align: 'right',
            format: '0.00%',
            sort: true
        }];
        this.TableConfig = Object.assign(this.TableConfig, {
            id: 'ReportsViews-SaleReprots-TotalSaleReport',
            sep: true,
            expand: false,
            opt: false,
            parger: true,
            readOnly: true,
            allowedOperations: { alopSearch: false }
        });
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig, {
            fields: [{ fieldName: "at", caption: "日期", filterType: "fsDate" }],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods, {
            customFormater: {

            },
            sumCalculated: {
                countCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).count
                },
                NumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).num
                },
                CostMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).costmoney
                },
                SaleMoneyCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).salemoney
                },
                ProFitCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).profit
                },
                ProFitRateCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).profit / (this.dataSource.totalData as any).salemoney * 100
                }
            },
        })
    }
}
