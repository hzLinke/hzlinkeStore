import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, CommondDatasParamType } from '@v4x/ui'

import type { InstanceRefsBase } from '@/views/types'
import { ComponentInternalInstance, Ref } from 'vue'
import { TGridAction } from '@/usehook/gridAction'
import { TDataSource } from '@/usehook/dataSource'

export interface MoneyPayResInstanceRefs extends InstanceRefsBase {
    headerData: Ref<any>
    gridAction?: TGridAction<MoneyPayResInstanceRefs>
    gridMoneyListAction?: TGridAction<MoneyPayResInstanceRefs>
    gridDetailListAction?: TGridAction<MoneyPayResInstanceRefs>
    detailListDataSource?: TDataSource
}

export interface MoneyPayResOptions extends ModalOptions {
    type: 'pay' | 'res'
    companyCode: number | string
    curBillNumber: string
    condition: string
    look: boolean
    commonDatas: CommondDatasParamType
}
