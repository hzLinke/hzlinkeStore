import { createVNode, render } from 'vue';
import type {App} from "vue";
import {PopupMenuDataType} from '@v4x/ui'

import PopupMenuConstructor from './popupMenu.vue'

let PromiseAction: any = null;
let instance: any = null;
const closePopupMenu = (action?: any): any => {
	if (instance&&instance.el && instance.el.parentNode) {
		instance.el.parentNode.parentNode.removeChild(instance.el.parentNode);
        instance = null
	}
    if (PromiseAction) {
        if (PromiseAction.resolve) {
            PromiseAction.resolve(action);
        }
    }
}



const buidPopuMenu: any= function(container: HTMLElement, options: PopupMenuDataType){
    return new Promise((resolve, reject) => {
		PromiseAction={
			resolve: resolve,
			reject: reject
		}
        options.closePopuMenu = closePopupMenu

        //创建虚拟节点
        instance = createVNode(
            PopupMenuConstructor,
            options as any,
        )
        //渲染虚拟节点到document.body
        render(instance,container)

	})
}
const popupMenu = {
    popup:(options: PopupMenuDataType)=>{
        let _top = options.pointXy.top
        let _left = options.pointXy.left
        const container = document.createElement('div')
       // options.pointXy.left = -1000
        const res = buidPopuMenu(container,options)
        document.body.appendChild(container);
        const position = (container.childNodes[0] as HTMLElement).getBoundingClientRect()
        if (_left + position.width > document.documentElement.clientWidth){
            _left = _left - (_left +position.width - document.documentElement.clientWidth) -15
        }
        if (_top +position.height > document.documentElement.clientHeight){
            _top = _top - (_top +position.height - document.documentElement.clientHeight) -15
        }
        options.pointXy.left = _left
        options.pointXy.top = _top
        return res
    }
}

export default {
  //组件注册
  install(app: App): void {
    app.config.globalProperties.$popupMenu = popupMenu
  }
}

export {
    popupMenu
}
