import type { Ref } from 'vue'
import type { InstanceRefsBase } from '@/views/types'
import { TableRowDataType } from '@v4x/ui'

export interface PostInstanceRefs extends InstanceRefsBase {
    powerTreeDatas: Ref<any>,
}
