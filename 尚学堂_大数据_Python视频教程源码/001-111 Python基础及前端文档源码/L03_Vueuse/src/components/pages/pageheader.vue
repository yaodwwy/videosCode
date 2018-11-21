<template>
	<div class="header">
		<input type="text" v-model="msg">
		<p>{{ msg }}</p>
		<HeaderSon v-bind:sendinfo="info"/>
	</div>
</template>
<script>

import HeaderSon from "./details/headerson"
	
export default{
	name:"pageheader",
	data(){
		return{
			msg:"",
			info:""
		}
	},
	watch:{
		msg:function(value){
			this.info = value;
			console.log(value);
		}
	},
	components:{
		HeaderSon
	}
}	

</script>
<style>
	
.header{
	width: 100%;
	height: 200px;
	background-color: red;
}	

</style>