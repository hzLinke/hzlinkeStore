import { createRouter, createMemoryHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        redirect: '/mainWin'
    },{
      path: '/mainWin',
      name: 'MainWin', 
      component: () => import('../views/MainWin.vue'),
      redirect: '/home',
      children:[
          {
              path: '/home',
              name: 'Home',
              component: () => import('../views/Home.vue')
          },
          {
            path: '/saleSplit',
            name: 'saleSplit',
            component: () => import('../views/saleViews/saleSplit/index.vue')
          },{
            path: '/saleReplace',
            name: 'saleReplace',
            component: () => import('../views/saleViews/saleReplace/index.vue')
          },{
            path: '/kProduct',
            name: 'kProduct',
            component: () => import('../views/basicViews/kProduct/index.vue')
          },{
            path: '/saleChange',
            name: 'saleChange',
            component: () => import('../views/saleViews/saleChange/index.vue')
          },{
            path: '/stockSplit',
            name: 'stockSplit',
            component: () => import('../views/stockViews/stockSplit/index.vue')
          },{
            path: '/wxSysParams',
            name: 'wxSysParams',
            component: () => import('../views/systemViews/WxSysParams/index.vue')
          }
      ],
    },
  
]
// History路由 createWebHistory（不带 # 符号，也不隐藏地址栏）
/* createMemoryHistory（现在地址栏只会显示：

http://localhost:3001/

路由路径、子路由和所有查询参数（如 ?rowid=4&level=1... ）都会被隐藏。

注意事项：

- createMemoryHistory 会完全隐藏地址栏信息
- 刷新页面后会回到路由的初始状态（首页）
- 浏览器的前进/后退按钮可能无法正常工作）
*/
//Hash路由 createWebHashHistory（地址栏带 # 符号）
const router = createRouter({
  history: createMemoryHistory(),
  routes
})


export default router
