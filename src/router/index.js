import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import maintenaceView from '../views/Error/maintenaceView.vue'
import errorView from '@/views/Error/404View.vue'
import onearticle from '@/views/OneArticleView.vue'
import SignInView from '@/views/auth/SignInView.vue'
import SignUpView from '@/views/auth/SignUpView.vue'
import CreateView from '@/views/CreateView.vue'
import AllPostView from '@/views/AllPostView.vue'
let VueCookies = require('vue-cookies')

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
  },
  {
    path: '/post/create',
    name: 'create',
    component: CreateView,
    meta: {requireAuth: true},
  },
  {
    path: '/post/all',
    name: 'allPost',
    component: AllPostView
  }

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

/*Redireccionamiento en caso no estar logeado */

router.beforeEach((to, from, next) =>{
  const rutaProtegida = to.matched.some((record) => record.meta.requireAuth);
  if(rutaProtegida && VueCookies.get('token') === null){
    next({name: 'signin'});
  }else{
    next();
  }
})
export default router
