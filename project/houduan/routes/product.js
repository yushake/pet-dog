const express=require("express");
const pool=require("../pool");
const router=express.Router();

router.get("/navlist",(req,res)=>{
    var sql="SELECT `iid`, `fname` FROM `product_item`";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});
    
router.get("/list",(req,res)=>{
    // 1.参数
    var {item_id,pno,pageSize}=req.query
    // 2.设置默认参数值
    if(!pno){
        pno=1;
    }
    if(!pageSize){
        pageSize=9;
    }
    // 3.验证用户参数
    var reg=/^[0-9]{1,}$/;
    if(!reg.test(pno)){
        res.send({code:-1,msg:"页码格式不正确"});
        return;
    };
    if(!reg.test(pageSize)){
        res.send({code:-2,msg:"页大小格式不正确"});
        return;
    }
    var obj={pno:pno,pageSize:pageSize};
    var process=0;
    var offset=parseInt((pno-1)*pageSize);
    pageSize=parseInt(pageSize);
    if(item_id!=0){
        var sql="SELECT count(lid) as c FROM product_list WHERE item_id=?";
        pool.query(sql,[item_id],(err,result)=>{
            if(err) throw err;
            var count=result[0].c;
            var pageCount=Math.ceil(result[0].c/pageSize);
            obj.count=count;  //保存总条数
            obj.pageCount=pageCount;  //保存总页数
            process+=50;             //记录当前进度
            if(process==100){        //2条sql完成
                res.send({code:1,msg:obj})  //发送结果
            }
        })
        var sql="SELECT `lid`, `item_id`, `spec`, `details`, `now_price`, `old_price`, `img_url`, `sold_count`, `is_onsale` FROM `product_list`  WHERE item_id=? LIMIT ?,?";
        pool.query(sql,[item_id,offset,pageSize],(err,result)=>{
            if(err) throw err;
            obj.data=result;    //保存当前页内容
            process+=50;       //进度条加50
            if(process==100){  //如果2条sql语句全部完成
                res.send({code:1,msg:obj})   //发送结果
            }
        });
    }else{
        var sql="SELECT count(lid) as c FROM product_list";
        pool.query(sql,(err,result)=>{
            if(err) throw err;
            var count=result[0].c;
            var pageCount=Math.ceil(result[0].c/pageSize);
            obj.count=count;  //保存总条数
            obj.pageCount=pageCount;  //保存总页数
            process+=50;             //记录当前进度
            if(process==100){        //2条sql完成
                res.send({code:1,msg:obj})  //发送结果
            }
        })
        var sql="SELECT `lid`, `item_id`, `spec`, `details`, `now_price`, `old_price`, `img_url`, `sold_count`, `is_onsale` FROM `product_list` LIMIT ?,?";
        pool.query(sql,[offset,pageSize],(err,result)=>{
            if(err) throw err;
            obj.data=result;    //保存当前页内容
            process+=50;       //进度条加50
            if(process==100){  //如果2条sql语句全部完成
                res.send({code:1,msg:obj})   //发送结果
            }
        });
    }
})  

router.get("/details",(req,res)=>{
    var lid=req.query.lid;
    var sql="SELECT `lid`, `item_id`, `details`, `spec`, `now_price`, `old_price`, `img_url`, `sold_count`, `is_onsale` FROM `product_list` WHERE lid=?";
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});


router.get("/goodspic",(req,res)=>{
    var product_id=req.query.lid;
    if(product_id>7){
        product_id=1
    }
    var sql="SELECT `cid`, `product_id`, `sm`, `md`, `lg` FROM `product_pic` WHERE product_id=?";
    pool.query(sql,[product_id],(err,result)=>{
        if(err) throw err;
        // console.log(result);
        res.send(result);
    })
});


module.exports=router;