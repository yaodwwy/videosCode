<template>
	<div>
		<div>
			<swiper :options="swiperOption">
			    <swiper-slide>
			    	<img src="../../assets/j1.jpg" alt="">
			    </swiper-slide>
			    <swiper-slide>
			    	<img src="../../assets/j2.jpg" alt="">
			    </swiper-slide>
			    <swiper-slide>
			    	<img src="../../assets/j3.jpg" alt="">
			    </swiper-slide>
			    <swiper-slide>
					<img src="../../assets/j4.jpg" alt="">
			    </swiper-slide>
			    <div class="swiper-pagination"  slot="pagination"></div>
		  	</swiper>

		</div>
		<router-link to="/shop">超市</router-link>
		<ul>
			<li v-for="shop in shopList">
				<img class="shopimg" :src="shop.img" alt="">
				<span>{{ shop.title }}</span>
				<span>{{ shop.content }}</span>
			</li>
		</ul>

		<Navs />
	</div>
</template>
<script>

import Navs from  "./nav"
	
export default{
	name:"tuijian",
	data(){
		return{
			swiperOption: {
		          // swiper options 所有的配置同swiper官方api配置
		          autoplay: 3000,
		          loop:true,
		          grabCursor: true,
		          setWrapperSize: true,
		          autoHeight: true,
		          pagination: '.swiper-pagination',
		          paginationClickable: true,
		          mousewheelControl: true,
		          observeParents: true
		    },
			shopList:[]
		}
	},
	components:{
		Navs
	},
	created(){
		this.$axios("/sxtstu/blueberrypai/getIndexBanner.php")
		.then(res => {
			this.shopList = res.data.banner
		})
		.catch(error => {
			console.log(error)
		})
	}
}

</script>

<style scoped>
	
img{
	width: 100%;
}	

.shopimg{
	width: 100px;
	height: 100px;
}

</style>