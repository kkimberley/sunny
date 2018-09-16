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
