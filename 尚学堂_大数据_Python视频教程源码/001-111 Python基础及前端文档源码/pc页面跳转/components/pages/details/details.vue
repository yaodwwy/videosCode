<template>
	<div class="detail-wrap">
		<div class="detail-left">
			<div class="product-board">
				<img :src="getUrl" alt="">
				<ul>
					<!-- router-link:默认渲染成a标签 -->
					<!-- tag:可以修改渲染的标签类型 -->
					<router-link tag="li" :to="'/details/' + product.id" v-for="(product,index) in productBoradList" :key="index">{{ product.title }}</router-link>
				</ul>
			</div>
		</div>
		<div class="detail-right">
			<router-view />
		</div>
	</div>
</template>
<script>
	
export default{
	name:"details",
	data(){
		return{
			productBoradList:[
				{
					title:"数据统计",
					id:"pet"
				},
				{
					title:"数据预测",
					id:"cake"
				},
				{
					title:"流量分析",
					id:"beauty"
				},
				{
					title:"广告发布",
					id:"jewellery"
				}
			],
			navImg:{
				"/details/beauty":require("../../../assets/images/2.png"),
				"/details/pet":require("../../../assets/images/4.png"),
				"/details/cake":require("../../../assets/images/1.png"),
				"/details/jewellery":require("../../../assets/images/3.png")
			}
		}
	},
	computed:{
		getUrl(){
			return this.navImg[this.$route.path];
		}
	}
}	

</script>
<style scoped>
	
.detail-wrap {
  width:1200px;
  margin: 0 auto;
  overflow: hidden;
  padding-top: 20px;
}
.detail-left {
  float: left;
  width: 200px;
  text-align: center;
}
.detail-right {
  float: left;
  width: 980px;
  margin-left: 20px;
}
.product-board {
  background: #fff;
  padding: 20px 0;
}
.product-board ul {
  margin-top: 20px;
}
.product-board li {
  text-align: left;
  padding: 10px 15px;
  cursor: pointer;
}
.product-board li.active,
.product-board li:hover {
  background: #4fc08d;
  color: #fff;
}
.product-board li a {
  display: block;
}

</style>