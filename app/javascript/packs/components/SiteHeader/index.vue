<template>
  <el-header>
    <el-menu :default-active="currentPath" mode="horizontal">
      <el-menu-item index="1">Sunny</el-menu-item>
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
.el-menu {
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

  border-color: white;
}
</style>
