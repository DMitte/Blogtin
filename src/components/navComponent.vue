<template>
    <div id="navbar">
        <div class="navegation">
            <div class="logo">
                <img src="@/assets/Logo.svg" alt="Logo blogtin">
            </div>
            <button class="menubtn" @click="isActive = !isActive"><img src="@/assets/icons/menu1.svg"
                    alt="menu svg"></button>
            <nav v-bind:class="{ Active: isActive }">
                <div id="circle"></div>
                <button id="closemenubtn" @click="isActive = !isActive"><img src="../assets/icons/cancel2.svg"
                        alt="Cancel icon"></button>
                <div class="links">
                    <router-link to="/">Home</router-link>
                    <router-link to="/about">Search</router-link>
                    <router-link to="/about">Comunity</router-link>
                </div>

                <div class="botons">
                    <div class="login" v-if=(login)>                        
                        <img :src="img"> 
                    </div>
                    <div class="logout" v-if=(!login)>
                        <router-link to="/auth/signin" class="loginbtn">Log in</router-link>
                        <router-link to="/auth/signup" class="signupbtn">Sign up</router-link>
                    </div>
                    <div class="redes">
                        <a href="#">Facebook</a>
                        <a href="#">Twitter</a>
                        <a href="#">Linkedin</a>
                    </div>
                </div>
            </nav>

        </div>

    </div>
</template>
<script>

export default {
    data() {
        return {
            isActive: false,
            login: false
        }
    },
    name: "NavComponent",
    props: {        
        img: String
    },
    created() {
    if(this.$cookies.isKey("token") === true){
      this.login = !this.login
    }
  }
}
</script>
<style scoped>
#navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #020202;
    height: 75px;
    padding: 10px 40px;
    color: white;
}

.navegation {
    display: flex;
    align-items: center;
    gap: 30px;
    width: 100%;
    justify-content: space-between;
}

/*Modificaciones del logo*/
.logo {
    display: flex;
    justify-content: center;
    align-items: center;
}

.logo img {
    width: 100px;
}

/* Modificaciones de la navegacion */
nav {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

nav .links {
    display: flex;
    gap: 20px;
    align-items: center;
}

nav a {
    text-decoration: none;
    color: #7C7C7C;
    font-weight: 700;
    font-size: 18px;
}

nav a:hover {
    color: #dfdfe0;
}

nav a.router-link-exact-active {
    color: #F7F7FF;
}

#circle {
    display: none;
}

/* Modificaciones de los botones */
.botons .login img{
    width: 45px;
    height: 45px;
    border-radius: 50%;
    object-fit: cover;
}
.botons .logout {
    display: flex;
    gap: 10px;
}

.botons .logout a {
    width: 100px;
    border: none;
    color: #F7F7FF;
    border-radius: 5px;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    text-align: center;
    padding: 8px 0;
}

.botons .logout a {
    text-decoration: none;
    color: white;

}

.botons .logout a.signupbtn {
    background-color: #A4031F;
}

.botons .logout a.loginbtn {
    background-color: transparent;
}

.menubtn {
    display: none;
}

#closemenubtn,
.redes {
    display: none;
}

/*-----------------------------------
-------------------------------------
Diseño para mobiles
-------------------------------------
------------------------------------- */

@media screen and (max-width: 767px) {
    #navbar {
        padding: 10px 30px;
        height: 65px;
    }

    nav {
        display: none;
        position: fixed;
        height: 100vh;
        width: 100vw;
        top: 0;
        left: 0;
        background-color: #020202;
        z-index: 1;
        margin: auto;
    }

    nav.Active {
        display: block;
    }

    .menubtn {
        display: block;
        position: absolute;
        right: 30px;
        background-color: transparent;
        border: none;
    }

    /*Modificaciones del logo*/
    .logo img {
        width: 70px;
    }

    /* Modificaciones de los botones */
    .botons .logout button {
        display: none;
    }

    nav.Active .botons .logout button {
        display: block;
    }

    nav.Active #closemenubtn {
        display: block;
        background-color: transparent;
        border: none;
        position: fixed;
        right: 30px;
        top: 20px;
    }

    nav.Active .links {
        flex-direction: column;
        align-items: start;
        padding-top: 30%;
        padding-left: 50px;
        gap: 30px;
    }

    nav.Active .botons .logout {
        flex-direction: column;
        align-items: start;
    }

    nav.Active a {
        color: #7C7C7C;
        font-weight: 700;
        font-size: 26px;
    }

    nav.Active a.router-link-exact-active {
        color: #F7F7FF;
    }

    nav.Active #circle {
        display: block;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        position: absolute;
        background-color: #D9D9D9;
        left: -30px;
        top: 20px;
    }

    nav.Active .botons .logout a.loginbtn {
        padding: 0;
        width: auto;
        color: #7C7C7C;
        font-weight: 700;
        font-size: 26px;

    }

    nav.Active .botons .logout a.signupbtn {
        padding: 15px 0;
        width: 100%;
        font-size: 20px;
    }

    nav.Active .botons .logout {
        margin-top: 30px;
        padding: 0 50px;
        gap: 70px;
    }

    nav.Active .redes {
        display: block;
        position: absolute;
        bottom: 20px;
        display: flex;
        justify-content: space-between;
        width: 100%;
        padding: 0 30px;
    }

    nav.Active .redes a {
        font-size: 18px;
        font-weight: 500;
    }
}
</style>