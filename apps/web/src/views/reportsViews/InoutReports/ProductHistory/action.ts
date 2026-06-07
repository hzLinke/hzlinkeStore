
import $Utils from '@v4x/utils/lkxUtil'
import { TReportsAction } from "../../reportsAction"
import { DataSourceType } from '@v4x/ui';

export class TProductHistory extends TReportsAction {
    constructor(dataSource: DataSourceType, instanceRefs: any) {
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'DateTime',
            fieldName: 'At',
            width: 100,
            title: '日期',
            format: 'yyyy-MM-dd',
            readonly: true,
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'startNum',
            width: 80,
            title: '期初|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'startMoney',
            width: 80,
            title: '期初|金额',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'purchaseNum',
            width: 80,
            title: '本期采购|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'purchaseMoney',
            width: 80,
            title: '本期采购|金额',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'saleNum',
            width: 80,
            title: '本期销售|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'saleMoney',
            width: 80,
            title: '本期销售|金额',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'stockSwapNum',
            width: 80,
            title: '本期拆零|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'StockSwapMoney',
            width: 80,
            title: '本期拆零|金额',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'stockChangeNum',
            width: 80,
            title: '本期损溢|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'stockChangeMoney',
            width: 80,
            title: '本期损溢|金额',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'AreaExChangeNum',
            width: 80,
            title: '本期调拨|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'AreaExChangeMoney',
            width: 80,
            title: '本期调拨|金额',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'stockReceiveNum',
            width: 80,
            title: '本期领用|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'stockReceiveMoney',
            width: 80,
            title: '本期领用|金额',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'diffNum',
            width: 80,
            title: '退货差额|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'DiffMoney',
            width: 80,
            title: '退货差额|金额',
            align: 'right',
            format: '0.00'
        }, {
            dataType: 'number',
            fieldName: 'endNum',
            width: 80,
            title: '期末|数量',
            align: 'right',
            format: '0.00',
            sort: false
        }, {
            dataType: 'number',
            fieldName: 'EndMoney',
            width: 80,
            title: '期末|金额',
            align: 'right',
            format: '0.00',
            sort: false
        }];
        this.TableConfig = Object.assign(this.TableConfig, {
            id: 'ReportsViews-InoutReports-ProductHistory',
            sep: true,
            expand: false,
            opt: false,
            parger: true,
            readOnly: true,
            gridFooter: false,
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
        })
    }
}
