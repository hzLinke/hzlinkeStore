import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinAccountsInitComponent from './WinAccountsInit.vue'  
import type { AccountsInitOptions } from './types'

async function show(options: AccountsInitOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '导入窗口',
        width: options.width || '70%',
        height: options.height || '80%',
        position: options.position || 'center',
        content: WinAccountsInitComponent,
        ...options
    })
    return result
}

export const WinAccountsInit = {
    show
}

export type { AccountsInitOptions }
