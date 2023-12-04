<template>
  <div>
    <navbarc :img="this.getImgUrlMy" />

    <div class="main">
      <div class="top">
        <div class="infoTop">
          <div class="section">
            <p>12 MINUTES AGO</p>
            <h1>{{ dataPost.title }}</h1>
          </div>
          <div class="user">
            <img :src="authorPost.imgUrl" :alt="authorPost.imgName" />
            <div class="textos">
              <h4>{{authorPost.name}}</h4>
              <p>Fullstack developer</p>
            </div>
          </div>
          <div class="tags">
            <p v-for="(item, index) in dataPost.tags" :key="index">
              {{ item }}
            </p>
          </div>
        </div>
        <div class="imgTop">
          <img :src="dataPost.imgUrl" alt="jhon wick foto" />
        </div>
      </div>
      <div class="description">
        <p>
          {{ dataPost.description }}
        </p>
      </div>
      <div class="separacion"></div>
      <div class="shareButtons">
        <button class="share">Share this post</button>
        <button class="copy" @click="copyUrl">
          <label ><img src="../assets/icons/copy.svg" alt="Copy icon" /></label
          >Copy link
        </button>
      </div>
    </div>

    <footerc />
  </div>
</template>
<script>
import navbarc from "@/components/navComponent.vue";
import footerc from "@/components/footerComponent.vue";
import postModule from "@/store/modules/post";
import { mapState, mapGetters } from "vuex";
export default {
  data() {
    return {
      imgUserPath: "",
      dataPost: {},
      authorPost: {},
      numFilas: 1,
    };
  },
  name: "OneArticleView",
  components: {
    navbarc,
    footerc,
  },
  methods: {
    copyUrl() {
        const url = window.location.href;
      // Solicitar permiso para acceder al portapapeles
      
      navigator.clipboard.writeText(url)
        .then(() => {
          alert('Url del articulo copiado!');
        })
        .catch(error => {
          console.log('Error al copiar: ', error);
        })
    
    },
  },
  created() {    
    postModule.actions.one(this.$route.params.id).then(async (r) => {
      const authorData = await postModule.actions.oneUser(r.data.post.author[0])
      this.authorPost = authorData.data

      this.dataPost = r.data.post;
    });
  },
  computed: {
    ...mapGetters('user', ['getImgUrlMy']),
    ...mapState(['IsLogin'])
  },

  
};
</script>
<style scoped>
.main {
  background-color: #020202;
  color: white;
}

/*Style top */
.top {
  display: flex;
  padding: 10px 100px;
  align-items: center;
}

.infoTop .section p {
  font-size: 18px;
  font-weight: 600;
  color: #7c7c7c;
}

.infoTop .section h1 {
  font-size: 50px;
  font-weight: 700;
  letter-spacing: 3px;
  margin-top: 10px;
  padding-right: 20%;
  text-align: start;
}

.infoTop .user {
  display: flex;
  align-items: center;
  gap: 15px;
  margin-top: 40px;
}

.infoTop .user img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  object-fit: cover;
}

.infoTop .user p {
  color: #7c7c7c;
  margin-top: 3px;
  font-weight: 500;
}

.imgTop img {
  width: 600px;
  height: 500px;
  object-fit: cover;
  border-radius: 20px;
}

.tags {
  margin-top: 20px;
  color: #a4031f;
}

.description {
  padding: 0 20%;
  margin-top: 50px;
}

.description p {
  color: #e7e7e7;
  font-weight: 300;
  font-size: 27px;
  border: none;
  background-color: transparent;
  width: 100%;
  resize: none;  
  overflow: hidden;

}

.separacion {
  height: 2px;
  width: 80%;
  background-color: #7a7a7a;
  margin: auto;
  margin-top: 50px;
}

.shareButtons {
  margin-top: 20px;
  padding-bottom: 50px;
  display: flex;
  justify-content: space-between;
  padding: 0 170px 50px 170px;
}

.shareButtons button {
  border: none;
  background-color: transparent;
  color: white;
  cursor: pointer;
}

.shareButtons button.copy {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 4px;
  border: 1px solid rgba(164, 3, 31, 0.85);
  padding: 5px 10px;
  border-radius: 10px;
}

.shareButtons button.copy img {
  width: 20px;
}

@media screen and (max-width: 767px) {
  .top {
    flex-direction: column-reverse;
    padding: 10px 0;
  }

  .imgTop img {
    width: 97vw;
    height: 85vw;
  }

  .infoTop {
    margin-top: 20px;
    padding: 0 5%;
  }

  .infoTop .section p {
    font-size: 11px;
  }

  .infoTop .section h1 {
    font-size: 30px;
    padding-right: 0;
  }

  .infoTop .user img {
    width: 40px;
    height: 40px;
  }

  .infoTop .user p,
  .infoTop .user h4,
  .tags {
    font-size: 13px;
  }

  .infoTop .user {
    margin-top: 20px;
  }

  .description {
    padding: 0 5%;
    margin-top: 50px;
  }

  .description p {
    font-size: 20px;
    letter-spacing: 1px;
  }

  .separacion {
    width: 90%;
  }

  .shareButtons {
    padding: 0 30px 50px 30px;
  }
}
</style>