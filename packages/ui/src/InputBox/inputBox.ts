import { WinModal, ModalResultEnum, type ModalResultValue } from '../ModalWin'
import InputBoxComponent from './InputBox.vue'
import type { InputBoxOptions, } from './types'

async function show(options: InputBoxOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '输入',
        width: options.width || 400,
        height: options.height,
        showCancel: true,
        content: InputBoxComponent,
        ...options
    })
    return result
}

export const InputBox = {
    show
}

export type { InputBoxOptions } from './types'    
