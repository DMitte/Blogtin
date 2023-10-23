import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import maintenaceView from '../views/Error/maintenaceView.vue'
import errorView from '@/views/Error/404View.vue'
import onearticle from '@/views/OneArticleView.vue'
import SignInView from '@/views/auth/SignInView.vue'
import SignUpView from '@/views/auth/SignUpView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/onearticle/:id',
    name: 'onearticle',
    component: onearticle
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/auth/signin',
    name: 'signin',
    component: SignInView
  },
  {
    path: '/auth/signup',
    name: 'signup',
    component: SignUpView
  },
  {
    path: '/merror',
    name: 'merror',
    component: maintenaceView
  },
  {
    path: '/404',
    name: '404error',
    component: errorView
  }

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
