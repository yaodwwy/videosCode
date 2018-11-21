<template>
	<div class="container-left">
		我是页面的左边  Demo:{{demodata}}
		<Demo v-bind:t1="t1" v-on:demokey="getSonData"/>
		<Texts v-bind:t2="t2"/>
		<button v-on:click="handlerChange1">修改父传子的数据1</button>
		<button v-on:click="handlerChange2">修改父传子的数据2</button>
	</div>
</template>
<script>

import Texts from "./leftcomponents/texts"
import Demo from "./leftcomponents/demo"
	
export default{
	name:"pageleft",
	data(){
		return{
			demodata:"",
			t1:"我是活的t1数据",
			t2:"我是活的t2数据"
		}
	},
	components:{
		Texts,
		Demo
	},
	methods:{
		getSonData(data){
			this.demodata = data;
		},
		handlerChange1(){
			this.t1 = "我是修改只有的活的t1数据"
		},
		handlerChange2(){
			this.t2 = "我是修改只有的活的t2数据"
		}
	}
}	

</script>
<style>

.container-left{
	float: left;
	width: 50%;
	height: 500px;
	background-color: #ff00ff;
}	

</style>