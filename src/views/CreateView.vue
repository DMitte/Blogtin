<template>
    <div>
        <form @submit.prevent="OnSubmit()" enctype="multipart/form-data">
            <input type="text" v-model="dataForm.title"> <br>
            <input type="file" ref="myInput" name="fileInput"> <br>
            <input type="text" v-model="dataForm.description"> <br>
            <input type="text" v-model="dataForm.tags"> <br>

            <input type="submit">
        </form>
    </div>
</template>
<script>

export default{
    name: "CreateView",
    data(){
        return{
            dataForm: {
                title: '',
                description: '',
                tags: '',                           
            },
            
        }
    },
    methods: {
        async OnSubmit(){
            const formData = new FormData()
            
            formData.append("avatar", this.$refs.myInput.files[0])
            formData.append("title", this.dataForm.title)
            formData.append("description", this.dataForm.description)
            formData.append("tags", this.dataForm.tags)
            console.log(formData.get("avatar"))
            

            const token = this.$cookies.get('token')
            const response = await fetch('http://localhost:3000/api/blog/posts/new', {
                method: 'POST',
                headers:{                                               
                        'auth-token': token
                    },
                body: formData
            })

            console.log(response)
        }
    }
}
</script>
<style scoped>
    
</style>