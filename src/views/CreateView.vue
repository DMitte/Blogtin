<template>
    <div>
        <form @submit.prevent="OnSubmit()" enctype="multipart/form-data">
            <input type="text" v-model="dataForm.title"> <br>
            <input type="file" ref="myInput" name="fileInput"> <br>
            <textarea name="textarea" rows="10" cols="50" v-model="dataForm.description">Write something here</textarea><br>            
            <input type="text" v-model="dataForm.tags"> <br>

            <input type="submit">
        </form>
    </div>
</template>
<script>
import imageCompression from 'browser-image-compression';
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
            try {
        const compressedFile = await imageCompression(this.$refs.myInput.files[0], {
          maxSizeMB: 1, // Tamaño máximo en MB para la imagen comprimida
          maxWidthOrHeight: 1920, // Ancho o alto máximo para la imagen
          useWebWorker: true // Opcional: usar un worker para el procesamiento
        });

        const formData = new FormData()
            
            formData.append("avatar", compressedFile)
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
        
        console.log('Imagen comprimida lista para ser enviada:', compressedFile);
      } catch (error) {
        console.error('Error al comprimir la imagen:', error);
      }
            
        }
    }
}
</script>
<style scoped>
    
</style>