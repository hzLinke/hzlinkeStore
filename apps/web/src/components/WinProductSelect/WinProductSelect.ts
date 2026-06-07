import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinProductSelectComponent from './WinProductSelect.vue'
import type { ProductSelectOptions } from './types'

/**
 * 产品选择弹窗选项
 * @param billType 订单类型
 * @param customerCode 客户编码
 * @param defaultDatas 默认数据
 */
async function show(options: ProductSelectOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '产品选择',
        width: options.width || '70%',
        height: options.height || '80%',
        position: options.position || 'right',
        content: WinProductSelectComponent,
        ...options
    })
    return result
}

export const WinProductSelect = {
    show
} 

export type { ProductSelectOptions }

