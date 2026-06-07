
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, ModalResultEnum, TableColumnsType, TableRowDataType } from '@v4x/ui';
import {RateProductSelectInstanceRefs} from './types'

export class TAction extends TGridAction<RateProductSelectInstanceRefs>{
    public getParams: object = {}
    constructor(dataSource: DataSourceType, instanceRefs: RateProductSelectInstanceRefs, type = 'order') {
        super(dataSource, instanceRefs)
        this.Columns = [{
            fieldName: 'idcode',
            width: 60,
            title: '编码',
            readonly: true,
            sort: false,
        }, {
            fieldName: 'name',
            width: 150,
            title: '品名 ',
            readonly: true,
            sort: false,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        }, {
            fieldName: 'spec',
            width: 90,
            title: '规格',
        }, {
            fieldName: 'downunit',
            width: 50,
            title: '单位',
            align: 'center',
            sort: false,
        }, {
            dataType: 'number',
            fieldName: 'saleprice',
            width: 80,
            title: '单价',
            sort: false,
            format: '0.00',
            align: 'right'
        }, {
            fieldName: 'note',
            width: 90,
            title: '备注',
            sort: false,
        }, {
            dataType: 'number',
            fieldName: 'rate',
            width: 80,
            title: '相似度',
            sort: false,
            format: '0.00%',
            align: 'right'
        }]
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig, {
            id: 'OrderPackDetail',
            sep: false,
            expand: false,
            opt: false,
            parger: false,
            readOnly: true,
            optWidth: 280,
            allowedOperations: {
                alopInsert: false
            }
        })
        this.Methods = $Utils.deepObjectMerge(this.Methods, {
            customColor: (rowItem: TableRowDataType, _cellItem: object): string => {
                if (rowItem.ismate == 0) return 'red'
                return ''
            },
            rowCalculated: {
                calculaMoney: (rowItem: any): number => {
                    return rowItem.numex * rowItem.costprice
                }
            },
            sumCalculated: {
                countCalc: (datas: any): number => {
                    return datas.length
                },
                numCalc: (datas: any): number => {
                    return $Utils.sumArray(datas, 'num')
                },
                numExCalc: (datas: any): number => {
                    return $Utils.sumArray(datas, 'numex')
                },
                moneyCalc: (datas: any): number => {
                    const _Money = $Utils.sumArray(datas, 'money')
                    return _Money
                },
            },
            customFormater: {
                unitFormat: (value: string, rowItem: TableRowDataType) => {
                    return rowItem.saletype == 2 ? (rowItem.downunit || '') + '/' + (rowItem.unit || '') : (rowItem.unit || '')
                }
            }
        })
        this.Events = $Utils.deepObjectMerge(this.Events, {
            rowDbClick: async (datas: TableRowDataType[], rowdata: TableRowDataType, rowIndex: number, cellIndex: number, fieldName: string) => {
                this.instanceRefs.modalActionConfirm?.(
                    this.instanceRefs.parentInstance, 
                    {action: ModalResultEnum.mrConfirm, data: rowdata}
                )
            }
        })
    }

    public async open() {
        const res = await $api.comonRequest(this.dataSource.apiPath, 'getFromProc', this.getParams)
        if (res && res.errCode == 0) {
            this.dataSource.dataSet = res.datas
            this.dataSource.CurDataSet = JSON.parse(JSON.stringify(res.datas))
            this.dataSource.totalData = res.total
            this.dataSource.dataSetRowCount = res.total.count
        }
    }
}