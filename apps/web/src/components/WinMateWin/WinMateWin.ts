import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinMateWinComponent from './WinMateWin.vue'  
import type { MateWinOptions } from './types'

async function show(options: MateWinOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '智能匹配',
        width: options.width || '80%',
        height: options.height || '80%',
        position: options.position || 'right',
        content: WinMateWinComponent,
        ...options
    })
    return result
}

export const WinMateWin = {
    show
}

export type { MateWinOptions }
