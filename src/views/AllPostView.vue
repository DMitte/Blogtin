<template>
    <div>
        <navbar :img="this.getImgUrlMy"/>
        <div class="main">
            <div class="top">
                <h1>Blog Post</h1>
            </div>

            <div class="postsParent">
                <articleC :isSmall="true" v-for="(item, index) in paginatedData" :key="index" :DataPost="item" class="cardPost" />                            
            </div>
            
            <div class="postPaginated">
                <button @click="backPage" class="btnBC back">
                    <img src="../assets/icons/arrow.svg" alt="">
                </button>

                <button v-for="item in Math.ceil(this.dataPost.length / this.perPage)" :key="item" @click="() => goToPage(item)" class="btnItem">
                    {{ item }}
                </button>

                <button @click="nextPage" class="btnBC next">
                    <img src="../assets/icons/arrow.svg" alt="">
                </button>
            </div>
            
        </div>

        <footerC />
    </div>
</template>
<script>
import navbar from '@/components/navComponent.vue';
import footerC from '@/components/footerComponent.vue'
import articleC from "@/components/articleComponent.vue";
import { mapGetters, mapActions, mapState } from 'vuex';




export default {
    name: 'AllPostView',
    data(){
        return{
            page: 1,
            perPage: 6,
        }
    },
    components: {
        navbar,
        footerC, 
        articleC
    },
    computed: {
        ...mapGetters('user', ['getImgUrlMy']),   
        ...mapState('post', ['dataPost']),
        paginatedData(){
          let paginated = this.dataPost.slice((this.page - 1) * this.perPage, this.page * this.perPage)
          return paginated
        },
        
        
    },
    methods:{
        ...mapActions('user', ['one']),
        nextPage(){
            if(this.page !== Math.ceil(this.dataPost / this.perPage)){
                this.page++;
            }
        },
        backPage(){
            if(this.page !== 1){
                this.page--;
            }
        },
        goToPage(numPage){
            this.page = numPage;
        }
    },

}
</script>
<style scoped>
    .main{
        width: 100%;
        height: 100%;
        background-color: #020202;
        color: white;
        padding: 20px 100px
    }
    .postsParent{
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-column-gap: 10%; 
        grid-row-gap: 20px;       
        margin-top: 50px;
    }
    .btnBC.back img{
        rotate: 180deg;
    }
    .btnBC.back{
        margin-right: 15px;
    }
    .btnBC.next{
        margin-left: 15px;
    }
    .btnBC{
        width: 30px;        
        border: none;
        background-color: transparent;
        cursor: pointer;
    }
    .btnItem{
        color: #ffffff;
        width: 30px;
        height: 30px;
        background-color: transparent;
        border: none;
        font-size: 20px;
    }
    .postPaginated{
        margin-top: 20px;
        display: flex;
        justify-content: center;
    }
</style>