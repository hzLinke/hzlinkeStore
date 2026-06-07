import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'

export interface WinDoMethodInstanceRefs extends InstanceRefsBase {
    modalInstance: any;
    parentInstance: ComponentInternalInstance | null | undefined;
}

export interface WinDoMethodOptions extends ModalOptions {
    datas: string
}
