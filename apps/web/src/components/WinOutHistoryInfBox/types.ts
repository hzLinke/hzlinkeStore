import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, CommondDatasParamType } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'

export interface OutHistoryInfBoxInstanceRefs extends InstanceRefsBase {
}

export interface OutHistoryInfBoxOptions extends ModalOptions {
    productCode: string| number,
    qualityGrade: number,
    commonDatas: CommondDatasParamType
}

