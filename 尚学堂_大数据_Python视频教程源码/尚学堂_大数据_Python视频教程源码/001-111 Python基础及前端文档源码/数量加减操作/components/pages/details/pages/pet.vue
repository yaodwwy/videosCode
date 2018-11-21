<template>
	<div class="sales-board">
		<div class="sales-board-intro">
			<h2>蛋糕美食</h2>
                <p>蛋糕花样丰富多彩，造型百变，味道也总是给我们带来惊喜，不过世界上最著名的10大蛋糕，你知道多有哪些吗？下面就让我们大开眼界吧。</p>
		</div>

		<div class="sales-board-form">
			    <div class="sales-board-line">
    			    <div class="sales-board-line-left"> 购买数量：</div>
            	<div class="sales-board-line-right">
                <Counter :max="counterData.max" :min="counterData.min"/> 
              </div>
      		</div>

      		<div class="sales-board-line">
      			<div class="sales-board-line-left">产品类型：</div>
            <div class="sales-board-line-right"></div>
      		</div>

      		<div class="sales-board-line">
      			<div class="sales-board-line-left">有效时间：</div>
            <div class="sales-board-line-right"></div>
      		</div>

      		<div class="sales-board-line">
      			<div class="sales-board-line-left"> 总价：</div>
            <div class="sales-board-line-right"></div>
          </div>
		</div>

		<div class="sales-board-des">
        <h3>黑森林蛋糕</h3>
        <p>黑森林蛋糕，德国最出名的蛋糕。它融合了樱桃的酸、奶油的甜、樱桃酒的醇香。完美的黑森林蛋糕经得起各种口味的挑剔。黑森林蛋糕被称作黑森林的特产之一，德文原意为“黑森林樱桃奶油蛋糕”。正宗的黑森林蛋糕，巧克力相对比较少，更为突出的是樱桃酒和奶油的味道。</p>
        <h3>长崎蜂蜜蛋糕</h3>
        <p>
        蜂蜜蛋糕，用砂糖、鸡蛋和面粉做成，是日本非常著名的西点。不过，它最早起源于荷兰古国，当时的贵族在招待使节时都会用它来向宾客表达主人最隆重的敬意。
        </p>
        <h3>乳酪蛋糕</h3>
        <p>
        乳酪蛋糕 ，又称奶酪蛋糕。以海绵蛋糕、派皮等为底坯，将加工后的乳酪混合物倒入上面，经过烘烤、装饰而成。包括美式乳酪蛋糕、酸奶乳酪蛋糕等。乳酪类蛋糕单从材料、制作工艺以及口感与其他几种蛋糕相比稍有不同，这类蛋糕介于蛋糕和甜点之间，所以越来越受人关注。
        </p>
    </div>

	</div>
</template>
<script>

import Counter from "./components/counter"
	
export default{
	name:"pet",
	data(){
		return{
      // Counter的数据
      counterData:{
        max:10,
        min:1
      }
		}
	},
  components:{
    Counter
  }
}	

</script>

<style scoped>

.sales-board {
  background: #fff;
}
.sales-board-form {

}
.sales-board-intro h2 {font-size: 20px;
  padding: 20px;
}
.sales-board-intro p {
  background: #f7fcff;
  padding: 10px 20px;
  color: #999;
  line-height: 1.8;
}
.sales-board-form {
  padding: 30px 20px;
  font-size: 14px;
}
.sales-board-line {
  clear: both;
  padding-bottom: 20px;
}
.sales-board-line-left {
    display: inline-block;
    width: 100px;
}
.sales-board-line-right {
    display: inline-block;
    width: 75%;
}
.sales-board-des {
  border-top: 20px solid #f0f2f5;
  padding: 15px 20px;
}
.sales-board-des p {
  line-height: 1.6;
}
.sales-board-des h2 {
  font-size: 20px;
  padding-bottom: 15px;
}
.sales-board-des h3 {
  font-size: 18px;
  font-weight: bold;
  padding: 20px 0 10px 0;
}
.sales-board-des li {
  padding: 5px 0;
}
.sales-board-table {
  width: 100%;
  margin-top: 20px;
}
.sales-board-table th {
  background: #4fc08d;
  color: #fff;
}
.sales-board-table td {
    border: 1px solid #f0f2f5;
    padding: 15px;
}
h3{
  margin-top: 30px;
}
.buy-dialog-title {
  font-size: 16px;
  font-weight: bold;
}
.buy-dialog-btn {
  margin-top: 20px;
}
.buy-dialog-table {
  width: 100%;
  margin-bottom: 20px;
}
.buy-dialog-table td,
.buy-dialog-table th{
  border: 1px solid #e3e3e3;
  text-align: center;
  padding: 5px 0;
}
.buy-dialog-table th {
  background: #4fc08d;
  color: #fff;
  border: 1px solid #4fc08d;
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
	
</style>