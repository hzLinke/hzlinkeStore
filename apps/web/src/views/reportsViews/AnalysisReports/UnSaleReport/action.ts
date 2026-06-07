
import $Utils from '@v4x/utils/lkxUtil'
import { TReportsAction } from "../../reportsAction"
import { DataSourceType } from '@v4x/ui';

export class TUnSaleReport extends TReportsAction {
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
        }, {
            dataType: 'number',
            fieldName: 'week1',
            width: 100,
            title: '四周销|1',
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
            fieldName: 'week2',
            width: 100,
            title: '四周销|2',
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
            fieldName: 'week3',
            width: 100,
            title: '四周销|3',
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
            fieldName: 'week4',
            width: 100,
            title: '四周销|4',
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
            fieldName: 'avgnum',
            width: 100,
            title: '四周销|日均销',
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
            fieldName: 'sumnum',
            width: 100,
            title: '四周销|合计',
            align: 'right',
            format: '0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'
            }
        }];
        this.TableConfig = Object.assign(this.TableConfig, {
            id: 'ReportsViews-AnalysisReports-UnSaleReport',
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
