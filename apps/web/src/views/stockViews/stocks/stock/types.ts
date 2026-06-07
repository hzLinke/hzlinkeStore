import { TGridAction } from '@/usehook/gridAction'
import type { StockViewsInstanceRefs } from '../../types'
export interface StockInstanceRefs extends StockViewsInstanceRefs {
    router?: any
    gridWaitInAction?: TGridAction
    gridWaitOutAction?: TGridAction
}
