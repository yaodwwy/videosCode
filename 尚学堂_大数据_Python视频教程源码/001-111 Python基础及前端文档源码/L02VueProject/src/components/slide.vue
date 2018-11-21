<template>
	<div>
		<ul>
			<!-- v-for:列表渲染 -->
			<li v-for="arr in dataArr"> {{ arr }} </li>
		</ul>

		<ul>
			<!-- v-if:true 则显示，false则不加载 -->
			<!-- v-show:true则显示，false则隐藏 -->
			<!-- 区别是什么？v-if是惰性模式 -->
			<li v-for="obj in dataObj" v-show="obj.flag">
				<span>{{ obj.name }}</span>
				<span>{{ obj.age }}</span>
				<strong>{{ obj.sex }}</strong>
			</li>
		</ul>
	</div>
</template>
<script>
	
export default{
	name:"slide",
	data(){
		return{
			dataArr:["马茂财","石磊","王前","卢伟","刘杰"],
			dataObj:[
				{
					name:"马茂财",
					age:30,
					sex:"男",
					flag:false
				},
				{
					name:"石磊",
					age:10,
					sex:"middle",
					flag:false
				},
				{
					name:"王前",
					age:50,
					sex:"男",
					flag:false
				},
				{
					name:"卢伟",
					age:18,
					sex:"女",
					flag:true
				},
				{
					name:"刘杰",
					age:18,
					sex:"女",
					flag:true
				},
				{
					name:"石莹",
					age:"100岁",
					sex:"女",
					flag:true
				}
			]
		}
	}
}	

</script>
<style>
	
</style>