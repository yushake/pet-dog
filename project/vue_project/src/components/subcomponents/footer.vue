<template>
  <div class="app_footer">
      <div class="up">
          <div class="up_child">
              <div class="left">
                  <h3>优</h3>
              </div>
              <div class="right">
                  <h4>品质保障</h4>
                  <h5>品质保障 购物无忧</h5>
              </div>
          </div>
          <div class="up_child">
              <div class="left">
                  <h3>七</h3>
              </div>
              <div class="right">
                  <h4>七天无理由退换货</h4>
                  <h5>为您提供售后无忧保障</h5>
              </div>
          </div>
          <div class="up_child">
              <div class="left">
                  <h3>特</h3>
              </div>
              <div class="right">
                  <h4>特色服务体验</h4>
                  <h5>为您呈现不一样的服务</h5>
              </div>
          </div>
          <div class="up_child">
              <div class="left">
                  <h3>帮</h3>
              </div>
              <div class="right">
                  <h4>帮助中心</h4>
                  <h5>您的购物指南</h5>
              </div>
          </div>
      </div>
      <hr>
      <div class="down">
          <div class="down_child">
              <h4>购物指南</h4>
              <p><a href="#">年费注册</a></p>
              <p><a href="#">开通支付宝</a></p>
              <p><a href="#">支付宝充值</a></p>
          </div>
          <div class="down_child">
              <h4>天猫保障</h4>
              <p><a href="#">发票保障</a></p>
              <p><a href="#">售后规则</a></p>
              <p><a href="#">缺货赔付</a></p>
          </div>
          <div class="down_child">
              <h4>支付方式</h4>
              <p><a href="#">快捷支付</a></p>
              <p><a href="#">信用卡</a></p>
              <p><a href="#">支付宝</a></p>
              <p><a href="#">货到付款</a></p>
          </div>
          <div class="down_child">
              <h4>商家服务</h4>
              <p><a href="#">天猫规则</a></p>
              <p><a href="#">商家入驻</a></p>
              <p><a href="#">4家中心</a></p>
              <p><a href="#">物流服务</a></p>
          </div>
          <div class="down_child">
              <h4>手机天猫</h4>
              <div>
                  <img src="../../img/app.png">
              </div>
          </div>
      </div>
  </div>
</template>
<script>
  export default {
      data(){
          return{
              
          }
      },
      methods:{
          
      },
      created(){
         
      },
  }
</script>
<style>
.app_footer{
    background:rgba(0,0,0,.4);
}
.app_footer .up,.app_footer .down{
    display: flex;
    justify-content: space-around;
}
.app_footer .up .up_child{
    display: flex;
    justify-items: flex-start;
    padding:20px 0;
}

.app_footer .up .up_child .left h3{
    margin:0;
    padding:8px;
    border: 3px solid red;
    border-radius: 50%;
    color:red;
}
.app_footer .up .up_child .right{
    margin-left:10px;
}
.app_footer .up .up_child .right h5{
    margin-top:6px;
    color:#EFEFF4;
}
.app_footer .down .down_child{
    padding: 20px 0;
}
.app_footer .down .down_child h4{
    color: #EFEFF4;
    font-size:18px;
}
.app_footer .down .down_child p a{
    color:#EFEFF4;
    font-size:14px;
}
.app_footer .down .down_child p{
    margin: 0;
}
</style>