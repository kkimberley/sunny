<template>
  <el-form ref="form" :model="form" :inline="inline">
    <div :key="index" v-for="(item, index) in renderFields" class="vue-form__fields">
      <el-form-item v-if="item.isHide !== true" :label="getFieldName(item.value)">
        <el-input v-model="form[item.value]"></el-input>
      </el-form-item>
      <el-input v-else v-model="form[item.value]" type="hidden"></el-input>
    </div>
    <el-form-item>
      <el-button type="submit" @click="onSubmit">新增費用項目</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  props: ['fields', 'renderFields', 'inline', 'formName', 'costId'],
  data() {
    return {
      form: {
        cost_id: this.$props.costId,
        category: "",
        name: "",
        mount: "",
        price: "",
        note: "",
      }
    }
  },
  mounted () {
    console.warn(this.$props.costId);
  },
  methods: {
    getFieldName(item) {
      console.warn(item)
      const fieldsMap = {
        category: "種類",
        name: "品名",
        mount: "數量",
        price: "價格",
        note: "備註",
      }

      return fieldsMap[item];
    },
    onSubmit() {
      if (this.$props.formName === "costs" ) {
        this.axios.post('/costs', {
          cost: {
            category: this.form.category
          }
        }).then(response => {
          this.$emit('costs-change', response.data);
          this.form.category='';
        }).catch(err => console.error(err));
      } else {
        this.axios.post('/items', {
          item: {
            cost_id: this.form.cost_id,
            name: this.form.name,
            mount: this.form.mount,
            price: this.form.price,
            note: this.form.note,
          }
        }).then(response => {
          this.$emit('items-change', response.data);
          this.form.name='';
          this.form.mount='';
          this.form.price='';
          this.form.note='';
        }).catch(err => console.error(err));
      }
    }
  }
}
</script>
