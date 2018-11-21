<template>
	<ul class="footer">
		<li><router-link to="/tuijian">
			<i class="iconfont icon-tuijian"></i>
			推荐
		</router-link></li>
		<li><router-link to="/category">
			<i class="iconfont icon-leimupinleifenleileibie"></i>
			分类
		</router-link></li>
		<li><router-link to="/mine">
			<i class="iconfont icon-wode"></i>
			我的
		</router-link></li>
	</ul>
</template>
<script>

import "../../assets/font/iconfont.css";

export default{
	name:"navs",
	data(){
		return{

		}
	}
}

</script>
<!-- scoped:一旦添加了此属性，下面所有的样式只针对与当前的vue组件生效 -->
<style scoped>

/* 引入css文件 */

/*@import url("../../assets/font/iconfont.css");*/

.footer{
	/* 固定布局  fixed 相对布局  绝对布局   静态布局 */
	position: fixed;
	bottom:0;
	width: 100%;
	display: flex;
	height: 50px;
	background: #fff;
}
/* 
	flxe布局是css3的弹性盒子模型布局
	flex:1; 属性的意思：1/3(权重)

	移动端推荐使用布局方案：
		1.REM
		2.弹性盒子模型
 */
.footer li{
	margin-top: 8px;
	flex:1;
	float: left;
	text-align: center;
	font-size: 14px;
	color: #444;
}

.router-link-active{
	color: red;
}
	
i{
	display: block;
	font-size: 20px;
	margin-bottom: 4px;
}

/*
	14 + 20 + 10 + 5 = 49  16/8
*/

</style>