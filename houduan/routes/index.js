const express=require("express");
const pool=require("../pool");
const router=express.Router();

// 发送轮播图片给前端
router.get("/imagelist",(req,res)=>{
    var sql=`SELECT id,img_url,title FROM index_carousel`;
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    })
})

// 发送商品列表给前端
router.get("/goodslist",(req,res)=>{
    var sql="SELECT `pid`, `lid`, `details`, `price`, `pic`, `sold_count` FROM `pet_index_product`";
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    })
});


// 依据商品编号查询出商品信息
router.get("/find",(req,res)=>{
    var obj={id:"9",title:"小辣椒 7",p_old:2199.00,p_now:2099.00,p_sn:"2199282",p_type:"青春款"}
    res.send(obj);
});

module.exports=router;