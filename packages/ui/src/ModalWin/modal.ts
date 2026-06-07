import { createVNode, render } from 'vue'
import Modal from './Modal.vue'
import { ModalResultEnum, type ModalResultValue, type ModalOptions } from './types'

export { ModalResultEnum }
export type { ModalResultValue, ModalOptions }

interface ModalInstance {
  promiseAction: {
    resolve: (value: ModalResultValue) => void;
    reject: (reason?: any) => void;
  };
  instance: any;
  container: HTMLDivElement;
  closeTimeoutId: ReturnType<typeof setTimeout> | null;
}

const modalStack: ModalInstance[] = [];

const closeModal = (action: ModalResultValue): any => {
  const current = modalStack[modalStack.length - 1];
  if (!current) return;
  
  if (current.promiseAction) {
    current.promiseAction.resolve(action);
  }
  
  if (current.instance && current.container) {
    if (current.instance.component?.props) {
      current.instance.component.props.visible = false;
    }
    
    current.closeTimeoutId = setTimeout(() => {
      const idx = modalStack.indexOf(current);
      if (idx > -1) {
        modalStack.splice(idx, 1);
      }
      
      if (current.instance && current.container) {
        render(null, current.container);
        if (current.container.parentNode) {
          current.container.parentNode.removeChild(current.container);
        }
      }
    }, 100);
  }
}

const closeExistingModal = () => {
  const current = modalStack[modalStack.length - 1];
  if (!current) return;
  
  if (current.closeTimeoutId) {
    clearTimeout(current.closeTimeoutId);
    current.closeTimeoutId = null;
  }
  
  if (current.instance && current.container) {
    if (current.promiseAction) {
      current.promiseAction.resolve({ action: ModalResultEnum.mrCancel, data: null });
    }
    render(null, current.container);
    if (current.container.parentNode) {
      current.container.parentNode.removeChild(current.container);
    }
    
    const idx = modalStack.indexOf(current);
    if (idx > -1) {
      modalStack.splice(idx, 1);
    }
  }
}

function createModal(options: ModalOptions):Promise<ModalResultValue> {
  return new Promise<ModalResultValue>((resolve, reject) => {
    if (!options.keepExisting) {
      closeExistingModal();
    }
    
    // 强制移除当前焦点元素，确保 Modal 能获得焦点
    /*if (document.activeElement && document.activeElement !== document.body) {
      (document.activeElement as HTMLElement).blur()
    }*/
    
    const container = document.createElement('div')
    const modalInstance: ModalInstance = {
      promiseAction: {
        resolve: resolve,
        reject: reject
      },
      instance: null,
      container: container,
      closeTimeoutId: null
    };
    
    options.closeModal = closeModal;
    
    const modalOptions = {
      ...options,
      visible: false
    };
    
    modalInstance.instance = createVNode(
      Modal,
      modalOptions as any,
    )
    
    modalStack.push(modalInstance);
    
    render(modalInstance.instance, container)
    document.body.appendChild(container);
    
    setTimeout(() => {
      if (modalInstance.instance?.component?.props) {
        modalInstance.instance.component.props.visible = true;
      }
    }, 0);
  })
}

function open(options: ModalOptions): Promise<ModalResultValue> {
  return createModal({
    ...options,
    title: options.title || '提示',
    width: options.width || 400,
    position: options.position || 'center',
    defaultButton: options.defaultButton || ModalResultEnum.mrCancel,
    closeOnClickMask: false,
    visible: true,
  })
}

export const WinModal = {
  open: open
}

export default WinModal
