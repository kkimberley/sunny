<template>
  <section class="items-container">
    <el-tabs v-model="whichTab" @tab-click="handleTabClick">
      <el-tab-pane label="新增費用" name="origin"></el-tab-pane>
      <el-tab-pane label="費用列表" name="table"></el-tab-pane>
      <el-tab-pane label="圖表" name="chart"></el-tab-pane>
    </el-tabs>
    <div class="items-form-block" v-if="whichTab === 'origin'">
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
    </div>
    <div class="items-table-block" v-if="whichTab === 'table'">
      <el-table
        :data="items"
        show-summary
        sum-text="合計"
        @selection-change="handleSelection"
      >
        <el-table-column
          type="selection"
          width="55">
        </el-table-column>
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
    </div>
    <div class="items-chart-block" v-if="whichTab === 'chart'">
      <el-card class="chart-card">
        <ve-pie
          :data="getChartData"
          :settings="chartSettings"
        >
        </ve-pie>
      </el-card>
    </div>
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
      whichTab: 'origin',
      chartSettings: {
        offsetY: 220,
      }
    }
  },
  computed: {
    getChartData () {
      return {
        columns: ['name', 'sum'],
        rows: this.items,
      }
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
    },
    handleTabClick (tab, event) {
      console.warn(tab, event);
    },
    handleSelection (val) {
      const arr = val.map((item) => {
        return item.id
      });
      console.warn('val', val);
      console.warn('arr', arr);
    }
  }
}
</script>

