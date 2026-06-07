import { Ref } from 'vue'
import type { SaleViewsInstanceRefs } from '../types'
export interface SaleChangeInstanceRefs extends SaleViewsInstanceRefs {
    isBatchMerge: Ref<boolean>
    targetCustomerCode: Ref<number>
}
