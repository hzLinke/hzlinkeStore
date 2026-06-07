import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinMoneyPayResComponent from './WinMoneyPayRes.vue'  
import type { MoneyPayResOptions } from './types'

async function show(options: MoneyPayResOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || (options.type == 'pay' ? '支付' : '收款'),
        width: options.width || 1250,
        height: options.height || 600,
        position: options.position || 'center',
        content: WinMoneyPayResComponent,
        ...options
    })
    return result
}

export const WinMoneyPayRes = {
    show
}

export type { MoneyPayResOptions }
