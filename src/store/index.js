import { createStore } from 'vuex'
import auth from "./modules/auth"
import user from "./modules/user"
import post from "./modules/post"
let VueCookies = require('vue-cookies')

export default createStore({
  state: {
    IsLogin: false
  },
  getters: {
  },
  mutations: {
    setIsLogin(state, payload){
      state.IsLogin = payload
    }
  },
  actions: {
    Login({commit}){
      if(VueCookies.get('token')){
        commit("setIsLogin", true)
      }  
    }
  },
  modules: {
    auth,
    user,
    post
  }
})
