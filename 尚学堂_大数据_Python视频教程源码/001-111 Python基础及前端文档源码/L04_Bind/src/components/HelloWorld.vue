<template>
  <div class="hello">
    <Navs />
    <h1 class="myh1" :class="currentClass">{{ msg }}</h1>
    <button @click="changeStyle">改变样式</button>
  </div>
</template>

<script>

import Navs from "./nav"

export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      currentClass:""
    }
  },
  methods:{
    changeStyle(){
      this.currentClass = "active";
    }
  },
  components:{
    Navs
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.myh1{
  color: red;
}

.active{
  font-size: 50px;
}

</style>
