1.bind
	v-bind：绑定属性的

2.简写
	v-bind:   ->  :
	v-on:     ->  @


3.路由：
	在站点中，是存在跳转页面的功能的
	单页面应用 -> 整个站点只存在一个页面
	使用路由进行实现
	
	使用：
		1.安装
			npm install --save vue-router
		2.编写代码
			1.引入路由文件
				import VueRouter from "vue-router"
				Vue.use(VueRouter)
			2.创建路由对象
				const router = new VueRouter({
					routes: [{
						path: "/",
						name: "HelloWorld",
						component: HelloWorld
					}]
				})
			3.加载路由对象
				new Vue({
					el: '#app',
					template: '<App/>',
					router,
					components: {
						App
					}
				})
			4.给路由显示的位置
				<router-view></router-view>
			