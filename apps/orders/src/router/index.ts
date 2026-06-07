import { createRouter, createWebHistory,createWebHashHistory,createMemoryHistory , RouteRecordRaw } from 'vue-router'
import Login from '../views/login.vue'
const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'Login',
        component: Login
    }
 
]
// History路由 createWebHistory（不带 # 符号，也不隐藏地址栏）createMemoryHistory（隐藏地址栏）
//Hash路由 createWebHashHistory（地址栏带 # 符号）
const router = createRouter({
  history: createMemoryHistory(),// createWebHashHistory(process.env.BASE_URL),//createWebHistory(),
  routes
})


export default router
