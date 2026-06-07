import { ModalOptions } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'
import { TGridAction } from '@/usehook/gridAction'

export interface MateWinInstanceRefs extends InstanceRefsBase {
    gridRateAction: any,
    gridAction: any,
    showMateList: any,
    customercode: any
}

export interface MateWinOptions extends ModalOptions {
    type?: 'order' | 'customer'
    customercode: string
    billnumber: string
}
