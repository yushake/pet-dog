const express=require("express");
const pool=require("../pool");
const router=express.Router();

router.post("/add",(req,res)=>{
    var {product_id,detail,spec,count,price,img_url}=req.body;
     var sql="INSERT INTO `pet_car_item`(`cid`, `product_id`,`detail`, `spec`, `count`, `price`, `img_url`) VALUES (NULL,?,?,?,?,?,?)";
    pool.query(sql,[product_id,detail,spec,count,price,img_url],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});

router.get("/list",(req,res)=>{
    var sql="SELECT `cid`, `product_id`, `detail`, `spec`, `count`, `price`, `img_url` FROM `pet_car_item` ORDER BY cid DESC";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});
router.get("/sub",(req,res)=>{
    var cid=req.query.cid;
    console.log(cid);
    var sql="DELETE FROM `pet_car_item` WHERE cid=?";
    pool.query(sql,[cid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});




module.exports=router;