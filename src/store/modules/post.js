let VueCookies = require('vue-cookies')
export default({
    namespaced: true,
    state:{
        dataPost: []
    },
    mutations:{
        /*setLastPost(state,payload){
            state.LastPost = payload
        },*/
        setDataPost(state, payload){
            state.dataPost = payload
        }
    },
    getters: {
        LastPost: state =>{
            return state.dataPost[state.dataPost.length - 1]
        },
        LastedPosts: state =>{
            return state.dataPost.slice(-3)
        }

    },
    actions: {
        async all({commit}){
            try{
                //recover token
                let token = VueCookies.get('token')

                const res= await fetch('https://blogtin-back-app.onrender.com/api/blog/posts/all',{
                    method:'GET',
                    headers:{
                        'Content-Type':'application/json;charset=utf-8',
                        'auth-token': token
                    }
                })
                const response = await res.json()                
                commit("setDataPost", response.data.posts)
            }catch(e) {
                console.log(e)
            }
        },
        /*async last(){
            let data = await this.all()
            //console.log(data.data.posts.slice(length - 4, length - 1))
            const post = {
                last: data.data.posts.pop(),
                lastedPost: data.data.posts.slice(length - 4, length - 1)
            }

            return post

        },*/
        async one(id){
            try{
                //recover token
                let token = VueCookies.get('token')

                const res= await fetch(`https://blogtin-back-app.onrender.com/api/blog/posts/one?id=${id}`,{
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
        async oneUser(id){
            try{
                const res = await fetch(`https://blogtin-back-app.onrender.com/api/blog/posts/one/user?id=${id}`, {
                    method:'GET',
                    headers: {
                        "Content-Type": "application/json",
                    }
                })

                const response = await res.json()
                return response

            }catch(e){
                console.log(e)
            }
        }
    }
})
