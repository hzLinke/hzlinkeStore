
import $Utils from '@v4x/utils/lkxUtil'
import { TReportsAction } from "../../reportsAction"
import { DataSourceType } from '@v4x/ui';

export class TInOutRateReport extends TReportsAction {
    constructor(dataSource: DataSourceType, instanceRefs    : any) {
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
            fieldName: 'PurchaseNum',
            width: 100,
            title: '采购数量',
            align: 'right',
            format: '0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'PurchaseNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'saleNum',
            width: 100,
            title: '销售数量',
            align: 'right',
            format: '0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SaleNumCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'rate',
            width: 100,
            title: '比率',
            align: 'right',
            format: '0.00',
            sort: false
        }];
        this.TableConfig = Object.assign(this.TableConfig, {
            id: 'ReportsViews-AnalysisReports-inOutRateReport',
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
                PurchaseNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).purchasenum
                },
                SaleNumCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).salenum
                }
            },
        })
    }
}
