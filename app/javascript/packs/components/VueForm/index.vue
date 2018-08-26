<template>
  <el-form ref="form" :model="form" :inline="true">
    <div :key="item.index" v-for="(item, index) in renderFields" class="vue-form__fields">
      <el-form-item :label="getFieldName(item)">
        <el-input v-model="form[item]"></el-input>
      </el-form-item>
    </div>
    <el-form-item>
      <el-button type="submit" @click="onSubmit">新增費用項目</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  props: ['fields', 'renderFields', 'token'],
  data() {
    return {
      form: {
        category: "",
      }
    }
  },
  methods: {
    getFieldName(item) {
      if( item === "category") return "種類"
    },
    onSubmit() {
      this.axios.post('/costs', {
        cost: {
          category: this.form.category
        }
      }).then(response => {
        this.$emit('costs-change', response.data);
        this.form.category='';
      }).catch(err => console.error(err));
    }
  }
}
</script>

<style lang="scss" scoped>
  .vue-form__fields {
    display: inline-block;
  }
</style>
