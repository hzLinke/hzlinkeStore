import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createPinia } from 'pinia'
import useAppStore from './stores'

import autoFocus from './directive/autoFocus/autoFocus'


// 检测页面是否是通过刷新加载的，如果是则跳转到指定地址
/*const navigationType = window.performance?.navigation?.type || window.performance?.getEntriesByType?.('navigation')?.[0]?.type
if (navigationType === 1 || navigationType === 'reload') {
    window.location.href = 'http://localhost:3000'
}
*/
const app = createApp(App)
const pinia = createPinia()

app.use(pinia)
.use(router)
.use(autoFocus)
.mount('#app')

// 初始化 app store
const appStore = useAppStore()

// 设置全局属性（用于向后兼容）
app.config.globalProperties.$onLineUserList = appStore.onLineUserList;
app.config.globalProperties.$loginLog = appStore.loginLog;
app.config.globalProperties.$socket = appStore.socket;
app.config.globalProperties.$commonDatas = appStore.commonDatas;









