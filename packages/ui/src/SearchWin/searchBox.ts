import { WinModal, type ModalResultValue } from '../ModalWin'
import SearchBoxComponent from './SearchBox.vue'
import type { SearchBoxOptions } from './options'

async function show(options: SearchBoxOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '万能查询器',
        width: options.width || 400,
        height: options.height || 400,
        content: SearchBoxComponent,
        ...options
    })
    return result
}

export const SearchBox = {
    show
}

export type { SearchBoxOptions } from './options'
export type { SearchBoxFieldItem } from './types'
