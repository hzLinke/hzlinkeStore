import {ComponentInternalInstance} from 'vue'
import { getExposed,  } from '@v4x/ui'
import type { ModalExposed, ModalResultValue } from '@v4x/ui'

export const modalActionCancel = (parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue)=>{
    const exposed = getExposed<ModalExposed>(parentInstance || undefined)
    if (exposed) {
        // 完整的类型推断 
        exposed.resultValue.value = value
        exposed.close()
    }
}
export const modalActionAbort = (parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue)=>{
    const exposed = getExposed<ModalExposed>(parentInstance || undefined)
    if (exposed) {
        // 完整的类型推断 
        exposed.resultValue.value = value
        exposed.close()
    }
}
export const modalActionConfirm = (parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue) => {
    const exposed = getExposed<ModalExposed>(parentInstance || undefined)
    if (exposed) {
        // 完整的类型推断 
        exposed.resultValue.value = value
        exposed.close()
    }
}
