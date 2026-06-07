import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinShipperSetComponent from './WinShipperSet.vue'
import type { ShipperSetOptions } from './types'

async function show(options: ShipperSetOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '货商批量设置',
        width: options.width || '70%',
        height: options.height || '80%',
        position: options.position || 'center',
        content: WinShipperSetComponent,
        ...options
    })
    return result
}

export const WinShipperSet = {
    show
}

export type { ShipperSetOptions }
