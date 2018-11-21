<template>
	<div>
		<ul>
			<li><router-link to="/helloworld">HelloWorld</router-link></li>
			<li><router-link to="/hot">hot</router-link></li>
			<li><router-link to="/demo">demo</router-link></li>
		</ul>
	</div>
</template>

<script>
	
export default {
	name:"navs",
	data(){
		return{

		}
	}
}

</script>

<style scoped>

ul li{
	float: left;
	margin:10px 20px;
	list-style: none;
	background: #f1f1f1;
}

li:hover{
	background: red;
}

	
</style>