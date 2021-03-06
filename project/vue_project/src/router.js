import Vue from 'vue'
import Router from 'vue-router'

// 1.引入自定义的组件
import Index from "./components/index/Index";
import Login from "./components/login/Login";
import Register from "./components/register/Register";
import GoodsList from "./components/goods/GoodsList";
import GoodsInfo from "./components/goods/GoodsInfo";
import Cart from "./components/cart/Cart";


Vue.use(Router)

// 指定该组件的访问路径
export default new Router({
  mode: 'history',
  routes: [
    {path:'/',redirect:"/index"},
    {path:"/index",component:Index},
    {path:"/login",component:Login},
    {path:"/register",component:Register},
    // {path:"/allgoods",component:GoodsList},
    {path:"/goodslist/:iid",component:GoodsList,name:"goodslist"},
    {path:"/goodsinfo/:lid",component:GoodsInfo,name:"goodsinfo"},
    {path:"/cart",component:Cart}
  ]
})
