<template>
    <div id="error">
        <img src="../../assets/ilustrations/maintenance.svg" alt="Maintenance svg">

        <h1>We’re urder maintenance</h1>
        <p>Pleace check back soon just putting little touch up on some pretty updates.</p>
        <router-link to="/">Back to home</router-link>

    </div>
</template>
<script>
export default {
    name: "maintenaceView"
}
</script>
<style scoped>
#error {
    background-color: #020202;
    width: 100vw;
    height: 100vh;
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 10px;
}

img {
    width: 500px;
}

h1 {
    font-size: 40px;
    font-weight: 700;
}

p {
    font-size: 20px;
    font-weight: 500;
    padding: 0 20px;
}

a {
    width: 150px;
    height: 40px;
    background-color: #A4031F;
    border: none;
    color: white;
    border-radius: 5px;
    cursor: pointer;

    display: flex;
    justify-content: center;
    align-items: center;
    text-decoration: none;
}

/*-----------------------------------
-------------------------------------
Diseño para mobiles
-------------------------------------
------------------------------------- */

@media screen and (max-width: 767px) {
    img {
        width: 300px;
    }

    h1 {
        font-size: 25px;
        margin-top: 20px;
    }

    p {
        font-size: 18px;
        margin-top: 10px;
        text-align: center;
    }

    a {
        margin-top: 20px;
    }
}
</style>