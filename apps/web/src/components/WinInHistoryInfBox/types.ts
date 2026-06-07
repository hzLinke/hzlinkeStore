import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, CommondDatasParamType } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'

export interface InHistoryInfBoxInstanceRefs extends InstanceRefsBase {
    modalInstance: any;
    parentInstance: ComponentInternalInstance | null | undefined;
}

export interface InHistoryInfBoxOptions extends ModalOptions {
    productCode: string| number,
    qualityGrade: number,
    commonDatas: CommondDatasParamType
}
