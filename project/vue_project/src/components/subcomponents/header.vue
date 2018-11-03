<template>
  <div class="app_header">
      <div class="top">
        <div class="logo">
            <img src="../../img/header.png">
        </div>
        <div class="search">
          <div>
            <input type="text" placeholder="请输入搜索内容">
            <mt-button>搜索</mt-button>
          </div>
        </div>
        <div class="do">
          <router-link to="/cart"><img src="../../img/order.png">&nbsp;|&nbsp;</router-link>
          <router-link to="/cart"><img src="../../img/care.png">&nbsp;|&nbsp;</router-link>
          <router-link to="/cart"><img src="../../img/shop_car.png" alt="">&nbsp;|&nbsp;</router-link>
          <router-link to="/register">注册&nbsp;|&nbsp;</router-link>
          <router-link to="/login">登录</router-link>
        </div>
      </div>
      <div class="navbar">
        <div class="classify">
          <div>
            <img src="../../img/classify.png"><a href="#">所有分类</a>
            <ul class="">
              <li>
                <a href="#">宠物服饰&nbsp;&nbsp;&nbsp;&nbsp;></a>
                <ul>
                  <li><a href="#"></a></li>
                </ul>
              </li>
              <li><a href="#">宠物玩具&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
              <li><a href="#">清洁美容&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
              <li><a href="#">医疗用品&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
              <li><a href="#">宠物主食&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
              <li><a href="#">宠物零食&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
            </ul>
          </div>
          
        </div>
        <ul>
          <li><router-link to="/index">首页</router-link></li>
          <li @click="pushiid(0)"><a>所有商品</a></li>
          <li v-for="item in navlist" :key="item.iid" @click="pushiid(item.iid)"><a>{{item.fname}}</a></li>
        </ul>
      </div>
  </div>
</template>
<script>
  export default {
      data(){
          return{
              navlist:[],
          }
      },
      methods:{
          pushiid(iid){
            this.$emit("getInfo",iid)
            this.$router.push({path:"/goodslist/"+iid});
          },
          getNavList(){
                this.$http.get("product/navlist").then(result=>{
                    // console.log(result);
                    this.navlist=result.body;
                });
            },
      },
      created(){
         this.getNavList();
      }
  }
</script>
<style>
.app_header{
  background:#F6E8D7;
  width:100%;
}
.app_header .top{
  display: flex;
  justify-content: space-around;
  text-align: center;
}
.app_header .top .logo{
  width:30%;
  margin-top:10px;
}
.app_header .top .search{
  width:40%;
}
.app_header .top .search>div{
  display: flex;
  margin: 0 auto;
  padding:45px 0px;
  width:65%;
}
.app_header .top .search input{
  border:2px solid red;
  padding:3px;
  margin-bottom: 0;
  height:40px;
  position: relative;
  right:-2px;
  font-size:16px;
}
.app_header .top .search button{
  height:40px;
  padding-right:20px;
  border-radius: 0 3px 3px 0;
  background: red;
  font-size:16px;
  color:#fff;
}
.app_header .top .do{
  width:30%;
  padding:53px 0;
  font-size:14px;
}
.app_header .top .do a{ 
  color:black;
}
.app_header .top .do a img{
  width:18px;
  height:18px;
}
.app_header .navbar{
  background: rgba(0,0,0,.1);
  display: flex;
}
.app_header .navbar .classify{
  width:15%;
}

.app_header .navbar .classify>div{
  float:right;
  text-align:center;
  width:140px;
  background: rgba(0,0,0,.7);
  line-height:40px;
}
.app_header .navbar .classify>div a{
  font-size:18px;
  color:white;
}
.app_header .navbar .classify ul{
  list-style: none;
  padding:0;
  margin:0;
  text-align:center;
  width:140px;
  background: rgba(0,0,0,.7);
  line-height:50px;
  position: absolute;
  display: none;
  z-index:100;
}
.app_header .navbar .classify img{
  width:20px;
  vertical-align: middle;
}
.app_header .navbar .classify:hover ul{
  display: block;
}
.app_header .navbar>ul{
  width:85%;
  display: flex;
  justify-content: space-around;
  padding-left:0;
  margin: 0;
}

.app_header .navbar>ul>li{
  list-style: none;
  height:40px;
  width:14.28%;
  text-align: center;
  line-height: 40px;
}
.app_header .navbar>ul>li:hover{
  background:#fff;
}
.app_header .navbar>ul>li:hover a{
    color:#aaa;
}
.app_header .navbar>ul>li>a{
  color:#fff;
  font-size:18px;
  font-weight: bold;
}
</style>