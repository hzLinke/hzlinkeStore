import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import { TReportsAction } from "../../reportsAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui';
import { CustomerSaleReportInstanceRefs } from './types';

export class TCustomerSaleReport extends TReportsAction {
    constructor(dataSource: DataSourceType, instanceRefs: CustomerSaleReportInstanceRefs) {
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',
            fieldName: 'CustomerCode',
            width: 200,
            title: '客户',
            inputType: 'drop',
            dropListConfig: {
                allowFilter: true,
                resultFieldName: 'idcode',
                displayFieldName: 'name',
                displayFields: 'idcode|name',
                displayFieldWidths: '50|200',
                dropListDatasName: 'CustomerDatas',
            },
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
            id: 'ReportsViews-SaleReprots-CustomerReport',
            sep: true,
            expand: false,
            opt: false,
            parger: true,
            readOnly: true,
            allowedOperations: { alopSearch: false }
        });
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig, {
            fields: [{ fieldName: "customercode", caption: "客户", filterType: "fsIn", inList: this.commonDatas.CustomerDatas }],
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
        this.Events = $Utils.deepObjectMerge(this.Events, {
            rowDbClick: async (datas: TableRowDataType[], rowdata: TableRowDataType, rowIndex: number, cellIndex: number, fieldName: string) => {
                this.buildSalesReports(this.instanceRefs.StartDate.value,
                    this.instanceRefs.EndDate.value,
                    rowdata.customercode,
                    () => {
                        this.instanceRefs.detailVisabled.value = true
                        this.instanceRefs.headerData!.value = Object.assign(rowdata, { startat: this.instanceRefs.StartDate.value, endat: this.instanceRefs.EndDate.value })
                    }
                )
            }
        });
    }

    public async buildSalesReports(startAt: string, endAt: string, customerCode: number, backCall: Function) {
        const res = await $api.comonRequest('/masterApi/disApi/reports/SaleReports/CustomerSaleReport/detailSaleReport/', 'buildReport', {
            StartAt: startAt,
            EndAt: endAt,
            CustomerCode: customerCode,
            IsExtend: 0
        })
        if (res.errCode == 0) {
            backCall()
        }
    }
}

export class TCustomerDetailSaleReport extends TReportsAction {
    constructor(dataSource: DataSourceType, instanceRefs: CustomerSaleReportInstanceRefs) {
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
            width: 80,
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
            width: 80,
            title: '毛利率',
            align: 'right',
            format: '0.00%',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ProFitRateCalc'
            }
        }];
        this.TableConfig = Object.assign(this.TableConfig, {
            id: 'ReportsViews-SaleReprots-CustomerReport',
            sep: true,
            expand: false,
            opt: false,
            parger: true,
            readOnly: true,
            allowedOperations: { alopSearch: true }
        });
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig, {
            fields: [
                { fieldName: "catecode", caption: "分类", filterType: "fsIn", inList: this.commonDatas.CateDatas },
                { fieldName: "productcode", caption: "货号", filterType: "fsNone" },
                { fieldName: "barcode", caption: "条码", filterType: "fsstrList" },
                { fieldName: "name", caption: "品名", filterType: "fsLike" },
                { fieldName: "spec", caption: "规格", filterType: "fsLike" }
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
