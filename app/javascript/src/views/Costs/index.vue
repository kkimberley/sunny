<template>
  <section class="costs-container">
    <vue-form
      :render-fields="[{
        value: 'category',
        isHide: false,
      }]"
      :inline="true"
      formName="costs"
      v-on:costs-change="updateCostList"
    ></vue-form>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <h2 class="costs-title">費用總表</h2>
      </div>
      <list :items="costs" />
    </el-card>
  </section>
</template>

<script>
  export default {
    mounted () {
      this.getCostList()
      console.log('in costs')
    },
    data() {
      return {
        costs: []
      }
    },
    methods: {
      getCostList() {
        this.axios.get('/costs.json').then(response => {
          this.costs = response.data
        }).catch(err => console.error(err));
      },
      updateCostList (newData) {
        console.warn('in updateCostList')
        this.costs = newData
      }
    }
  }
</script>