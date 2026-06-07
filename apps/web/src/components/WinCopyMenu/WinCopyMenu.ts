import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinCopyMenuComponent from './WinCopyMenu.vue'  
import type { CopyMenuOptions } from './types'

async function show(options: CopyMenuOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '复制窗口',
        width: options.width || '70%',
        height: options.height || '80%',
        position: options.position || 'center',
        content: WinCopyMenuComponent,
        ...options
    })
    return result
}

export const WinCopyMenu = {
    show
}

export type { CopyMenuOptions }
