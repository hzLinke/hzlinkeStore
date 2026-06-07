import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, CommondDatasParamType } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'

export interface StockInfBoxInstanceRefs extends InstanceRefsBase {
 
}

export interface StockInfBoxOptions extends ModalOptions {
    productCode: string|number
    qualityGrade: number,
    commonDatas: CommondDatasParamType
}
