const express=require("express");
const pool=require("../pool");
const router=express.Router();


router.get("/list",(req,res)=>{
    var {pno,pageSize,key}=req.query;

    if(!pno){pno=1};
    if(!pageSize){pageSize=10};
    var obj={pno:pno,pageSize:pageSize};
    var progress=0;
    var sql="SELECT count(id) AS c WHERE lname LIKE '%小%'";
    pool.query(sql,[nid],(err,result)=>{
        if(err) throw err;
        obj.pageCount=Math.ceil(result[0].c/pageSize);
        progress+=50;
        if(progress==100){
            res.send(obj);
        }
    })

    var offset=parseInt((pno-1)*pageSize);
    pageSize=parseInt(pageSize);
    var sql="SELECT id,lname,price FROM xz.xz_laptop WHERE lname LIKE '%小%' LIMIT ?,?";;
    pool.query(sql,[offset,pageSize],(err,result)=>{
        if(err) throw err;
        obj.data=result;
        progress+=50;
        if(progress==100){
            res.send(obj);
        }
        
    })
})

module.exports=router;