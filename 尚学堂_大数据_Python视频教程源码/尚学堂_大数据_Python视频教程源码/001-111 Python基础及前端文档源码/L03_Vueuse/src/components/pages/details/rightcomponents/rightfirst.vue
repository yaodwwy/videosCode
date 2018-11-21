<template>
	<div>
		{{ title }}
		<button v-on:click="sendMsg">给父亲传递数据</button>
	</div>
</template>

<script>
	
export default{
	name:"rightfirst",
	data(){
		return{
			msg:"我是rightfirst发送的数据"
		}
	},
	props:{
		title:{
			type:String,
			dafault:"默认值"
		}
	},
	methods:{
		sendMsg(){
			this.$emit("rightfristKey",this.msg)
		}
	}
}	

</script>

<style>
	
</style>