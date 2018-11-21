<template>
	<div class="counter-component">
		<div class="counter-btn" @click="mins"> - </div>
		<div class="counter-show">
			<input type="text" v-model="num" @keyup="fills">
		</div>
		<div class="counter-btn" @click="adds"> + </div>
	</div>
</template>
<script>
	
export default{
	name:"counter",
	data(){
		return{
			num:1
		}
	},
	props:{
		min:{
			type:Number,
			default:1
		},
		max:{
			type:Number,
			default:1
		}
	},
	methods:{
		mins(event){
			if(this.num <= this.min){
				return;
			}
			this.num--
		},
		adds(event){
			if(this.num >= this.max){
				return;
			}
			this.num++
		},
		fills(event){
			// 输入要符合规范，不能超过最大值，不能小于最小值，不能输入非法字符
			var finalValue;
			if(typeof this.num === "string"){
				finalValue = Number(this.num.replace(/\D/g,""));
			}else{
				finalValue = this.num;
			}
			if(finalValue > this.max || finalValue < this.min){
				finalValue = this.min;
			}
			this.num = finalValue;
		}
	}
}
//http://javascript.ruanyifeng.com/

</script>
<style scoped>

.counter-component {
  position: relative;
  display: inline-block;
  overflow: hidden;
  vertical-align: middle;
}
.counter-show {
  float: left;
}
.counter-show input {
  border: none;
  border-top: 1px solid #e3e3e3;
  border-bottom: 1px solid #e3e3e3;
  height: 23px;
  line-height: 23px;
  width: 30px;
  outline: none;
  text-indent: 4px;
}
.counter-btn {
  border: 1px solid #e3e3e3;
  float: left;
  height: 25px;
  line-height: 25px;
  width: 25px;
  text-align: center;
  cursor: pointer;
}
.counter-btn:hover {
  border-color: #4fc08d;
  background: #4fc08d;
  color: #fff;
}	
	
</style>