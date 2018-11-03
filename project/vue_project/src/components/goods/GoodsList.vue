<template>
    <div class="app_goodslist">
        <aside-box></aside-box>
        <header-box @getInfo="getgoodslist"></header-box>
        <div class="goodslist_body">
            <div class="goodslist_nav">
                <ul class="tree">
                    <li><a @click="getgoodslist(0)">查看所有宝贝</a></li>
                    <li>
                        <span class="open">宠物服饰及配件</span>
                        <ul>
                            <li>宠物服装/雨衣</li>
                            <li>鞋子</li>
                            <li>头饰</li>
                            <li>帽子</li>
                            <li>生理裤</li>
                            <li>袜子</li>
                            <li>其他服饰及配件</li>
                        </ul>
                    </li>
                    <li><span>狗狗玩具</span>
                        <ul>
                            <li>发声玩具</li>
                            <li>橡胶球/球星玩具</li>
                            <li>绳结玩具</li>
                            <li>漏食球</li>
                        </ul>
                    </li>
                    <li><span>清洁用品</span>
                        <ul>
                            <li>除味剂</li>
                            <li>香波浴液</li>
                            <li>梳具</li>
                            <li>口腔清洁</li>
                            <li>眼部清洁</li>
                            <li>毛巾/浴巾/吸水毛巾</li>
                        </ul>
                    </li>
                    <li><span>生活用品</span>
                        <ul>
                            <li>牵引绳/项圈</li>
                            <li>窝/屋/帐篷</li>
                            <li>梳具</li>
                            <li>诱导剂</li>
                            <li>饮水器/水壶/喂食器</li>
                            <li>床/垫/沙发</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="goodslist_goods">
                <div class="search_count">
                    <p>共搜索到{{count}}条商品</p>
                    <hr>
                </div>
                <div class="content_body">
                    <div class="content_child" v-for="item in productlist" :key="item.lid" @click="getDetails(item.lid)">
                        <a><img :src="item.img_url"></a>
                        <p class="details">{{item.details}}</p>
                        <div class="content_text">
                            <p class="now_price">¥{{item.now_price}}</p>
                            <del class="old_price">&nbsp;&nbsp;¥{{item.old_price}}</del>
                            <p class="sall">已售:{{item.sold_count}}件</p>
                        </div>
                    </div>
                </div>
                <ul class="page">
                    <li class="prev active" @click="getPrev()"><a>上一页</a></li>
                    <li class="pno" :class="{'active':index==active}" v-for="(item,index) in pnolist" :key="item.index" @click="isActive(index)"><a>{{item}}</a></li>
                    <li class="next" @click="getNext()"><a>下一页</a></li>
                </ul>
            </div>
        </div>
        <footer-box></footer-box>
    </div>
</template>
<script>
    import {Toast} from "mint-ui";
    import header from "../subcomponents/header";
    import footer from "../subcomponents/footer";
    import aside from "../subcomponents/Aside";
    export default{
        data(){
            return{
                // item_id:this.$route.params.iid,
                productlist:[],
                count:0,
                pageCount:0,
                pageIndex:1,
                pnolist:[],
                active:0,
                // item_id:0
            }
        },
        methods:{
            getDetails(lid){
                this.$router.push({path:"/goodsinfo/"+lid});

            },
            getgoodslist(iid){
                this.pnolist=[];
                this.$http.get("product/list?item_id="+iid).then(result=>{
                    this.productlist=result.body.msg.data;
                    this.count=result.body.msg.count;
                    this.pageCount=result.body.msg.pageCount
                });
                for(var i=1;i<=this.pageCount;i++){
                    this.pnolist.push(i);
                }
            },
            
            getNext(){
                this.pageIndex++;
                var url="product/list?pno="+this.pageIndex;
                this.$http.get(url).then(result=>{
                    console.log(result)
                    if(this.pageIndex<=result.body.msg.pageCount){
                        this.productlist=result.body.msg.data;
                    }else{
                        Toast("没有更多了");
                        return;
                    }
                });
            },
            getPrev(){
                if(this.pageIndex>1){
                    this.pageIndex--;
                    var url="product/list?pno="+this.pageIndex;
                    this.$http.get(url).then(result=>{
                        this.productlist=result.body.msg.data;
                        // console.log(result.body.msg.pno);
                    })
                }
            },
            isActive:function(index){
                this.active = index;
            }
        },
        created(){
            this.getgoodslist();
            // this.getAllGoods()
        },
        mounted(){
            this.getNext();
            this.getPrev();
        },
        components:{
            'header-box':header,  //注册子组件
            'footer-box':footer,
            'aside-box':aside,
        }
    }

