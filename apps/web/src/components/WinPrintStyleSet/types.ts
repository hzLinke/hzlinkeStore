import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, TableRowDataType } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'
import { LkxModal } from '@v4x/ui'

export interface WinPrintStyleSetInstanceRefs extends InstanceRefsBase {

}

export interface WinPrintStyleSetOptions extends ModalOptions {
    type: string
}
