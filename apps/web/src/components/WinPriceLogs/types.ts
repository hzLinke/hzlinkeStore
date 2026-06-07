import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, CommondDatasParamType } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'

export interface PriceLogsInstanceRefs extends InstanceRefsBase {
}

export interface PriceLogsOptions extends ModalOptions {
    customerCode: number
    productCode: string
    saleType: number
}
