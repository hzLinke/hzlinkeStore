import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, TableRowDataType } from '@v4x/ui'


import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance } from 'vue'
import { LkxInput } from '@v4x/ui'

export interface ProductSelectInstanceRefs extends InstanceRefsBase {
    searchBoxInstance: InstanceType<typeof LkxInput>;
    parentInstance: ComponentInternalInstance | null|undefined;
    modalActionConfirm:(parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue)=>void,
    modalActionCancel:(parentInstance:ComponentInternalInstance | null|undefined,value: ModalResultValue)=>void,
}
/**
 * 产品选择弹窗选项
 * @param billType 订单类型
 * @param customerCode 客户编码
 * @param defaultDatas 默认数据
 */
export interface ProductSelectOptions extends ModalOptions {
    billType?: number| string,
    customerCode?: number|string,
    defaultDatas: TableRowDataType[]
}

