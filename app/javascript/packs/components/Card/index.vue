<template>
  <el-card>
    <h3 slot="header" class="dashboard-card_title">
      {{ cardTitle }}
    </h3>
    <ul class="dashboard-card_content">
      <li v-for="item in cardContent" :key="item.year">
        <span>{{ item.year }}</span> -
        <span>{{ item.amount }}</span>
        <el-button class="dashboard-card_item_btn">{{ buttonTxt }}</el-button>
      </li>
    </ul>
  </el-card>
</template>

<script>
export default {
  props: ['cardTitle', 'cardContent','buttonTxt']
}
</script>


<style lang="scss" scoped>
  .dashboard-card_title {
    margin: 0;
  }
  .dashboard-card_content {
    list-style: none;
    padding-left: 0;
    margin: 0;

    li {
      position: relative;
      line-height: 2em;

      & + li {
        margin-top: 16px;
      }
    }
  }
  .dashboard-card_item_btn{
    float: right;
    padding: 8px 24px;
  }
</style>
