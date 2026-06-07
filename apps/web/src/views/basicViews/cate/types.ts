import type { Ref } from 'vue'
import type { InstanceRefsBase } from '@/views/types'

export interface AreaInstanceRefs extends InstanceRefsBase {
    headerData: Ref<any>
    detailVisabled: Ref<boolean>
}
