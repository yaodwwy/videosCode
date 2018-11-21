<template>
	<div class="container">
		<LeftBlock />
		<RightBlock />		
	</div>
</template>
<script>

import LeftBlock from "./details/leftblock"
import RightBlock from "./details/rightblock"
	
export default{
	name:"pageheader",
	data(){
		return{
			
		}
	},
	components:{
		LeftBlock,
		RightBlock
	}
}	

</script>
<style>

.container{
	width: 100%;
	height: 500px;
	background-color: blue;
}	

</style>