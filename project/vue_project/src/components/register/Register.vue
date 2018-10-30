<template>
  <div class="app_register">
      <div class="content">
        <div class="row_header">
            <h4><a href="#">新用户注册</a></h4>
            <h5><router-link to="/login">直接登录</router-link></h5>
        </div>
        <div class="row_body">
            <h4>用户昵称:</h4>
            <p><input type="text" v-model="uname" name="uname" placeholder="昵称长度3~9位"></p>
            <h5></h5>
        </div>
        <div class="row_body">
            <h4>登录密码：</h4>
            <p><input type="password" v-model="upwd" name="upwd" placeholder="密码为6~12位任意字符"/></p>
            <h5></h5>
        </div>
        <div class="row_body">
            <h4>确认密码:</h4>
            <p><input type="password" name="rupwd" placeholder="请再次输入密码"></p>
            <h5></h5>
        </div>
        <div class="row_body">
            <h4>手机号码:</h4>
            <p><input type="text" v-model="phone" name="phone" placeholder="请输入有效的手机号码"></p>
            <h5></h5>
        </div>
        <div class="row_footer">
            <button @click="regiUser">提交</button>
            <button type="reset">重置</button>
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
              upwd:"",
              phone:""
          }
      },
      methods:{
        regiUser(){
            var obj={
                uname:this.uname,
                upwd:this.upwd,
                phone:this.phone
            }
            this.$http.post("user/register",obj).then(result=>{
                console.log(result);
                Toast(result.body.msg)
                if(result.body.code!=2){
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
.app_register{
    width:100%;
    height:800px;
    margin:50px auto;
    background:url(../../img/register.png) no-repeat center center;
    background-size: cover;
    position: relative;
}
.app_register .content{
    width:600px;
    height:450px;
    background:rgba(0,0,0,.2);
    padding:50px;
    position: absolute;
    top:21%;
    right:8%;
    color:white ;
}
.app_register .content a,.app_login .content h5,.app_login .content button{
    color:white
}
.app_register .content>div{
    display: flex;
}
.app_register .content .row_header{
    margin:0 0 20px 0;
}
.app_register .content .row_header h4,.app_register .content .row_header h5{
    width:50%;
    text-align:center;
}
.app_register .content .row_body{
    margin:0;
}
.app_register .content .row_body h4{
    width:20%;
    padding:5px 0;
    font-size:16px;
}
.app_register .content .row_body p{
    width:50%;
}
.app_register .content .row_body p input{
    font-size:14px;
}
.app_register .content .row_body h5{
    width:30%;
    padding:5px 15px;
}
.app_register .content .row_footer{
    padding:0 140px;
    margin:0;
}
.app_register .content .row_footer>div:nth-child(1),.app_login .content .row_footer>span{
    padding:10px 0;
}
.app_register .content .row_footer>button{
    padding:10px 25px;
    background: #6C757D;
    border-radius: 5px;
    color:white;
}
.app_register .content .row_footer>button:nth-child(1){
    margin-right:20px;
}
</style>