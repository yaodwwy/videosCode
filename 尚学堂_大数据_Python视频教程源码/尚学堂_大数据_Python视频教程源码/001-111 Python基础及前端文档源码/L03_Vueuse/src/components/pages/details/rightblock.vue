<template>
	<div class="container-right">
		我是页面的右边{{ rightfirstmsg }}
		<RightFirst v-bind:title="title" v-on:rightfristKey="getrightfirstmsg" />
		<RightSecond v-bind:desc="desc" />
		
	</div>
</template>
<script>
	
import RightFirst from "./rightcomponents/rightfirst"
import RightSecond from "./rightcomponents/rightsecond"


export default{
	name:"pageright",
	data(){
		return{
			title:"我是活的第一个标题",
			desc:"我是活的第二个标题",
			rightfirstmsg:""
		}
	},
	components:{
		RightFirst,
		RightSecond
	},
	methods:{
		getrightfirstmsg(data){
			console.log(data);
			this.rightfirstmsg = data;
		}
	}
}	

</script>
<style>

.container-right{
	float: right;
	width: 50%;
	height: 500px;
	background-color: #00ffff;
}	

</style>