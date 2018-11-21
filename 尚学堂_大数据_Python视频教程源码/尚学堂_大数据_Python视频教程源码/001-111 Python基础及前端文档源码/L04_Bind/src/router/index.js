import Vue from 'vue'
import VueRouter from "vue-router"
import HelloWorld from "@/components/HelloWorld"
import Hot from "@/components/hot"
import Demo from "@/components/demo"
import Navs from "@/components/nav"
import HotSon from "@/components/hotson"
// @ -> ..

Vue.use(VueRouter)

// 创建路由对象
export default new VueRouter({
	routes: [{
		path: "/",
		name: "navs",
		component: Navs,
		// 重定向
		redirect: "/helloworld"
	}, {
		path: "/helloworld",
		name: "HelloWorld",
		component: HelloWorld
	}, {
		path: "/hot",
		name: "hot",
		component: Hot
	}, {
		path: "/demo",
		name: "demo",
		component: Demo
	}, {
		path: "/hotson",
		name: "hotson",
		component: HotSon
	}]
})