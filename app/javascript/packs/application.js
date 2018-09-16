/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue/dist/vue.esm';
import axios from 'axios';
import VueAxios from 'vue-axios'
import SiteHeader from '../src/components/SiteHeader';
import VueForm from '../src/components/VueForm';
import List from '../src/components/List';
import Card from '../src/components/Card';
import Dashboard from '../src/views/Dashboard';
import Costs from '../src/views/Costs';
import Items from '../src/views/Items';
import ElementUI from 'element-ui';
import VCharts from 'v-charts';
import 'element-ui/lib/theme-chalk/index.css';
import '../src/application.scss';

Vue.use(ElementUI);
Vue.use(VCharts)
Vue.use(VueAxios, axios);
Vue.component('VueForm', VueForm)
Vue.component('List', List)
Vue.component('Card', Card)
Vue.component('SiteHeader', SiteHeader)

document.addEventListener('DOMContentLoaded', () => {
  let token = document.getElementsByName('csrf-token')[0].getAttribute('content');

  axios.defaults.headers.common['X-CSRF-Token'] = token;
  axios.defaults.headers.common['Accept'] = 'application/json';

  const app = new Vue({
    el: '#hello',
    data: {
      token,
    },
    axios,
    components: { Costs, Items, Dashboard }
  })
})
