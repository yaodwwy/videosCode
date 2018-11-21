<template>
	<div class="app-head">
		<div class="app-head-inner">
			<router-link to="/"><img src="../../assets/logo.png" alt=""></router-link>
			<span>尚学堂旗下品牌：云数学院|速学堂|百战程序员|优效学院线上培训- 优效聚名师，学习更有效</span>
			<div class="head-nav">
			<ul class="nav-list">
				<li >登陆</li>
				<li class="nav-pile">|</li>
				<li>注册</li>
				<li class="nav-pile">|</li>
				<li>关于</li>
			</ul>
		</div>
		</div>
	</div>
</template>
<script>
	
export default{
	name:"header",
	data(){
		return {

		}
	}
}	

</script>

<style scoped>
	
.app-head {
  background: #363636;
  color: #b2b2b2;
  height: 90px;
  line-height: 90px;
  width: 100%;
}
.app-head-inner {
  width: 1200px;
  margin: 0 auto;
}
.head-logo {
  float: left;
}
.app-head-inner img {
  width: 50px;
  margin-top: 20px;
}
.head-nav {
  float: right;
}
.head-nav ul {
  overflow: hidden;
}
.head-nav li {
  cursor: pointer;
  float: left;
}
.nav-pile {
  padding: 0 10px;
}

</style>