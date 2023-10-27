<template>
    <div class="footer">
        <div class="text">
            <p>© 2023 DesingDev inc. All rights reserved</p>
        </div>
        <div class="redes">
            <a href="#"><img src="../assets/icons/github.svg" alt="Github icon"></a>
            <a href="#"><img src="../assets/icons/linkedin.svg" alt="Linkedin icon"></a>
            <a href="#"><img src="../assets/icons/facebook.svg" alt="Facebook icon"></a>
        </div>


    </div>
</template>
<script>
export default {
    name: "footerComponent",
    props: {

    }
}
</script>
<style scoped>
.footer {
    background-color: #A4031F;
    color: white;
    height: 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;
}

.footer p {
    font-size: 14px;
}

.footer .redes {
    display: flex;
    gap: 13px;
}

.footer .redes img {
    width: 22px;
}

@media screen and (max-width: 767px) {
    .footer {
        padding: 0 20px;
    }

    .footer p {
        font-size: 9px;
    }

    .footer .redes {
        gap: 10px;
    }

    .footer .redes img {
        width: 15px;
    }
}
</style>