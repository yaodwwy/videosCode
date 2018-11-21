1.安装element-ui
	npm install element-ui --save

2.按需加载
	1.安装：npm install babel-plugin-component -D
	2.修改.babelrc
		{
		  "presets": [
		    ["env", {
		      "modules": false
		    }],
		    "stage-2"
		  ],
		  "plugins": ["transform-runtime",["component", [
		    {
		      "libraryName": "element-ui",
		      "styleLibraryName": "theme-chalk"
		    }
		  ]]]
		}

	3.引入
		import { Button, Select } from 'element-ui'
		Vue.component(Button.name, Button)
		Vue.component(Select.name, Select)

3.bootstrap:http://www.bootcss.com/