let VueCookies = require('vue-cookies')
export default({
    namespaced: true,
    state: {
    },
    actions:{
        async my(){
            try{
                //recover token
                let token = VueCookies.get('token')
                
                const res = await fetch('http://localhost:3000/api/blog/users/my', {
                    method:'GET',
                    headers : {
                        "Content-Type": "application/json",
                        "auth-token": token
                    }
                })
                const response = await res.json()
                return response
                
            }catch(e){
                console.log(e)
            }
        },

        async one(id){
            try{                
                let token = VueCookies.get('token')
                const res = await fetch(`http://localhost:3000/api/blog/users/one?id=${id}`,{
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