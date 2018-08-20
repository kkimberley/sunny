<template>
  <div>test
    <div>{{ messages }}</div>
  </div>

</template>

<script>
export default {
  props: ["messages"],
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
