import { type VNode, type Component } from 'vue'

export enum ModalResultEnum {
    mrConfirm = 'mrConfirm',
    mrCancel = 'mrCancel',
    mrAbort = 'mrAbort',
    mrClose = 'mrClose'
}

export type ModalResultValue = { action: ModalResultEnum, data: any }

/**
 * 弹窗选项
 * @param visible 是否显示
 * @param title 根题
 * @param width 宽度
 * @param height 高度
 * @param position 位置
 * @param content 内容
 * @param defaultButton 默认按钮
 * @param closeOnClickMask 点击遮罩层是否关闭弹窗
 * @param closeModal 关闭弹窗回调
 * @param keepExisting 是否保留现有弹窗（不关闭其他弹窗）
 */
export interface ModalOptions {
    visible?: boolean
    title?: string
    width?: number|string
    height?: number|string
    position?: 'left' | 'center' | 'right'
    content?: string | VNode | Component
    defaultButton?: ModalResultEnum;
    closeOnClickMask?: boolean
    closeModal?: (modalValue: ModalResultValue, value?: any) => void
    keepExisting?: boolean
    [key: string]: any
}

export interface ModalExposed {
    close: () => void
    resultValue: { value: ModalResultValue }
}
