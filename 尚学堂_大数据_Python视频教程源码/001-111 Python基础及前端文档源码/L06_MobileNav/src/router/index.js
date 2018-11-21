import Vue from 'vue'
import Router from 'vue-router'
import Layout from "@/components/layout"
import Category from "@/components/pages/category"
import Mine from "@/components/pages/mine"
import Tuijian from "@/components/pages/tuijian"
import Navs from "@/components/pages/nav"
import Shop from "@/components/pages/details/shop"

Vue.use(Router)


export default new Router({
	routes: [{
		path: "/",
		name: "layout",
		component: Layout,
		// 重定向
		redirect: "/tuijian",
		children: [{
			path: "/tuijian",
			component: Tuijian
		}, {
			path: "/category",
			component: Category
		}, {
			path: "/mine",
			component: Mine
		}, {
			path: "/nav",
			component: Navs
		}, {
			path: "/shop",
			component: Shop
		}]
	}]
})