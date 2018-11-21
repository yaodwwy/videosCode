// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import {
	Button,
	Select,
	Menu,
	Dropdown,
	DropdownMenu,
	DropdownItem,
	Submenu,
	Row,
	Col,
	MenuItem,
	Card,
	MenuItemGroup
} from 'element-ui'

Vue.config.productionTip = false

Vue.use(Button)
Vue.use(Select)
Vue.use(Dropdown)
Vue.use(DropdownMenu)
Vue.use(DropdownItem)
Vue.use(Menu)
Vue.use(Submenu)
Vue.use(MenuItem)
Vue.use(MenuItemGroup)
Vue.use(Row)
Vue.use(Col)
Vue.use(Card)

/* eslint-disable no-new */
new Vue({
	el: '#app',
	render: h => h(App)
})