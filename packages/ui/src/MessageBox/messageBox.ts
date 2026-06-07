import { type ComponentInternalInstance, h, render } from 'vue';
import { ModalResultEnum, WinModal, type ModalOptions } from '../ModalWin'

import MessageConstructor from './messageBox/messageBox.vue'
import ToastConstructor from './toast/toast.vue'
import LoadingConstructor from './loading/loading.vue'

// 实例类型定义
interface Instance {
  container: HTMLElement;
  vNode: ReturnType<typeof h>;
  close: () => void;
}

// 实例管理
const instances = {
  loading: [] as Instance[],
  toast: [] as Instance[]
};

// 消息框选项接口
export interface MessageOptions extends ModalOptions {
  parentInstance?: ComponentInternalInstance | null;
  messageType?: 'information' | 'warning' | 'error' | 'question';
  showCancel?: boolean;
  showAbort?: boolean;
  confirmText?: string;
  cancelText?: string;
  abortText?: string;
  defaultButton?: ModalResultEnum;
}

// Toast 选项接口
export interface ToastOptions {
  content: string;
  messageType?: 'success' | 'warning' | 'error';
  position?: 'top' | 'center' | 'bottom';
  duration?: number; // 显示时长，默认 3000ms
}

// Loading 选项接口
export interface LoadingOptions {
  moreText?: string; // 加载文本
  mask?: boolean; // 是否显示遮罩层
  css?: string; // 自定义样式
}

// 创建容器的通用方法
const createContainer = (): HTMLElement => {
  const container = document.createElement('div');
  document.body.appendChild(container);
  return container;
};

// 关闭实例的通用方法
const closeInstance = (instance: Instance, instanceType: 'loading' | 'toast'): void => {
  if (!instance || !instance.container) return;
  
  try {
    render(null, instance.container);
    if (instance.container.parentNode) {
      instance.container.parentNode.removeChild(instance.container);
    }
    
    // 从实例列表中移除
    const index = instances[instanceType].indexOf(instance);
    if (index > -1) {
      instances[instanceType].splice(index, 1);
    }
  } catch (error) {
    console.error(`Error closing ${instanceType} instance:`, error);
  }
};

// 关闭所有实例的通用方法
const closeAllInstances = (instanceType: 'loading' | 'toast'): void => {
  while (instances[instanceType].length > 0) {
    closeInstance(instances[instanceType][0], instanceType);
  }
};

// 通用的消息框创建方法
const createMessageBox = (options: MessageOptions, messageType: 'information' | 'warning' | 'error' | 'question') => {
  const msg = options.content as string;
  const content = h(MessageConstructor, { ...options, content: msg, messageType });
  return WinModal.open({ ...options, defaultButton: options.defaultButton||ModalResultEnum.mrConfirm, content, keepExisting: true });
};

// 创建 Toast 方法
const createToast = (options: ToastOptions): Instance => {
  const {
    content,
    messageType = 'success',
    position = 'center',
    duration = 2000
  } = options;

  // 创建容器
  const container = createContainer();

  // 创建 Toast 组件
  const toastVNode = h(ToastConstructor, {
    content,
    messageType,
    position,
    duration
  });

  // 渲染 Toast
  render(toastVNode, container);

  // 存储实例
  const toastInstance: Instance = {
    container,
    vNode: toastVNode,
    close: () => closeInstance(toastInstance, 'toast')
  };
  instances.toast.push(toastInstance);

  // 定时关闭
  setTimeout(() => {
    closeInstance(toastInstance, 'toast');
  }, duration);

  return toastInstance;
};

// 创建 Loading 方法
const createLoading = (options: LoadingOptions): Instance => {
  const {
    moreText = '加载中...',
    mask = false,
    css = ''
  } = options;

  // 创建容器
  const container = createContainer();

  // 创建 Loading 组件
  const loadingVNode = h(LoadingConstructor, {
    moreText,
    mask,
    css
  });

  // 渲染 Loading
  render(loadingVNode, container);

  // 存储实例
  const loadingInstance: Instance = {
    container,
    vNode: loadingVNode,
    close: () => closeInstance(loadingInstance, 'loading')
  };
  instances.loading.push(loadingInstance);

  return loadingInstance;
};

// 导出消息框方法
export const MessageBox = {
  // 消息框方法
  information: (options: MessageOptions) => {
    return createMessageBox(options, 'information');
  },
  question: (options: MessageOptions) => {
    return createMessageBox({...options,showCancel: true}, 'question');
  },
  warning: (options: MessageOptions) => {
    return createMessageBox(options, 'warning');
  },
  error: (options: MessageOptions) => {
    return createMessageBox(options, 'error');
  },

  // Toast 方法
  success: (options: string | ToastOptions) => {
    const opts = typeof options === 'string' ? { content: options } : options;
    return createToast({ ...opts, messageType: 'success' });
  },
  warningToast: (options: string | ToastOptions) => {
    const opts = typeof options === 'string' ? { content: options } : options;
    return createToast({ ...opts, messageType: 'warning' });
  },
  errorToast: (options: string | ToastOptions) => {
    const opts = typeof options === 'string' ? { content: options } : options;
    return createToast({ ...opts, messageType: 'error' });
  },
  // 通用 toast 方法
  toast: (options: ToastOptions) => {
    return createToast(options);
  },
  // 关闭所有 Toast
  closeAllToasts: () => {
    return closeAllInstances('toast');
  },

  // Loading 方法
  loading: (options: string | LoadingOptions) => {
    const opts = typeof options === 'string' ? { moreText: options } : options;
    return createLoading(opts);
  },
  // 关闭所有 Loading
  closeAllLoading: () => {
    return closeAllInstances('loading');
  }
};

export default MessageBox
