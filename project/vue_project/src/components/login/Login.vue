<template>
  <div class="app_login">
      <div class="content">
        <div class="row_header">
            <h4><a href="#">登录商城</a></h4>
            <h5><router-link to="/register">新用户注册</router-link></h5>
        </div>
        <div class="row_body">
            <h4>用户昵称:</h4>
            <p><input type="text" name="uname" v-model="uname"></p>
            <h5>用户名长度为3-9位</h5>
        </div>
        <div class="row_body">
            <h4>登录密码：</h4>
            <p><input type="password" name="upwd" v-model="upwd" class="input-group"/></p>
            <h5>密码长度为6-12位</h5>
        </div>
        <div class="row_footer">
            <div>
                <input type="checkbox"/>
                <span>自动登录</span>
            </div>
            <div>
                <button @click="toSubmit">登录</button>
                <button>重置</button>
            </div>
            <span class="2">
                <a href="#">忘记密码?</a>
            </span>
        </div>
      </div>
  </div>
      
</template>
<script>
  import {Toast} from "mint-ui";
  export default {
      data(){
          return{
              uname:"",
              upwd:""
          }
      },
      methods:{
        toSubmit(){
            var obj={
                uname:this.uname,
                upwd:this.upwd
            }
            this.$http.post("user/login",obj).then(result=>{
                // console.log(result);
                Toast(result.body.msg)
                if(result.body.code!=1){
                    return;
                }else{
                    this.$router.push({path:'/index'});
                }
            });
        }
      },
      created(){
         
      },
  }
</script>
<style>
.app_login{
    width:100%;
    height:800px;
    margin:50px auto;
    background:url(../../img/register.png) no-repeat center center;
    background-size: cover;
    position: relative;
}
.app_login .content{
    width:600px;
    height:450px;
    background:rgba(0,0,0,.2);
    padding:50px;
    position: absolute;
    top:21%;
    right:8%;
    color:white ;
}
.app_login .content a,.app_login .content h5,.app_login .content button{
    color:white
}
.app_login .content>div{
    display: flex;
    justify-content: space-around;
    margin-top:30px;
}
.app_login .content .row_header h4,.app_login .content .row_header h5{
    width:50%;
    text-align: center;
}
.app_login .content .row_body h4{
    width:20%;
    padding:5px 0;
}
.app_login .content .row_body p{
    width:50%;
}
.app_login .content .row_body h5{
    width:30%;
    padding:5px 15px;
}
.app_login .content .row_footer{
    padding:0 50px;
}
.app_login .content .row_footer>div:nth-child(1),.app_login .content .row_footer>span{
    padding:10px 0;
}
.app_login .content .row_footer>div>button{
    padding:10px 20px;
    background: #6C757D;
    border-radius: 5px;
}
.app_login .content .row_footer>div>button:nth-child(1){
    margin-right:20px;
}
</style>