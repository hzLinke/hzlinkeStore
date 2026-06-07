
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import type { MergeSelectInstanceRefs } from './types'
import { DataSourceType, ModalResultEnum, TableRowDataType } from '@v4x/ui';

export class TAction extends TGridAction<MergeSelectInstanceRefs> {
    public getParams: object = {};
    constructor(dataSource: DataSourceType, instanceRefs: MergeSelectInstanceRefs) {
        super(dataSource, instanceRefs)
        this.Columns = [{
            fieldName: 'billnumber',
            width: 200,
            title: '单号',
            align: 'center',
            readonly: true
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
        this.Events = $Utils.deepObjectMerge(this.Events, {
            rowDbClick: async (datas: TableRowDataType[], rowdata: TableRowDataType, rowIndex: number, cellIndex: number, fieldName: string) => {
                this.instanceRefs.modalActionConfirm?.(this.instanceRefs.parentInstance, { action: ModalResultEnum.mrConfirm, data: rowdata })
            },
            keyDown: (e: KeyboardEvent, rowdata: TableRowDataType) => {
                if (e.code == 'Enter')
                    this.instanceRefs.modalActionConfirm?.(this.instanceRefs.parentInstance, { action: ModalResultEnum.mrConfirm, data: rowdata })
                if (e.code == 'Escape')
                    this.instanceRefs.modalActionCancel?.(this.instanceRefs.parentInstance, { action: ModalResultEnum.mrCancel, data: null })
            }
        })
    }
}
