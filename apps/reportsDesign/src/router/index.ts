import { createRouter, createWebHistory } from 'vue-router'
import type { RouteRecordRaw } from 'vue-router'

const routes: RouteRecordRaw[] = [
  {
    path: '/',
    name: 'Home',
    component: () => import('@/views/home/index.vue')
  },
  {
    path: '/design',
    name: 'Design',
    component: () => import('@/views/design/index.vue')
  },
  {
    path: '/preview',
    name: 'Preview',
    component: () => import('@/views/preview/index.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
