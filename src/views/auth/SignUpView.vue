<template>
    <div id="signin">
        <div id="left">
            <h1>Welcome to <span>Blogtin</span></h1>
            <p>Created to account</p>
            <form @submit.prevent="onSubmit(usuario)">
                <div class="inputs">
                    <div class="input">
                        <label for="email">E-mail</label>
                        <div class="input-wrapper">
                            <input v-model="usuario.email" type="email" name="email">
                            <img class="input-icon" src="../../assets/icons/arroba.svg" alt="Arroba icon">
                        </div>

                    </div>

                    <div class="input">
                        <label for="password">Password</label>
                        <div class="input-wrapper">
                            <input v-model="usuario.password" type="password" name="password">
                            <img class="input-icon password" src="../../assets/icons/eyeoff.svg" alt="Eye icon off">
                        </div>

                    </div>

                    <div class="input">
                        <label for="confirm-password">Confirm Password</label>
                        <div class="input-wrapper">
                            <input v-model="usuario.repeat_password" type="password" name="confirm-password">
                            <img class="input-icon password" src="../../assets/icons/eyeoff.svg" alt="Eye icon off">
                        </div>

                    </div>
                </div>
                <div class="complements">
                    <div class="remenber">

                        <label class="checkbox">
                            <input type="checkbox" name="checkbox">
                            <span class="checkmark"></span>
                            Remenber for 30 days</label>
                    </div>
                    <router-link to="/">Forgot Password</router-link>
                </div>
                <button type="submit" class="btnSubmit">Create an account</button>
            </form>
            <router-link id="singup" to="/auth/signin"> You have an account? <span>Sign in</span></router-link>
        </div>
        <div id="right">
            <div class="text">
                <h3>Designed for you</h3>
                <p>So you can publish, read and express yourself with total freedom 😉</p>
            </div>
            <img src="../../assets/img/image1.png" alt="Img 1">
        </div>
    </div>
</template>
<script>
import authModule from '../../store/modules/auth'

export default {
    data(){
        return{
            usuario: {
                email: '',
                password: '',
                repeat_password: '',
                name: 'Prueba',
                lastname: 'Prueba',
                img: 'defaultImg.jpg',
                birthday: '1999/01/03',
                username: 'prueba1',
            },
            emailError: false
        }
    },
    name: 'SignUpView',
    created(){
        if(this.$cookies.isKey("token") === true){
            this.$router.push('/');
        }
    },
    methods: {
        async onSubmit(usuario){
            const res = await authModule.actions.register(usuario);            
            if(res.message.includes("successfully")){
                this.$router.push({name:'signin'});
            }else{
                alert(res.message)
            }
            
        }
    },
    modules:{
        authModule
    }

}
</script>
<style scoped>
#signin {
    display: flex;
}

/*Left style*/
#left {
    background-color: #020202;
    width: 50%;
    color: white;
    display: flex;
    flex-direction: column;
    padding: 20px 50px;
}

#left h1 {
    font-weight: bold;
    font-size: 48px;
}

#left h1 span {
    color: #A4031F;
}

#left p {
    color: #7C7C7C;
    font-weight: 500;
    margin-top: 10px;
}

form {
    margin-top: 30px;
}

#left .inputs {
    display: flex;
    flex-direction: column;
    gap: 25px;
}

#left .input {
    display: flex;
    flex-direction: column;
}

#left .input label {
    color: #7C7C7C;
    font-weight: 500;

}

#left .input-wrapper {
    position: relative;
    width: 100%;
}

#left .input-wrapper input {
    box-sizing: border-box;
    color: white;
    padding: 15px;
    width: 100%;
    background-color: transparent;
    border: none;
    border-bottom: 1px solid #E9E9E9;
}

#left .input-wrapper input:focus {
    border: none;
    outline: none;
    border-bottom: 1px solid #A4031F;
}

.input-icon {
    color: #191919;
    position: absolute;
    width: 20px;
    height: 20px;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
}

.complements {
    display: flex;
    justify-content: right;
    margin-top: 20px;
}

.complements a {
    position: relative;
    right: 0;
    left: 0;
    color: #A4031F;
    font-weight: 700;
    text-decoration: none;
    font-size: 18px;
}

/*----------- Checkbox style ----------- */
.remenber {
    position: absolute;
    left: 50px;
}

.checkbox {
    padding-left: 12px;
    color: #7C7C7C;
    font-size: 18px;
    font-weight: 700;
}

.checkbox input {

    opacity: 0;
    cursor: pointer;
}

.checkbox .checkmark {
    position: absolute;
    top: -1px;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #353535;
    border-radius: 5px;
}

.checkbox:hover input~.checkmark {
    border: 2px solid #A4031F;
}

.checkbox input:checked~.checkmark {
    background-color: #353535;
    border: none;
}

.checkmark::after {
    content: "";
    position: absolute;
    display: none;
}

.checkbox input:checked~.checkmark::after {
    display: block;
}

.checkbox input:checked {
    border: 1px solid #A4031F;
}

.checkbox .checkmark::after {
    left: 5px;
    top: 5px;
    width: 10px;
    height: 10px;
    border: solid #A4031F;
    border-radius: 3px;
    background-color: #A4031F;
}

/*----------- Btn Style ----------*/
.btnSubmit {
    margin-top: 35px;
    width: 100%;
    height: 50px;
    background-color: #A4031F;
    border: none;
    color: #E9E9E9;
    font-size: 16px;
    border-radius: 10px;
    cursor: pointer;
}

#singup {
    margin-top: 30px;
    text-decoration: none;
    color: #E9E9E9;
    font-weight: 600;
}

#singup span {
    color: #A4031F;
}

/*Right style*/
#right {
    height: 100vh;
    overflow: hidden;
    background-image: url('../../assets/img/bg-auth.png');
    background-position: 60% 30%;
    position: relative;
}

#right .text {
    color: white;
    position: absolute;
    top: 50px;
    left: 50px;
}

#right .text h3 {
    font-size: 30px;
    font-weight: 700;
    margin-bottom: 10px;
}

#right .text p {
    font-size: 18px;
    max-width: 300px;

}

@media screen and (max-width: 767px) {
    #left {
        width: 100%;
        height: 100vh;
        justify-content: center;
        padding: 0px 30px;
    }

    #left h1 {
        font-weight: bold;
        font-size: 35px;
    }

    #left p {
        margin-bottom: 50px;
    }

    #left .inputs {
        margin-bottom: 50px;
    }

    .input-icon {
        width: 20px;
        height: 20px;
    }

    .checkbox .checkmark {
        height: 20px;
        width: 20px;
    }

    .checkbox {
        padding-left: 12px;
        font-size: 14px;
        font-weight: 700;
    }


    .remenber {
        left: 30px;
    }

    .complements a {
        font-size: 15px;
    }

    #right {
        display: none;
    }

    .checkbox .checkmark::after {
        width: 5px;
        height: 5px;
    }
}
</style>