<template>
  <router-link :to="`/onearticle/${infoPost._id}`">
    <div class="article" v-bind:class="{ small: isSmall }">
      <div class="picture">
        <img :src="infoPost.imgUrl" alt="Jhon wick picture" loading="lazy"/>
      </div>
      <div class="text">
        <div class="infoUser">
          <img id="photoPerfil" :src="infoAuthor.imgUrl" alt="Perfil 1" />
          <p id="namePerfil">{{ infoAuthor.name }}</p>
          <div class="puntoS"></div>
          <p id="timeArticle">12 minutes ago</p>
        </div>
        <div class="infoArticle">
          <h3 id="titleArticle">{{ infoPost.title }}</h3>
          <p id="desArticle" > {{ infoPost.description }}</p>
        </div>
        <div class="infoTags">
          <p v-for="(item, index) in infoPost.tags" :key="index">{{ item }}</p>
        </div>
      </div>
    </div>
  </router-link>
</template>
<script>

import userModule from "@/store/modules/user"

export default {
  data() {
    return {
      infoPost: this.DataPost,
      infoAuthor: {},
    };
  },
  name: "articleComponent",
  props: {
    isSmall: Boolean,
    DataPost: Object,
  },
  
  async created(){
    let idUser = this.DataPost.author[0]    
    let dataUser = await userModule.actions.one(idUser) 
    this.infoAuthor = dataUser.data    
  },
};
</script>
<style scoped>
a{
    text-decoration: none;
}
.article {
  display: flex;
  max-width: 1000px;
  gap: 9%;
  margin-top: 30px;
  position: relative;
}

.puntoS {
  width: 3px;
  height: 3px;
  background-color: white;
  border-radius: 100%;
  margin-left: 5px;
}

.picture img {
  width: 500px;
  height: 300px;
  border-radius: 20px;
  object-fit: cover;
}

.infoUser {
  display: flex;
  align-items: center;
}

.infoUser img {
  width: 35px;
  height: 35px;
  border-radius: 100%;
  object-fit: cover;
  margin-right: 8px;
}

#namePerfil,
#timeArticle {
  color: #7c7c7c;
  margin-left: 5px;
}

#titleArticle {
  color: #FFFFFF;
  font-size: 40px;
  letter-spacing: 4%;
  margin-top: 10px;
  font-weight: 700;
}

#desArticle {
  font-size: 16px;
  color: #7c7c7c;
  font-weight: 400;
  margin-top: 10px;
  overflow: hidden;
  max-width: 500px;
  max-height: 100px;
}

.infoTags {
  margin-top: 20px;
}

.infoTags p {
  color: #a4031f;
}

/*-----------------------------------
-------------------------------------
Diseño de articulo para mobiles
-------------------------------------
------------------------------------- */
.article.small {
  max-width: 300px;

  flex-direction: column;
}

.article.small .picture img {
  width: 300px;
  height: 200px;
}

.article.small .infoUser {
  margin-top: 10px;
}

.article.small #photoPerfil {
  display: none;
}

.article.small #namePerfil,
.article.small #timeArticle {
  font-size: 14px;
}

.article.small #titleArticle {
  font-size: 24px;
}

.article.small #desArticle {
  font-size: 14px;
}

.article.small .infoTags p {
  font-size: 12px;
}

/*-----------------------------------
-------------------------------------
Diseño para mobiles
-------------------------------------
------------------------------------- */

@media screen and (max-width: 767px) {
  .picture img {
    width: 80%;
    height: 150px;
  }

  .picture {
    display: flex;
    justify-content: center;
  }

  #titleArticle {
    font-size: 16px;
  }

  .infoUser img {
    width: 15px;
    height: 15px;
  }

  #namePerfil,
  #timeArticle {
    font-size: 8px;
  }

  .article {
    flex-direction: column;
    gap: 4%;
  }

  #desArticle {
    font-size: 10px;
    height: 50px;
  }

  .text {
    padding: 10px 30px;
  }

  .infoTags p {
    font-size: 10px;
  }

  /* Diseño de articulo para mobiles */
  .article.small {
    max-width: 200px;
  }

  .article.small .picture img {
    width: 200px;
    height: 150px;
  }

  .article.small .text {
    padding: 10px 0;
  }

  .article.small .infoUser {
    margin-top: 5px;
  }

  .article.small #namePerfil,
  .article.small #timeArticle {
    font-size: 10px;
  }

  .article.small #titleArticle {
    font-size: 20px;
  }

  .article.small #desArticle {
    font-size: 12px;
    max-height: 45px;
  }

  .article.small .infoTags {
    margin-top: 10px;
  }

  .article.small .infoTags p {
    font-size: 12px;
  }
}
</style>