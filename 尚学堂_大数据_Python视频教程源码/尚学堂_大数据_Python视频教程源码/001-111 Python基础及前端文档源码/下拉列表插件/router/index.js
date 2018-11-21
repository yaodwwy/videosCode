import Vue from 'vue'
import Router from 'vue-router'
import Layout from '@/components/Layout'
import Index from "@/components/pages/index"
import Details from "@/components/pages/details/details"
import Pet from "@/components/pages/details/pages/pet"
import Cake from "@/components/pages/details/pages/cake"
import Jewellery from "@/components/pages/details/pages/jewellery"
import Beauty from "@/components/pages/details/pages/beauty"

Vue.use(Router)

export default new Router({
	linkActiveClass: "active", // router-link-active -> active
	routes: [{
		path: '/',
		name: 'Layout',
		component: Layout,
		redirect: "/index",
		children: [{
			path: "index",
			component: Index
		}, {
			path: "details",
			component: Details,
			redirect: "/details/pet",
			children: [{
				path: "pet",
				component: Pet
			}, {
				path: "cake",
				component: Cake
			}, {
				path: "jewellery",
				component: Jewellery
			}, {
				path: "beauty",
				component: Beauty
			}]
		}]
	}]
})