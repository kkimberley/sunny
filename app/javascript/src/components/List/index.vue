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
