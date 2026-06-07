import { ModalOptions } from '@v4x/ui'
import type { LkxGrid, ModalResultValue, TableRowDataType } from '@v4x/ui'


import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'

export interface BatchInSelectInstanceRefs extends InstanceRefsBase {
    gridAction: any;
    detailGridAction: any;
    parentInstance: ComponentInternalInstance | null|undefined;

    modalActionConfirm:(parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue)=>void,
    modalActionCancel:(parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue)=>void,
}

export interface BatchInSelectOptions extends ModalOptions {
    billType: number| string,
    billNumber: number|string,
    customerCode?: number|string,
    shipperCode?: number|string,
    defaultDatas: TableRowDataType[]
}

