export interface MessageOptions {
    parentInstance?: import('vue').ComponentInternalInstance | null
    messageType?: 'information' | 'warning' | 'error' | 'question'
    showCancel?: boolean
    showAbort?: boolean
    defaultButton?: import('../ModalWin/modal').ModalResultEnum
    confirmText?: string
    cancelText?: string
    abortText?: string
    content?: string
    title?: string
    width?: string
    height?: string
}

export interface ToastOptions {
    content: string
    messageType?: 'success' | 'warning' | 'error'
    position?: 'top' | 'center' | 'bottom'
    duration?: number
}

export interface LoadingOptions {
    moreText?: string
    mask?: boolean
    css?: string
}

export interface MessageBoxType {
    information: (options: MessageOptions) => Promise<any>
    question: (options: MessageOptions) => Promise<any>
    warning: (options: MessageOptions) => Promise<any>
    error: (options: MessageOptions) => Promise<any>
    success: (options: string | ToastOptions) => any
    warningToast: (options: string | ToastOptions) => any
    errorToast: (options: string | ToastOptions) => any
    toast: (options: ToastOptions) => any
    closeAllToasts: () => void
    loading: (options: string | LoadingOptions) => any
    closeAllLoading: () => void
}
