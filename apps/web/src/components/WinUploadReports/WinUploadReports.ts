import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinUploadReportsComponent from './WinUploadReports.vue'
import type { UploadReportsOptions } from './types'

async function show(options: UploadReportsOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '上传报告图片',
        width: options.width || '65%',
        height: options.height || '80%',
        position: options.position || 'right',
        content: WinUploadReportsComponent,
        ...options
    })
    return result
}

export const WinUploadReports = {
    show
} 

export type { UploadReportsOptions }

