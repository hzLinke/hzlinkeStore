import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createPinia } from 'pinia'
import useAppStore from './stores'

import autoFocus from './directive/autoFocus/autoFocus'


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









