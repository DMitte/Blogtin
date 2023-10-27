import router from '@/router'
let VueCookies = require('vue-cookies')

export default{
    namespaced:true,
    state:{
        token: null
    },
    mutations:{
        setToken(state, payload){
            state.token = payload;
        }
    },
    actions: {
        async register(usuario){
            try{
                const res = await fetch('http://localhost:3000/api/blog/auth/register',{
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(usuario),
                })
                const response = await res.json();
                return response
                
            }catch(e){
                console.log(e);
            }
        },
        async login({commit}, usuario){

            try{    
                const res = await fetch("http://localhost:3000/api/blog/auth/login", {
                    method:"post",
                    headers:{"Content-type":"application/json"},
                    body:JSON.stringify(usuario)
                })
                const response = await res.json();
                commit("setToken", response.token)
                VueCookies.set('token',response.token, "1d")
                router.push("/")
            }catch(e){
                console.error(e)
            }
        },
        obtenerToken({commit}) {
            if(VueCookies.isKey("auth-token") === true){
                commit("setToken", VueCookies.get("auth-token"));
            }else{
                commit("setToken", null)
            }
        }

    }
}