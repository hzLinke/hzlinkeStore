import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinAccountsMoneyChangeComponent from './WinAccountsMoneyChange.vue'  
import type { AccountsMoneyChangeOptions } from './types'

async function show(options: AccountsMoneyChangeOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '导入窗口',
        width: options.width || '70%',
        height: options.height || '80%',
        position: options.position || 'center',
        content: WinAccountsMoneyChangeComponent,
        ...options
    })  
    return result
}

export const WinAccountsMoneyChange = {
    show
}

export type { AccountsMoneyChangeOptions }
