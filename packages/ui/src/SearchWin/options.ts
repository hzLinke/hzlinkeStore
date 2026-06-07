import { SearchBoxFieldItem } from './types'

import { ModalResultEnum } from '../ModalWin'

export interface SearchBoxOptions {
    title?: string
    width?: string
    height?: string
    fields?: SearchBoxFieldItem[]
    defaultButton?: ModalResultEnum;
}
