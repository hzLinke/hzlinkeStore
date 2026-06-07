import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinChangeQtsComponent from './WinChangeQts.vue'  
import type { ChangeQtsOptions } from './types.ts'

async function show(options: ChangeQtsOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '修改产品参数',
        width: options.width || 400,
        height: options.height || 240,
        position: options.position || 'center',
        content: WinChangeQtsComponent,
        ...options
    })
    return result
}

export const WinChangeQts = {
    show
} 

export type { ChangeQtsOptions }

