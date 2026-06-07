import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinChangePwdComponent from './WinChangePwd.vue'  
import type { ChangePwdOptions } from './types'

async function show(options: ChangePwdOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '修改密码窗口',
        width: options.width || 400,
        height: options.height || 280,
        position: options.position || 'center',
        content: WinChangePwdComponent,
        ...options
    })
    return result
}

export const WinChangePwd = {
    show
}

export type { ChangePwdOptions }
