import Vue from 'vue'
import Router from 'vue-router'
import Layout from '@/components/Layout'
import Index from "@/components/pages/index"

Vue.use(Router)

export default new Router({
	routes: [{
		path: '/',
		name: 'Layout',
		component: Layout,
		redirect: "/index",
		children: [{
			path: "index",
			component: Index
		}]
	}]
})