import { createRouter, createWebHistory,createWebHashHistory,createMemoryHistory , RouteRecordRaw } from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/login.vue'
import MainWin from '../views/MainWin.vue'
const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'Login',
        component: Login
    },{
      path: '/mainWin',
      name: 'MainWin', 
      component: MainWin,
      children:[
          {
              path: '/home',
              name: 'Home',
              component: Home
          },
          {
            path: '/disAction/index',
            name: 'disAction',
            component: () => import('@/views/disAction/index.vue'),
          }, {
            path: '/saleViews/sale/index',
            name: 'sale',
            component: () => import('@/views/saleViews/sale/index.vue'),
          }
         
      ],
    },
  
]
// History路由 createWebHistory（不带 # 符号，也不隐藏地址栏）createMemoryHistory（隐藏地址栏）
//Hash路由 createWebHashHistory（地址栏带 # 符号）
const router = createRouter({
  history: createMemoryHistory(),// createWebHashHistory(process.env.BASE_URL),//createWebHistory(),
  routes
})


export default router
