<template>
  <div class="hello">
    <ul>
      <li v-for="news in newsData">
        <p>{{ news.title }}</p>
        <img :src="news.img" alt="">
      </li>
    </ul>
  </div>
</template>

<script>

export default {
  name: 'HelloWorld',
  data () {
    return {
      newsData:[]
    }
  },
  // 生命周期函数
  // this -> 问题？！！！！
  created(){
    this.$axios.get("/sxtstu/blueberrypai/getIndexBanner.php")
    // ES6的新特性 -> 箭头函数
    .then( data => {
      this.newsData = data.data.banner;
    })
    .catch(function(error){
      console.log(error);
    });

    // post请求
    // 默认axios请求数据类型为 from-data    ?name=iwen&age=20
    // 而后台需要的数据为 x-wwww-from-urlencoded    {name:"iwen",age:20}
    this.$axios.post("/sxtstu/blueberrypai/login.php",{
      user_id:"iwen@qq.com",
      password:"iwen123",
      verification_code:"crfvw"
    })
    .then(data => {
      console.log(data);
    })
    .catch(error => {
      console.log(error);
    })

  }
}
</script>

<style scoped>

</style>
