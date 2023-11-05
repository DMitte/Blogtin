[1mdiff --git a/src/App.vue b/src/App.vue[m
[1mindex 35712d0..3eb6ad2 100644[m
[1m--- a/src/App.vue[m
[1m+++ b/src/App.vue[m
[36m@@ -1,6 +1,31 @@[m
 <template>[m
   <router-view />[m
 </template>[m
[32m+[m[32m<script>[m
[32m+[m[32mimport {mapActions, mapState} from 'vuex'[m
[32m+[m
[32m+[m
[32m+[m[32mexport default{[m
[32m+[m[32m  created(){[m
[32m+[m[32m    this.Login()[m
[32m+[m[32m    if(this.IsLogin){[m
[32m+[m[32m      this.my()[m
[32m+[m[32m    }[m
[32m+[m[32m    this.all()[m
[32m+[m[32m  },[m
[32m+[m[32m  methods:{[m
[32m+[m[32m    ...mapActions(['Login']),[m
[32m+[m[32m    ...mapActions('user',['my']),[m
[32m+[m[32m    ...mapActions('post',['all'])[m
[32m+[m[32m  },[m
[32m+[m[32m  computed: {[m
[32m+[m[32m    ...mapState(['IsLogin'])[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[32m+[m
[32m+[m
[32m+[m[32m</script>[m
[32m+[m
 [m
 <style>[m
 @import url('https://fonts.googleapis.com/css2?family=Exo+2:wght@100;200;300;400;500;600;700;800;900&display=swap');[m
[1mdiff --git a/src/components/articleComponent.vue b/src/components/articleComponent.vue[m
[1mindex 26a2b62..188aac6 100644[m
[1m--- a/src/components/articleComponent.vue[m
[1m+++ b/src/components/articleComponent.vue[m
[36m@@ -2,7 +2,7 @@[m
   <router-link :to="`/onearticle/${infoPost._id}`">[m
     <div class="article" v-bind:class="{ small: isSmall }">[m
       <div class="picture">[m
[31m-        <img :src="infoPost.imgUrl" alt="Jhon wick picture" />[m
[32m+[m[32m        <img :src="infoPost.imgUrl" alt="Jhon wick picture" loading="lazy"/>[m[41m[m
       </div>[m
       <div class="text">[m
         <div class="infoUser">[m
[36m@@ -13,7 +13,7 @@[m
         </div>[m
         <div class="infoArticle">[m
           <h3 id="titleArticle">{{ infoPost.title }}</h3>[m
[31m-          <p id="desArticle">{{ infoPost.description }}</p>[m
[32m+[m[32m          <p id="desArticle" > {{ infoPost.description }}</p>[m[41m[m
         </div>[m
         <div class="infoTags">[m
           <p v-for="(item, index) in infoPost.tags" :key="index">{{ item }}</p>[m
[36m@@ -23,8 +23,9 @@[m
   </router-link>[m
 </template>[m
 <script>[m
[31m-import userModule from "@/store/modules/user";[m
[31m-import postModule from "@/store/modules/post";[m
[32m+[m[41m[m
[32m+[m[32mimport userModule from "@/store/modules/user"[m[41m[m
[32m+[m[41m[m
 export default {[m
   data() {[m
     return {[m
[36m@@ -37,20 +38,11 @@[m [mexport default {[m
     isSmall: Boolean,[m
     DataPost: Object,[m
   },[m
[31m-  async created() {[m
[31m-    if (Object.keys(this.DataPost).length === 0) {[m
[31m-      const last = await postModule.actions.last();[m
[31m-      const idAuthor = last.author[0];[m
[31m-      const dataAuthor = await userModule.actions.one(idAuthor);[m
[31m-[m
[31m-      this.infoAuthor = dataAuthor.data;[m
[31m-[m
[31m-      this.infoPost = last;[m
[31m-    } else {[m
[31m-      const idAuthor = this.DataPost.author[0];[m
[31m-      const dataAuthor = await userModule.actions.one(idAuthor);[m
[31m-      this.infoAuthor = dataAuthor.data;[m
[31m-    }[m
[32m+[m[41m  [m
[32m+[m[32m  async created(){[m[41m[m
[32m+[m[32m    let idUser = this.DataPost.author[0][m[41m    [m
[32m+[m[32m    let dataUser = await userModule.actions.one(idUser)[m[41m [m
[32m+[m[32m    this.infoAuthor = dataUser.data[m[41m    [m
   },[m
 };[m
 </script>[m
[1mdiff --git a/src/store/index.js b/src/store/index.js[m
[1mindex c0a7f7a..b9ea06c 100644[m
[1m--- a/src/store/index.js[m
[1m+++ b/src/store/index.js[m
[36m@@ -1,22 +1,30 @@[m
 import { createStore } from 'vuex'[m
 import auth from "./modules/auth"[m
 import user from "./modules/user"[m
[32m+[m[32mimport post from "./modules/post"[m
[32m+[m[32mlet VueCookies = require('vue-cookies')[m
 [m
 export default createStore({[m
   state: {[m
[31m-    lastPost: {}[m
[32m+[m[32m    IsLogin: false[m
   },[m
   getters: {[m
   },[m
   mutations: {[m
[31m-    setLastPost(state, payload){[m
[31m-      state.lastPost = payload[m
[32m+[m[32m    setIsLogin(state, payload){[m
[32m+[m[32m      state.IsLogin = payload[m
     }[m
   },[m
   actions: {[m
[32m+[m[32m    Login({commit}){[m
[32m+[m[32m      if(VueCookies.get('token')){[m
[32m+[m[32m        commit("setIsLogin", true)[m
[32m+[m[32m      }[m[41m  [m
[32m+[m[32m    }[m
   },[m
   modules: {[m
     auth,[m
[31m-    user[m
[32m+[m[32m    user,[m
[32m+[m[32m    post[m
   }[m
 })[m
[1mdiff --git a/src/store/modules/post.js b/src/store/modules/post.js[m
[1mindex 82d99c6..5da987d 100644[m
[1m--- a/src/store/modules/post.js[m
[1m+++ b/src/store/modules/post.js[m
[36m@@ -2,15 +2,27 @@[m [mlet VueCookies = require('vue-cookies')[m
 export default({[m
     namespaced: true,[m
     state:{[m
[31m-        LastPost: {}[m
[32m+[m[32m        dataPost: [][m[41m[m
     },[m
     mutations:{[m
[31m-        setLastPost(state,payload){[m
[32m+[m[32m        /*setLastPost(state,payload){[m[41m[m
             state.LastPost = payload[m
[32m+[m[32m        },*/[m[41m[m
[32m+[m[32m        setDataPost(state, payload){[m[41m[m
[32m+[m[32m            state.dataPost = payload[m[41m[m
         }[m
     },[m
[32m+[m[32m    getters: {[m[41m[m
[32m+[m[32m        LastPost: state =>{[m[41m[m
[32m+[m[32m            return state.dataPost[state.dataPost.length - 1][m[41m[m
[32m+[m[32m        },[m[41m[m
[32m+[m[32m        LastedPosts: state =>{[m[41m[m
[32m+[m[32m            return state.dataPost.slice(-3)[m[41m[m
[32m+[m[32m        }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    },[m[41m[m
     actions: {[m
[31m-        async all(){[m
[32m+[m[32m        async all({commit}){[m[41m[m
             try{[m
                 //recover token[m
                 let token = VueCookies.get('token')[m
[36m@@ -22,20 +34,23 @@[m [mexport default({[m
                         'auth-token': token[m
                     }[m
                 })[m
[31m-                const response = await res.json()[m
[31m-                [m
[31m-[m
[31m-                return response[m
[32m+[m[32m                const response = await res.json()[m[41m                [m
[32m+[m[32m                commit("setDataPost", response.data.posts)[m[41m[m
             }catch(e) {[m
                 console.log(e)[m
             }[m
         },[m
[31m-        async last(){[m
[32m+[m[32m        /*async last(){[m[41m[m
             let data = await this.all()[m
[32m+[m[32m            //console.log(data.data.posts.slice(length - 4, length - 1))[m[41m[m
[32m+[m[32m            const post = {[m[41m[m
[32m+[m[32m                last: data.data.posts.pop(),[m[41m[m
[32m+[m[32m                lastedPost: data.data.posts.slice(length - 4, length - 1)[m[41m[m
[32m+[m[32m            }[m[41m[m
 [m
[31m-            return data.data.posts.pop()[m
[32m+[m[32m            return post[m[41m[m
 [m
[31m-        },[m
[32m+[m[32m        },*/[m[41m[m
         async one(id){[m
             try{[m
                 //recover token[m
[36m@@ -55,6 +70,22 @@[m [mexport default({[m
             }catch(e) {[m
                 console.log(e)[m
             }[m
[32m+[m[32m        },[m[41m[m
[32m+[m[32m        async oneUser(id){[m[41m[m
[32m+[m[32m            try{[m[41m[m
[32m+[m[32m                const res = await fetch(`http://localhost:3000/api/blog/posts/one/user?id=${id}`, {[m[41m[m
[32m+[m[32m                    method:'GET',[m[41m[m
[32m+[m[32m                    headers: {[m[41m[m
[32m+[m[32m                        "Content-Type": "application/json",[m[41m[m
[32m+[m[32m                    }[m[41m[m
[32m+[m[32m                })[m[41m[m
[32m+[m[41m[m
[32m+[m[32m                const response = await res.json()[m[41m[m
[32m+[m[32m                return response[m[41m[m
[32m+[m[41m[m
[32m+[m[32m            }catch(e){[m[41m[m
[32m+[m[32m                console.log(e)[m[41m[m
[32m+[m[32m            }[m[41m[m
         }[m
     }[m
 })[m
\ No newline at end of file[m
[1mdiff --git a/src/store/modules/user.js b/src/store/modules/user.js[m
[1mindex 9dde67d..99a6175 100644[m
[1m--- a/src/store/modules/user.js[m
[1m+++ b/src/store/modules/user.js[m
[36m@@ -2,9 +2,20 @@[m [mlet VueCookies = require('vue-cookies')[m
 export default({[m
     namespaced: true,[m
     state: {[m
[32m+[m[32m        myUserData: {}[m[41m[m
[32m+[m[32m    },[m[41m[m
[32m+[m[32m    mutations: {[m[41m[m
[32m+[m[32m        setMyData(state, payload){[m[41m[m
[32m+[m[32m            state.myUserData = payload[m[41m[m
[32m+[m[32m        }[m[41m[m
[32m+[m[32m    },[m[41m[m
[32m+[m[32m    getters: {[m[41m[m
[32m+[m[32m        getImgUrlMy: state => {[m[41m[m
[32m+[m[32m            return state.myUserData.imgUrl;[m[41m[m
[32m+[m[32m        }[m[41m[m
     },[m
     actions:{[m
[31m-        async my(){[m
[32m+[m[32m        async my({commit}){[m[41m[m
             try{[m
                 //recover token[m
                 let token = VueCookies.get('token')[m
[36m@@ -17,7 +28,8 @@[m [mexport default({[m
                     }[m
                 })[m
                 const response = await res.json()[m
[31m-                return response[m
[32m+[m[32m                commit("setMyData", response.data)[m[41m[m
[32m+[m[41m                [m
                 [m
             }catch(e){[m
                 console.log(e)[m
[1mdiff --git a/src/views/HomeView.vue b/src/views/HomeView.vue[m
[1mindex 55cd465..a8d4242 100644[m
[1m--- a/src/views/HomeView.vue[m
[1m+++ b/src/views/HomeView.vue[m
[36m@@ -1,6 +1,6 @@[m
 <template>[m
   <div class="home">[m
[31m-    <navbar :img="this.imgUserPath" />[m
[32m+[m[32m    <navbar :img="this.getImgUrlMy" />[m
     <div class="main">[m
       <div class="slogan">[m
         <h1>WELCOME TO BLOGTIN</h1>[m
[36m@@ -10,7 +10,7 @@[m
         </p>[m
       </div>[m
       <section class="lastArticle">[m
[31m-        <articleC :isSmall="false" v-bind:DataPost="lastPost" />[m
[32m+[m[32m       <articleC v-if="this.LastPost" :isSmall="false" :DataPost="this.LastPost" :key="4"/>[m
       </section>[m
 [m
       <section class="bpostArticle">[m
[36m@@ -26,7 +26,7 @@[m
           ></router-link>[m
         </div>[m
         <div class="mainSection">[m
[31m-          <articleC :isSmall="true" v-for="(item, index) in lastedPostes" :key="index" :DataPost="item"/>[m
[32m+[m[32m          <articleC :isSmall="true" v-for="(item, index) in this.LastedPosts" :key="index" :DataPost="item"/>[m
         </div>[m
       </section>[m
 [m
[36m@@ -58,49 +58,26 @@[m
 import navbar from "@/components/navComponent.vue";[m
 import footerC from "@/components/footerComponent.vue";[m
 import articleC from "@/components/articleComponent.vue";[m
[31m-import userModule from "@/store/modules/user";[m
 [m
[31m-import postModule from "@/store/modules/post";[m
[32m+[m[32mimport { mapState, mapGetters } from "vuex";[m
 [m
 //import dbRequest from '@/config/db'[m
 [m
 export default {[m
[31m-  data() {[m
[31m-    return {[m
[31m-      login: false,[m
[31m-      imgUserPath: "",[m
[31m-      lastPost: {},[m
[31m-      lastedPostes: {},[m
[31m-    };[m
[31m-  },[m
   name: "HomeView",[m
   components: {[m
     navbar,[m
     footerC,[m
     articleC,[m
   },[m
[32m+[m[41m  [m
[32m+[m[32m  computed: {[m
[32m+[m[32m    ...mapGetters('user', ['getImgUrlMy']),[m
[32m+[m[32m    ...mapGetters('post', ['LastPost','LastedPosts']),[m
[32m+[m[32m    ...mapState(['IsLogin']),[m
[32m+[m[32m    ...mapState('user', ['myUserData']),[m
 [m
[31m-  async created() {[m
[31m-    //poner para que se ejecute solo cuando este la cookie con el token[m
[31m-    userModule.actions.my().then((r) => {[m
[31m-      this.imgUserPath = r.data.imgUrl;[m
[31m-    });[m
[31m-    const last = await postModule.actions.last();[m
[31m-[m
[31m-    const dataAuthor = await userModule.actions.one(last.author[0]);[m
[31m-    last.author = dataAuthor.data;[m
[31m-[m
[31m-    this.lastPost = last;[m
[31m-    [m
[31m-    postModule.actions.all().then((r) =>{[m
[31m-      this.lastedPostes = r.data.posts.slice(length - 4, length - 1)      [m
[31m-    })[m
[31m-[m
[31m-    if (this.$cookies.isKey("token") === true) {[m
[31m-      this.login = true;[m
[31m-    }[m
[31m-  },[m
[31m-  async mounted() {},[m
[32m+[m[32m  }[m
 };[m
 </script>[m
 [m
[1mdiff --git a/src/views/OneArticleView.vue b/src/views/OneArticleView.vue[m
[1mindex 3bfddba..b44d5ac 100644[m
[1m--- a/src/views/OneArticleView.vue[m
[1m+++ b/src/views/OneArticleView.vue[m
[36m@@ -1,6 +1,6 @@[m
 <template>[m
   <div>[m
[31m-    <navbarc :img="this.imgUserPath" />[m
[32m+[m[32m    <navbarc :img="this.getImgUrlMy" />[m[41m[m
 [m
     <div class="main">[m
       <div class="top">[m
[36m@@ -47,8 +47,8 @@[m
 <script>[m
 import navbarc from "@/components/navComponent.vue";[m
 import footerc from "@/components/footerComponent.vue";[m
[31m-import userModule from "@/store/modules/user";[m
 import postModule from "@/store/modules/post";[m
[32m+[m[32mimport { mapState, mapGetters } from "vuex";[m[41m[m
 export default {[m
   data() {[m
     return {[m
[36m@@ -78,18 +78,19 @@[m [mexport default {[m
     },[m
   },[m
   created() {    [m
[31m-    userModule.actions.my().then((r) => {[m
[31m-      this.imgUserPath = r.data.imgUrl;[m
[31m-    });[m
[32m+[m[41m[m
[32m+[m[41m    [m
     postModule.actions.one(this.$route.params.id).then(async (r) => {[m
[31m-      const authorData = await userModule.actions.one(r.data.post.author[0])[m
[32m+[m[32m      const authorData = await postModule.actions.oneUser(r.data.post.author[0])[m[41m[m
       this.authorPost = authorData.data[m
 [m
       this.dataPost = r.data.post;[m
     });[m
[31m-[m
[31m-    [m
   },[m
[32m+[m[32m  computed: {[m[41m[m
[32m+[m[32m    ...mapGetters('user', ['getImgUrlMy']),[m[41m[m
[32m+[m[32m    ...mapState(['IsLogin'])[m[41m[m
[32m+[m[32m  }[m[41m[m
 [m
   [m
 };[m
[1mdiff --git a/src/views/auth/SignUpView.vue b/src/views/auth/SignUpView.vue[m
[1mindex 26c7968..4990d95 100644[m
[1m--- a/src/views/auth/SignUpView.vue[m
[1m+++ b/src/views/auth/SignUpView.vue[m
[36m@@ -64,12 +64,7 @@[m [mexport default {[m
             usuario: {[m
                 email: '',[m
                 password: '',[m
[31m-                repeat_password: '',[m
[31m-                name: 'Prueba',[m
[31m-                lastname: 'Prueba',[m
[31m-                img: 'defaultImg.jpg',[m
[31m-                birthday: '1999/01/03',[m
[31m-                username: 'prueba1',[m
[32m+[m[32m                repeat_password: '',[m[41m                [m
             },[m
             emailError: false[m
         }[m
