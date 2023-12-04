<template>
  <router-view />
</template>
<script>
import {mapActions, mapState} from 'vuex'

export default{
  created(){
    this.Login()
    if(this.IsLogin){
      this.my()
    }
    this.all()
  },
  methods:{
    ...mapActions(['Login']),
    ...mapActions('user',['my']),
    ...mapActions('post',['all'])
  },
  computed: {
    ...mapState(['IsLogin'])
  }
}


</script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Exo+2:wght@100;200;300;400;500;600;700;800;900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@300;400&display=swap');

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Exo 2', sans-serif;
}
</style>
