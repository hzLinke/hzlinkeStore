import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, TableRowDataType } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'
import { LkxModal } from '@v4x/ui'

export interface AccountsMoneyChangeInstanceRefs extends InstanceRefsBase {
    modalInstance: InstanceType<typeof LkxModal>;
    parentInstance: ComponentInternalInstance | null | undefined;
    modalActionConfirm: (parentInstance: ComponentInternalInstance | null | undefined, value: ModalResultValue) => void,
    modalActionCancel: (parentInstance: ComponentInternalInstance | null | undefined, value: ModalResultValue) => void,
}

export interface AccountsMoneyChangeOptions extends ModalOptions {
    datas?: any
    rowIndex?: number
    listDatas?: any[]
}
