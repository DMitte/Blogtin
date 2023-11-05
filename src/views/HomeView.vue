<template>
  <div class="home">
    <navbar :img="this.getImgUrlMy" />
    <div class="main">
      <div class="slogan">
        <h1>WELCOME TO BLOGTIN</h1>
        <p>
          Craft narratives 👨‍💻 that ignite <span>inspiration</span> 💡,
          <span>Knowledge</span> 📕, and <span>Entertaiment</span> 🎬
        </p>
      </div>
      <section class="lastArticle">
       <articleC v-if="this.LastPost" :isSmall="false" :DataPost="this.LastPost" :key="4"/>
      </section>

      <section class="bpostArticle">
        <div class="titleSection">
          <h4>Blog post</h4>
          <router-link to="/"
            >See all
            <span
              ><img
                id="photoPerfil"
                src="../assets/icons/arrowSee.svg"
                alt="Arrow see" /></span
          ></router-link>
        </div>
        <div class="mainSection">
          <articleC :isSmall="true" v-for="(item, index) in this.LastedPosts" :key="index" :DataPost="item"/>
        </div>
      </section>

      <!--<section class="bpostArticle">
        <div class="titleSection">
          <h4>News post</h4>
          <router-link to="/"
            >See all
            <span
              ><img
                id="photoPerfil"
                src="../assets/icons/arrowSee.svg"
                alt="Arrow see" /></span
          ></router-link>
        </div>
        <div class="mainSection">
          <articleC :isSmall="true" :dataPost="LastPost"/>
          <articleC :isSmall="true" :dataPost="LastPost"/>
          <articleC :isSmall="true" :dataPost="LastPost"/>
        </div>
      </section>-->
    </div>
    <footerC />
  </div>
</template>

<script>
// @ is an alias to /src
import navbar from "@/components/navComponent.vue";
import footerC from "@/components/footerComponent.vue";
import articleC from "@/components/articleComponent.vue";

import { mapState, mapGetters } from "vuex";

//import dbRequest from '@/config/db'

export default {
  name: "HomeView",
  components: {
    navbar,
    footerC,
    articleC,
  },
  
  computed: {
    ...mapGetters('user', ['getImgUrlMy']),
    ...mapGetters('post', ['LastPost','LastedPosts']),
    ...mapState(['IsLogin']),
    ...mapState('user', ['myUserData']),

  }
};
</script>

<style scoped>
.main {
  color: white;
  background-color: #020202;
  padding: 3% 0;
}

/*Modificaciones del slogan */
.main .slogan {
  background-color: #161616;
  width: 80%;
  margin: auto;
  height: 11rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  border-radius: 10px;
  padding: 20px 0;
}

.main .slogan h1 {
  font-family: "Source Code Pro", monospace;
  letter-spacing: 0.5em;
  font-weight: 300;
  font-size: 20px;
}

.main .slogan p {
  font-size: 25px;
  max-width: 25em;
  text-align: center;
  font-weight: 700;
  margin-top: 10px;
}

.main .slogan span {
  color: #a4031f;
}

/*Modificaciones de las secciones */
.lastArticle {
  display: flex;
  justify-content: center;
}

.bpostArticle {
  display: flex;
  flex-direction: column;
  margin-top: 30px;
}

.titleSection {
  display: flex;
  justify-content: space-between;
  width: 100%;
  padding: 0% 11%;
}

.titleSection h4 {
  font-size: 30px;
  color: white;
  font-weight: 700;
}

.titleSection a {
  font-size: 16px;
  color: #a4031f;
  text-decoration: none;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
}

.titleSection a span img {
  width: 11px;
}

.mainSection {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 1fr;
  grid-gap: 7%;
  padding: 0% 11%;
}

/*-----------------------------------
-------------------------------------
Diseño para mobiles
-------------------------------------
------------------------------------- */

@media screen and (max-width: 767px) {
  /*Modificaciones del slogan */
  .main .slogan {
    background-color: #161616;
    width: 90%;
    margin: auto;
    height: 500%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
  }

  .main .slogan h1 {
    font-family: "Source Code Pro", monospace;
    letter-spacing: 0.5em;
    font-weight: 300;
    font-size: 12px;
    text-align: center;
  }

  .main .slogan p {
    font-size: 14px;
    width: 90%;
    text-align: center;
    font-weight: 700;
    margin-top: 10px;
  }

  .main .slogan span {
    color: #a4031f;
  }

  .titleSection h4 {
    font-size: 16px;
    color: white;
    font-weight: 700;
  }

  .titleSection a {
    font-size: 13px;
  }

  .mainSection {
    grid-gap: 10%;
    overflow: auto;
  }

  ::-webkit-scrollbar {
    display: none;
  }
}
</style>
