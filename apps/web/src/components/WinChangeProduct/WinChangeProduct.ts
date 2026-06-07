import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinChangeProductComponent from './WinChangeProduct.vue'  
import type { ChangeProductOptions } from './types'

async function show(options: ChangeProductOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '修改产品参数',
        width: options.width || 400,
        height: options.height || 200,
        position: options.position || 'right',
        content: WinChangeProductComponent,
        ...options
    })
    return result
}

export const WinChangeProduct = {
    show
} 

export type { ChangeProductOptions }

