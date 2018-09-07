<template>
  <div>
    <el-tag
      v-for="item in items"
      :key="item.id"
      class="item"
    >
      <a class="text" :href="'items/' + item.id">{{ item.category }}</a>
    </el-tag>
  </div>
</template>

<script>
export default {
  props: ['items'],
}
</script>

<style lang="scss" scoped>
  .text {
    font-size: 14px;
    color: #222;
  }

  .item {
    margin-bottom: 18px;
    a {
      text-decoration: none;
    }
  }

  .el-tag {
    margin-right: 10px;
  }
</style>
