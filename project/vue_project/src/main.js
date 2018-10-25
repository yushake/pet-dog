import Vue from 'vue'
import App from './App.vue'
import router from './router'

import'mint-ui/lib/style.css'

Vue.config.productionTip = false

import './lib/mui/css/mui.css'

import './lib/mui/css/icons-extra.css'


import {Swipe,SwipeItem,Button} from "mint-ui"

Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);


import VueResource from "vue-resource"

Vue.use(VueResource)

Vue.filter("dateFormat",function(datestr,pattern="YYYY-MM-DD"){
  return new Date(datestr).toLocaleString();
})

Vue.http.options.root="http://127.0.0.1:3000/";

Vue.http.options.emulateJSON=true;


new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
