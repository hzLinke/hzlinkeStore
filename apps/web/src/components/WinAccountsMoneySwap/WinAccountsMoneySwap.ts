import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinAccountsMoneySwapComponent from './WinAccountsMoneySwap.vue'  
import type { AccountsMoneySwapOptions } from './types'

async function show(options: AccountsMoneySwapOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '导入窗口',
        width: options.width || '70%',
        height: options.height || '80%',
        position: options.position || 'center',
        content: WinAccountsMoneySwapComponent,
        ...options
    })
    return result
}

export const WinAccountsMoneySwap = {
    show
}

export type { AccountsMoneySwapOptions }
