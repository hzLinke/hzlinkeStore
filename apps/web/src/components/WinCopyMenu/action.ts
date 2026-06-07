import $api from '@/request/api'
import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import { DataSourceType, ModalResultEnum, TableRowDataType } from '@v4x/ui'
import type { CopyMenuInstanceRefs } from './types'

export class TAction extends TGridAction<CopyMenuInstanceRefs> {
    constructor(dataSource: DataSourceType, instanceRefs: CopyMenuInstanceRefs) {
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',
            fieldName: 'idcode',
            width: 100,
            title: '编码',
            align: 'center',
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
        }, {
            fieldName: 'name',
            width: 230,
            title: '品名',
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        }, {
            fieldName: 'spec',
            width: 200,
            title: '规格',
        }, {
            fieldName: 'downunit',
            width: 60,
            title: '单位',
            align: 'center',
        }, {
            fieldName: 'numex',
            width: 100,
            title: '数量',
            align: 'right'
        }, {
            fieldName: 'saleprice',
            width: 100,
            title: '单价',
            align: 'right'
        }, {
            fieldName: 'note',
            width: 100,
            title: '备注',
        }]
        this.TableConfig = Object.assign(this.TableConfig, {
            id: 'basicViews-Area',
            sep: true,
            expand: false,
            opt: false,
            parger: false,
            readOnly: true
        })
        this.Methods = $Utils.deepObjectMerge(this.Methods, {
            sumCalculated: {
                countCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).count
                },
            },
        })
        this.Events = $Utils.deepObjectMerge(this.Events, {
            rowDbClick: async (datas: TableRowDataType[], rowdata: TableRowDataType, rowIndex: number, cellIndex: number, fieldName: string) => {
                this.instanceRefs.modalActionCancel?.(this.instanceRefs.parentInstance, { action: ModalResultEnum.mrCancel, data: rowdata })
            },
        })
    }
    public setPower() {
        return false
    }
}