</script>
<style>
ul{
    list-style: none;
    padding:0 10px;
}
.app_goodslist .goodslist_body .goodslist_nav ul li{
    font-size:14px;
}
.app_goodslist{
    background: #EFEFF4;
}
.app_goodslist .goodslist_body{
    width:85%;
    margin:0 auto;
    display: flex;
    justify-content:space-between;
}
.app_goodslist .goodslist_body .goodslist_nav{
    width:14%;
    height:800px;
    background: white
}
.app_goodslist .goodslist_body .goodslist_nav ul li span{
    padding-left: 20px;
	cursor: pointer;
    background: url("../../img/add.png") no-repeat center left;
}
.app_goodslist .goodslist_body .goodslist_nav ul li ul{
	height:0;
	overflow: hidden;
	transition: all .3s linear;
}
.app_goodslist .goodslist_body .goodslist_nav ul li.open{ background: url("../../img/minus.png") no-repeat center left; }
.app_goodslist .goodslist_body .goodslist_nav ul li.open+ul{ 
	height:105px;
}
.app_goodslist .goodslist_body .goodslist_goods{
    width:85%;
    min-height:700px;
    background: white
}
.app_goodslist .goodslist_body .goodslist_goods .search_count{
    margin-top:10px;
    padding:0 10px;
}
.app_goodslist .goodslist_body .goodslist_goods .content_body{
    padding:0px 20px;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}
.app_goodslist .goodslist_goods .content_body .content_child{
    box-shadow: 0 0 3px #EFEFF4;
    margin-bottom: 20px;
    width:29%;
    padding:3px;
    cursor: pointer;
}
.app_goodslist .goodslist_goods .content_body .content_child .details{
    font-size:16px;
}
.app_goodslist .goodslist_goods .content_body .content_child a{
    display: block;
}
.app_goodslist .goodslist_goods .content_body .content_child img{
    width:100%;
}
.app_goodslist .goodslist_goods .content_body .content_child a{
    display: block;
    overflow: hidden;
}
.app_goodslist .goodslist_goods .content_body .content_child img:hover{
    transform: scale(1.1);
    transition: all 0.3s linear;
}

.app_goodslist .goodslist_goods .content_body .content_child .content_text .now_price{
    float: left;
    color:#F47E7A;
    font-size:20px;
    font-weight:bold;
}
.app_goodslist .goodslist_goods .content_body .content_child .content_text .old_price{
    float:left;
    font-size:14px;
    color:#919196;
}
.app_goodslist .goodslist_goods .content_body .content_child .content_text .sall{
    float:right;
    font-size:16px;
}
.app_goodslist .goodslist_body .goodslist_goods .page{
    display: flex;
    justify-content: flex-end;
    margin-top:0;
    margin-bottom:20px;
}
.app_goodslist .goodslist_body .goodslist_goods .page li{
    list-style: none;
    margin-right:10px;
    padding:3px 8px;
    border: 1px solid #ccc;
}
.app_goodslist .goodslist_body .goodslist_goods .page li.active{
    border:1px solid rgb(14, 212, 212);
    
}
.app_goodslist .goodslist_body .goodslist_goods .page li.active a{
    color:rgb(14, 212, 212);
}
.app_goodslist .goodslist_body .goodslist_goods .page li a{
    font-size:16px;
    color:#aaa;
    cursor: pointer;
}

</style>
    
