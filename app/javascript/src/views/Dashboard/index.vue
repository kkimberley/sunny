<template>
  <section>
    <el-row :gutter="20">
      <el-col :span="6">
        <card cardTitle='收入' :cardContent="incomes" buttonTxt='年度明細'></card>
      </el-col>
      <el-col :span="6">
        <card cardTitle='成本' :cardContent="costs" buttonTxt='年度明細'></card>
      </el-col>
      <el-col :span="6">
        <card cardTitle='費用' :cardContent="expenses" buttonTxt='年度明細'></card>
      </el-col>
      <el-col :span="6">
        <card cardTitle='損益表' :cardContent="expenses" buttonTxt='年度明細'></card>
      </el-col>
    </el-row>
    <div class="dashboard-chart">
      <ve-histogram
        :data="getChartData"
        :extend="extend"
        :settings="chartSettings"
      ></ve-histogram>
    </div>

  </section>
</template>

<script>
  export default {
    data() {
      return {
        incomes: [
          {year: 2015, amount: 10000},
          {year: 2016, amount: 110000},
          {year: 2017, amount: 210000},
          {year: 2018, amount: 20000},
        ],
        costs: [
          {year: 2015, amount: 100},
          {year: 2016, amount: 1000},
          {year: 2017, amount: 10000},
          {year: 2018, amount: 5000},
        ],
        expenses: [
          {year: 2015, amount: 1000},
          {year: 2016, amount: 2000},
          {year: 2017, amount: 3000},
          {year: 2018, amount: 6000},
        ],
        extend: {
          series: {
            label: { show: true, position: "top" }
          }
        },
        chartSettings: {
          labelMap: {
            income: '收入',
            cost: '成本' ,
            expense: '費用',
          }
        }
      }
    },
    computed: {
      getChartData () {
        const data = this.$data.incomes.map((item, index) => {
          return {
            date: item.year,
            income: item.amount,
            cost: this.$data.costs[index].amount,
            expense: this.$data.expenses[index].amount,
          }
        });

        return {
          columns: ['date', 'income', 'cost' ,'expense'],
          rows: data
        };
      }
    }
  }
</script>
