const express=require("express");
const pool=require("../pool");
const router=express.Router();


router.get("/list",(req,res)=>{
    var obj={code:1,msg:[
        {id:1,name:"小辣椒",price:2100,count:1},
        {id:2,name:"华为",price:3200,count:2},
        {id:3,name:"苹果",price:5500,count:1},
    ]};
    res.send(obj);
})

module.exports=router;