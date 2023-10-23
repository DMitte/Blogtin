import { createStore } from 'vuex'
import auth from "./modules/auth"
import user from "./modules/user"

export default createStore({
  state: {
    lastPost: {}
  },
  getters: {
  },
  mutations: {
    setLastPost(state, payload){
      state.lastPost = payload
    }
  },
  actions: {
  },
  modules: {
    auth,
    user
  }
})
