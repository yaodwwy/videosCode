<template>
	<div class="index-wrap">
		<div class="index-left">
			<div class="index-left-block">
				<h2>全部产品</h2>
				<template v-for="(nav,index) in navList">
					<h3>{{ nav.title }}</h3>
					<ul>
						<li v-for="(list,index) in nav.list">
							<a :href="list.url">{{ list.name }}</a>
							<span class="hot-tag" v-if="list.hot">HOT</span>
						</li>
					</ul>
					<div v-if="index%2 == 0" class="hr"></div>
				</template>
			</div>
			<div class="index-left-block">
				<h2>最新消息</h2>
				<ul>
					<li v-for="(news,index) in newNews">
						<a :href="news.url">{{ newsTitleFilter(index) }}</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="index-right">
			<div class="block">
				<swiper :options="swiperOption">
					<!-- key：索引当前的每一条数据 -->
				    <swiper-slide v-for="(banner,index) in bannerImg" :key="index">
						<img :src="banner" alt="">
				    </swiper-slide>
				    <div class="swiper-pagination"  slot="pagination"></div>
				</swiper>
			</div>
			
			<div class="index-board-list">
				<div :class="['index-board-' + borad.id,{'line-last' : index%2 !== 0}]" class="index-board-item" v-for="(borad,index) in boradList">
					<div class="index-board-item-inner">
						<h2>{{ borad.title }}</h2>
						<p>{{ borad.desc }}</p>
						<div class="index-board-button">
							<router-link class="button" :to="'/details/' + borad.id">立即到达</router-link>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
	
// 数据驱动

export default{
	name:"index",
	data(){
		return {
			boradList:[
				{
					id:"cake",
					title:"数据预测",
					desc:"开放产品是一款开放产品"
				},
				{
					id:"jewellery",
					title:"广告发布",
					desc:"品牌营销帮助你的产品更好地找到定位"
				},
				{
					id:"beauty",
					title:"流量分析",
					desc:"使命必达快速迭代永远保持最前端的速度"
				},
				{
					id:"pet",
					title:"数据统计",
					desc:"帮你勇闯高峰，到达事业的顶峰"
				}
			],
			newNews:[],
			swiperOption: {
	          autoplay: 3000,
	          grabCursor: true,
	          setWrapperSize: true,
	          autoHeight: true,
	          pagination: '.swiper-pagination',
	          paginationClickable: true,
	          mousewheelControl: false,
	          observeParents: true
		    },
		    bannerImg:[
				require("../../assets/slideShow/j1.jpg"),
				require("../../assets/slideShow/j2.jpg"),
				require("../../assets/slideShow/j3.jpg"),
				require("../../assets/slideShow/j4.jpg")
		    ],
			navList:[
				{
					title:"手机应用类",
					list:[
						{
							name:"91助手",
							url:"http://www.baidu.com",
							hot:true,
							id:0
						},
						{
							name:"豌豆荚",
							url:"http://www.baidu.com",
							hot:false,
							id:1
						},
						{
							name:"金山毒霸",
							url:"http://www.baidu.com",
							hot:false,
							id:2
						}
					]
				},
				{
					title:"pc产品",
					list:[
						{
							name:"WebStorm",
							url:"http://www.baidu.com",
							hot:false,
							id:0
						},
						{
							name:"Hbuilder",
							url:"http://www.baidu.com",
							hot:true,
							id:1
						},
						{
							name:"Sublime",
							url:"http://www.baidu.com",
							hot:false,
							id:2
						},
						{
							name:"Atom",
							url:"http://www.baidu.com",
							hot:true,
							id:3
						}
					]
				}
			]
		}
	},
	created(){
		this.$axios.get("http://www.wwtliu.com/sxtstu/news/juhenews.php",{
			params:{
				type:"top",
				count:10
			}
		})
		.then(res => {
			this.newNews = res.data;
		})
		.catch(error => {
			console.log(error)
		})
	},
	methods:{
		newsTitleFilter(index){
			if(this.newNews[index].title.length >10){
				return this.newNews[index].title.substring(0,10)+"...";
			}
			return this.newNews[index].title;
		}
	}
}	

</script>

<style scoped>
	
.index-wrap {
  width: 1200px;
  margin: 0 auto;
  overflow: hidden;
}
.index-left {
  float: left;
  width: 300px;
  text-align: left;
}
.index-right {
  float: left;
  width: 900px;
}
.index-left-block {
  min-height: 386px;
  margin: 15px;
  background: #fff;
  box-shadow: 0 0 1px #ddd;
}
.index-left-block .hr {
  margin-bottom: 20px;
  height: 1px;
  background: #ddd;
}
.index-left-block h2 {
  background: #4fc08d;
  color: #fff;
  padding: 10px 15px;
  margin-bottom: 20px;
}
.index-left-block h3 {
  padding: 0 15px 5px 15px;
  font-weight: bold;
  color: #222;
}
.index-left-block ul {
  padding: 10px 15px;
}
.index-left-block li {
  padding: 5px;
}
.index-board-list {
  overflow: hidden;
}
.index-board-item {
  float: left;
  width: 400px;
  background: #fff;
  box-shadow: 0 0 1px #ddd;
  padding: 20px;
  margin-right: 20px;
  margin-bottom: 20px;
}
.index-board-item-inner {
  min-height: 125px;
  padding-left: 120px;
}
.index-board-cake .index-board-item-inner{
  background: url(../../assets/images/1.png) no-repeat;
}
.index-board-jewellery .index-board-item-inner{
  background: url(../../assets/images/3.png) no-repeat;
}
.index-board-beauty .index-board-item-inner{
  background: url(../../assets/images/2.png) no-repeat;
}
.index-board-pet .index-board-item-inner{
  background: url(../../assets/images/4.png) no-repeat;
}
.index-board-item h2 {
  font-size: 18px;
  font-weight: bold;
  color: #000;
  margin-bottom: 15px;
}
.line-last {
  margin-right: 0;
}
.index-board-button {
  margin-top: 20px;
}
.lastest-news {
  min-height: 350px;
}
.hot-tag {
  background: red;
  color: #fff;
}
.new-item {
  display: inline-block;
  width: 230px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.button {
  background: #4fc08d;
  color: #fff;
  display: inline-block;
  padding: 10px 20px;
  cursor: pointer;
}
.button:hover {
  background: #4fc08d;
}

.block img{
	width: 100%;
}

.block{
	margin:15px 0;
}


</style>