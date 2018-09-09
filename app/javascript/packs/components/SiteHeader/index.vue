<template>
  <el-header>
    <a class="logo" href="/">Sunny</a>
    <el-menu :default-active="currentPath" mode="horizontal">

      <el-menu-item :index="costPath"><a :href="costPath">費用總表</a></el-menu-item>
    </el-menu>
  </el-header>
</template>

<script>
export default {
  props: ['costPath', 'currentPath'],
}
</script>


<style lang="scss" scoped>
.logo {
  display: inline-block;
  vertical-align: top;
  height: 60px;
  line-height: 60px;
  color: white;
  text-decoration: none;
  padding-right: 20px;
}

.el-menu {
  display: inline-block;
  background: transparent;
  color: white;

  .el-menu-item {
    color: white;

    &:not(.is-disabled):hover {
      background: rgba(#fff, 0.3);
      color: white;
    }

    &.is-active {
      color: white;
    }
  }

  border-color: transparent;
}
</style>
