<template>
	<div>
		{{ infofilter }}
	</div>
</template>
<script>

	
export default{
	name:"headerson",
	data(){
		return{
		}
	},
	props:{
		sendinfo:{
			type:String,
			default:""
		}
	},
	computed:{
		infofilter(){
			if(this.sendinfo == "张三"){
				return "张三，叫你呢"
			}else{
				return "请您输入张三"
			}
		}
	}
}	

</script>
<style>


</style>