let VueCookies = require('vue-cookies')
export default({
    namespaced: true,
    state: {
        myUserData: {}
    },
    mutations: {
        setMyData(state, payload){
            state.myUserData = payload
        }
    },
    getters: {
        getImgUrlMy: state => {
            return state.myUserData.imgUrl;
        }
    },
    actions:{
        async my({commit}){
            try{
                //recover token
                let token = VueCookies.get('token')
                
                const res = await fetch('https://blogtin-back-app.onrender.com/api/blog/users/my', {
                    method:'GET',
                    headers : {
                        "Content-Type": "application/json",
                        "auth-token": token
                    }
                })
                const response = await res.json()
                commit("setMyData", response.data)
                
                
            }catch(e){
                console.log(e)
            }
        },

        async one(id){
            try{                
                let token = VueCookies.get('token')
                const res = await fetch(`https://blogtin-back-app.onrender.com/api/blog/users/one?id=${id}`,{
                    method:"GET",
                    headers : {
                        "Content-Type": "application/json",
                        "auth-token": token
                    },                    
                    
                })

                const response = await res.json()
                return response
            }catch(e){
                console.log(e)
            }
        }
    }

})
