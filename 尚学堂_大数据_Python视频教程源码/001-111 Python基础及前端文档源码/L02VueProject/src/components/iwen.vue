<template>
	<!-- template里面只能存在一个根组件 -->
	<div class="container">
		<p>{{ info }}</p>
		<p>{{ demo }}</p>
	</div>
</template>


<script>
	
export default{
	name:"iwen", // 组件的名字，自己起的
	data(){
		return{
			info:"我们的第一个Vue项目 project",
			demo:"这是第一个Demo例子"
		}
	}
}

</script>


<style>

.container{
	color: red;
}
	
</style>