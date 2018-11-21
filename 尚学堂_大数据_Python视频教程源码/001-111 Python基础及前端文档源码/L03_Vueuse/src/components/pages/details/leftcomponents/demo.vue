<template>
	<div>
		{{ t1 }}
		<button v-on:click="handlerclick">传递数据给父亲</button>
	</div>
</template>
<script>
	
export default{
	name:"pageleft",
	data(){
		return{
			msg:"我是儿子传递给父亲的数据，请笑纳"
		}
	},
	props:{
		t1:{
			type:String,
			default:'默认值'
		}
	},
	methods:{
		handlerclick(){
			this.$emit("demokey",this.msg);
		}
	}
}	

</script>
<style>
	

</style>