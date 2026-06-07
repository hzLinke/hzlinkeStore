import { TGridAction } from '@/usehook/gridAction'
import type { InstanceRefsBase } from '@/views/types'
import { Ref } from 'vue'
export interface ProductInstanceRefs extends InstanceRefsBase {
    headerGridAction?: TGridAction
    headerDisabled?: Ref<boolean>
    detailDataSource?: any
    userCode?: number
}
