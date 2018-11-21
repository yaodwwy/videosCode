<template>
  <div class="hello">
    <el-row>
      <!-- 响应式布局 -->
        <el-col :span="2" style="visibility:hidden">1</el-col>
        <el-col :span="4">第一个区域</el-col>
        <el-col :span="4">第二个区域</el-col>
        <el-col :span="4">第三个区域</el-col>
        <el-col :span="4">第四个区域</el-col>
        <el-col :span="4">第五个区域</el-col>
        <el-col :span="2" style="visibility:hidden">1</el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
 
</style>
