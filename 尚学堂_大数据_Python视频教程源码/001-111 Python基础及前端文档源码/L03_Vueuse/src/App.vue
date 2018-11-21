<template>
  <div id="app">
<!--     <LearnVue /> -->
    <PageHeader />
    <PageBody />
    <PageFooter />
  </div>
</template>

<script>

// import LearnVue from "./components/learnvue"
import PageHeader from "./components/pages/pageheader"
import PageBody from "./components/pages/pagebody"
import PageFooter from "./components/pages/pagefooter"

export default {
  name: 'app',
  components: {
    // LearnVue
    PageHeader,
    PageBody,
    PageFooter
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
}

*{
  margin:0;
  padding:0;
}
</style>
