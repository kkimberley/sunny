<template>
  <section class="items-container">
    <vue-form
      :render-fields="[{
        value: 'cost_id',
        isHide: true,
      },{
        value: 'name',
        isHide: false,
      },{
        value: 'mount',
        isHide: false,
      },{
        value: 'price',
        isHide: false,
      },{
        value: 'note',
        isHide: false,
      }]"
      formName="items"
      :costId="costId"
      v-on:items-change="updateItemList"
    ></vue-form>
    <el-table
      :data="items"
      show-summary
      sum-text="合計"
    >
      <el-table-column
        label="名稱"
        prop="name"
      ></el-table-column>
      <el-table-column
        label="數量"
        prop="mount"
        sortable
      ></el-table-column>
      <el-table-column
        label="單價"
        prop="price"
        sortable
      ></el-table-column>
      <el-table-column
        label="小計"
        prop="sum"
        sortable
      ></el-table-column>
      <el-table-column
        label="備註"
        prop="note"
      ></el-table-column>
    </el-table>
  </section>
</template>

<script>
export default {
  props: ['costId'],
  mounted () {
    this.getItemList();
  },
  data() {
    return {
      items: [],
    }
  },
  methods: {
    getItemList() {
      this.axios.get(`/items/${this.$props.costId}`).then(response => {
        this.items = [...response.data];
      }).catch(err => console.error(err));
    },
    updateItemList (newData) {
      this.items = [...this.items, newData]
    }
  }
}
</script>

<style lang="scss">
  .items-container {
    .vue-form__fields {
      display: block;
    }
    .el-form-item__content {
      flex: 0 0 250px;
    }
    .el-form-item {
      display: flex;
    }
    .el-table {
      border-radius: 3px;
    }
  }
</style>
