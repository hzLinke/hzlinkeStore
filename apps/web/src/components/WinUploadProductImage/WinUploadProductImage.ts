import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinUploadProductImageComponent from './WinUploadProductImage.vue'
import type { UploadProductImageOptions } from './types'

async function show(options: UploadProductImageOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '上传产品图片',
        width: options.width || '65%',
        height: options.height || '80%',
        position: options.position || 'right',
        content: WinUploadProductImageComponent,
        ...options
    })
    return result
}

export const WinUploadProductImage = {
    show
} 

export type { UploadProductImageOptions }

