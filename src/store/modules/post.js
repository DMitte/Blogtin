let VueCookies = require('vue-cookies')
export default({
    namespaced: true,
    state:{
        LastPost: {}
    },
    mutations:{
        setLastPost(state,payload){
            state.LastPost = payload
        }
    },
    actions: {
        async all(){
            try{
                //recover token
                let token = VueCookies.get('token')

                const res= await fetch('http://localhost:3000/api/blog/posts/all',{
                    method:'GET',
                    headers:{
                        'Content-Type':'application/json;charset=utf-8',
                        'auth-token': token
                    }
                })
                const response = await res.json()
                

                return response
            }catch(e) {
                console.log(e)
            }
        },
        async last(){
            let data = await this.all()

            return data.data.posts.pop()

        },
        async one(id){
            try{
                //recover token
                let token = VueCookies.get('token')

                const res= await fetch(`http://localhost:3000/api/blog/posts/one?id=${id}`,{
                    method:'GET',
                    headers:{
                        'Content-Type':'application/json;charset=utf-8',
                        'auth-token': token
                    }
                })
                const response = await res.json()
                

                return response
            }catch(e) {
                console.log(e)
            }
        }
    }
})