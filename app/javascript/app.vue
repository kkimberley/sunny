<template>
  <div id="app">
    <el-container>
      <el-header>
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
          <el-menu-item index="1">Sunny</el-menu-item>
            <el-submenu index="2">
            <template slot="title">我的工作台</template>
            <el-menu-item index="2-1">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
            <el-submenu index="2-4">
              <template slot="title">选项4</template>
              <el-menu-item index="2-4-1">选项1</el-menu-item>
              <el-menu-item index="2-4-2">选项2</el-menu-item>
              <el-menu-item index="2-4-3">选项3</el-menu-item>
            </el-submenu>
          </el-submenu>
          <el-menu-item index="3" disabled>消息中心</el-menu-item>
          <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">订单管理</a></el-menu-item>
        </el-menu>
        <div class="line"></div>
      </el-header>
      <el-main>
        <el-row>
          <el-button class="add-button" icon="el-icon-plus" circle></el-button>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-card>
              card 1
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card>
              card 2
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card>
              card 2
            </el-card>
          </el-col>
        </el-row>
      </el-main>
      <el-footer>footer</el-footer>
    </el-container>
  </div>
</template>

<script>
export default {
  props: ["messages", "test"],
  data: function () {
    return {
      message: "Hello Vue!!"
    }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.add-button {
  margin-bottom: 16px;
  float: right;
}
</style>
