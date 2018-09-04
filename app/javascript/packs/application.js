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
import SiteHeader from './components/SiteHeader';
import VueForm from './components/VueForm';
import List from './components/List';
import Costs from './views/Costs';
import Items from './views/Items';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import './styles/application.scss';

Vue.use(ElementUI);
Vue.use(VueAxios, axios);
Vue.component('VueForm', VueForm)
Vue.component('List', List)

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
    components: { SiteHeader, VueForm, List, Costs, Items }
  })
})
