import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinImportWinComponent from './WinImportWin.vue'  
import type { ImportWinOptions } from './types'

async function show(options: ImportWinOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '导入窗口',
        width: options.width || '90%',
        height: options.height || '80%',    
        position: options.position || 'right',
        content: WinImportWinComponent,
        ...options
    })
    return result
}

export const WinImportWin = {
    show
}

export type { ImportWinOptions }
