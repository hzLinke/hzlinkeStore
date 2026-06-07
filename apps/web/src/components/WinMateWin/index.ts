import { WinModal } from '@v4x/ui'
import { WinMateWin } from './WinMateWin'
import { MateWinOptions } from './types'

export const show = (options: MateWinOptions) => {
    return WinModal.open({
        component: WinMateWin,
        props: options
    })
}

export { WinMateWin }
export * from './types'
