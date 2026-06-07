import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinPrintStyleSetComponent from './WinPrintStyleSet.vue'
import type { WinPrintStyleSetOptions } from './types'

async function show(options: WinPrintStyleSetOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '打印格式设置',
        width: options.width || 800,
        height: options.height || 400,
        position: options.position || 'center',
        content: WinPrintStyleSetComponent,
        ...options
    })
    return result
}

export const WinPrintStyleSet = {
    show
}

export type { WinPrintStyleSetOptions }
