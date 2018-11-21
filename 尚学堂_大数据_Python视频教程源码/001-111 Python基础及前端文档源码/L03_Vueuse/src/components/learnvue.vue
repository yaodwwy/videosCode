<template>
	
	<div>
		{{ msg }}
		<a v-bind:href="url"  v-bind:demo="demo">百度</a>

		<div>
			<p v-if="flag">{{ p1 }}</p>
			<p v-else>{{ p2 }}</p>
		</div>

		<ul>
			<li v-for="(arr,index) in myarr">{{ arr }} ... {{ index }}</li>
		</ul>

		<button v-on:click="handlerClick">我是谁</button>
		

		{{ flag ? "你是猴子" : "你全家都是猴子" }}	

		{{ reView }}

		{{ reView }}
		
	</div>

</template>
<script>
	
export default{
	name:"learn",
	data(){
		return{
			msg:"learn vue",
			url:"http://www.baidu.com",
			demo:"{id:10}",
			p1:"我是p1",
			p2:"我是p2",
			flag:false,
			myarr:["iwen","ime","ice"],
			hello:"olleh",
			world:"dllrow"
		}
	},
	methods:{
		handlerClick(event){
			this.flag = !this.flag;
		}
	},

	// ES6
	computed:{
		reView(){
			// 数据在不改变的情况下，不会重新计算，会使用缓存
			return this.hello.split("").reverse().join("");
		}
	}
}	

</script>
<style>
	
</style>