<template>
  <div id="app">
    <img src="./assets/logo.png">
    <HelloWorld/>
    <!-- 第三步：呈现组件 -->
    <Slide />
    <Iwen />
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld'
// 第一步:引入组件
import Iwen from "./components/iwen"; // 引入
import Slide from "./components/slide"

export default {
  name: 'app',
  components: {
    HelloWorld,
    // 第二步：加载组件
    Iwen,
    Slide
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
