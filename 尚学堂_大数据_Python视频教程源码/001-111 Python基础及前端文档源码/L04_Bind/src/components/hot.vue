<template>
	<div>
		<Navs />
		热门
		<router-link to="/hotson">进入热门的详情页</router-link>
	</div>
</template>

<script>
	
import Navs from "./nav"

export default {
	name:"hot",
	data(){
		return{

		}
	},
	components:{
		Navs
	}
}


</script>

<style>
	
</style>