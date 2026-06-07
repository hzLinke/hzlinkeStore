import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, TableRowDataType } from '@v4x/ui'


import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'
import { LkxInput } from '@v4x/ui'

export interface RateProductSelectInstanceRefs extends InstanceRefsBase {
    searchBoxInstance: InstanceType<typeof LkxInput>;
    parentInstance: ComponentInternalInstance | null|undefined;
    customercode: any
    inputname: string,
    modalActionConfirm:(parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue)=>void,
    modalActionCancel:(parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue)=>void,
}

export interface RateProductSelectOptions extends ModalOptions {
    billType?: number| string,
    inputname: string,
    customerCode?: number|string,
}

