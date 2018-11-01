const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.post("/login",(req,res)=>{
  var {uname,upwd}=req.body;
  if(!uname){
    res.send({code:-2,msg:"用户名不能为空!"})
    return;
  }
  if(!upwd){
    res.send({code:-3,msg:"用户密码不能为空"})
    return;
  }

  var sql="SELECT `uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `gender` FROM `pet_user` WHERE uname=? AND upwd=?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    if(result.length>0){
      res.send({code:1,msg:"登录成功"})
    }else{
      res.send({code:-1, msg:"用户名或密码错误!"})
    }
  })
})

router.post("/register",(req,res)=>{
  var {uname,upwd,phone}=req.body;
  if(!uname){
    res.send({code:-2,msg:"用户名不能为空"})
    return;
  }
  if(!upwd){
    res.send({code:-3,msg:"用户密码不能为空"})
    return;
  }
  if(!phone){
    res.send({code:-4,msg:"手机号不能为空"})
    return;
  }
  var sql="SELECT `uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `gender` FROM `pet_user` WHERE uname=?";
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:-5,msg:"该用户名已存在！"});
      return;
    }else{
      var sql="INSERT INTO `pet_user`(`uid`, `uname`, `upwd`, `email`, `phone`, `avatar`, `gender`) VALUES (NULL,?,?,NULL,?,NULL,NULL)";
      pool.query(sql,[uname,upwd,phone],(err,result)=>{
        if(err) throw err;
        res.send({code:2,msg:"注册成功"});
      })
    }
    
  })
  
})


module.exports=router;