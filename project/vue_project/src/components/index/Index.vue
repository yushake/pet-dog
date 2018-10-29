<template>
    <div class="app">
        <!-- 首页组件Index.vue -->
        <aside-box></aside-box>
        <!-- 头部 -->
        <header-box></header-box>
        <!-- 1.轮播图 -->
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="item in imagelist" :key="item.id">
                <img :src="item.img_url">
            </mt-swipe-item>
        </mt-swipe>
        <!-- 2.商品列表 -->
        <!-- 动图 -->
        <div class="falsh">
            <h2>LOOK&nbsp;&nbsp;LOOK</h2>
            <h1>LOOK&nbsp;&nbsp;LOOK</h1>
            <div class="link">
                <div>
                    <img src="../../img/1.gif" >
                    <h3>遛狗绳skr</h3>
                    <p><a>点击查看></a></p>
                </div>
                <div>
                    <img src="../../img/2.gif" >
                    <h3>时尚窝垫来袭</h3>
                    <p><a>点击查看></a></p>
                </div>
                <div>
                    <img src="../../img/3.gif" >
                    <h3>8月爆卖狗子衣</h3>
                    <p><a>点击查看></a></p>
                </div>
            </div>
        </div>
        <!-- 内容 -->
        <!-- 1F 秋季新品-->
        <div class="one">
            <div class="content">
                <div class="content_head">
                    <div class="content_left"><img src="http://127.0.0.1:3000/img/index/1f.jpg"></div>
                    <div class="content_right">
                        <h3>Autumn</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Labore, commodi perferendis. Atque, culpa corporis! Totam ex, possimus, corrupti nam optio debitis eligendi facilis repellat dicta quod, nihil beatae maiores perferendis?</p>
                        <h4>秋季新品</h4>
                    </div>
                </div>
                <div class="content_body">
                    <div class="content_child" v-for="item in goodslist.slice(0,6)" :key="item.lid" @click="getDetails(item.lid)">
                        <a><img :src="item.pic"></a>
                        <p class="details">{{item.details}}</p>
                        <div class="content_text">
                            <p class="price">¥{{item.price}}</p>
                            <p class="sall">&nbsp;&nbsp;已售:{{item.sold_count}}件</p>
                            <p class="more">...</p>
                        </div>
                    </div>
                </div>
                <div class="btn"><mt-button type="danger">查看更多</mt-button></div>  
            </div>
        </div>
        <!-- 2F -->
        <div class="two">
            <div class="content">
                <div class="content_head">
                    <div class="content_left"><img src="http://127.0.0.1:3000/img/index/2f.jpg"></div>
                    <div class="content_right">
                        <h3>End</h3>
                        <h3>Season</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Labore, commodi perferendis. Atque, culpa corporis! Totam ex, possimus, corrupti nam optio debitis eligendi facilis repellat dicta quod, nihil beatae maiores perferendis?</p>
                        <h4>季末薄款</h4>
                    </div>
                </div>
                <div class="content_body">
                    <div class="content_child"  v-for="item in goodslist.slice(6,12)" :key="item.lid">
                        <a><img :src="item.pic"></a>
                        <p class="details">{{item.details}}</p>
                        <div class="content_text">
                            <p class="price">¥{{item.price}}</p>
                            <p class="sall">&nbsp;&nbsp;已售:{{item.sold_count}}件</p>
                            <p class="more">...</p>
                        </div>
                        
                    </div>
                </div>
                <div class="btn"><mt-button type="danger">查看更多</mt-button></div>
            </div>
        </div>
        <!-- 3F -->
        <div class="three">
            <div class="content">
                <div class="content_head">
                    <div class="content_left"><img src="http://127.0.0.1:3000/img/index/3f.jpg"></div>
                    <div class="content_right">
                        <h3>Pet</h3>
                        <h3>Toys</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Labore, commodi perferendis. Atque, culpa corporis! Totam ex, possimus, corrupti nam optio debitis eligendi facilis repellat dicta quod, nihil beatae maiores perferendis?</p>
                        <h4>宠物玩具</h4>
                    </div>
                </div>
                <div class="content_body">
                    <div class="content_child" v-for="item in goodslist.slice(12,18)" :key="item.lid">
                        <a><img :src="item.pic"></a>
                        <p class="details">{{item.details}}</p>
                        <div class="content_text">
                            <p class="price">¥{{item.price}}</p>
                            <p class="sall">&nbsp;&nbsp;已售:{{item.sold_count}}件</p>
                            <p class="more">...</p>
                        </div>
                        
                    </div>
                </div>
                <div class="btn"><mt-button type="danger">查看更多</mt-button></div>
            </div>
        </div>
        <!-- 4F -->
        <div class="four">
            <div class="content">
                <div class="content_head">
                    <div class="content_left"><img src="http://127.0.0.1:3000/img/index/4f.jpg"></div>
                    <div class="content_right">
                        <h3>Beauty</h3>
                        <h3>Clean</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Labore, commodi perferendis. Atque, culpa corporis! Totam ex, possimus, corrupti nam optio debitis eligendi facilis repellat dicta quod, nihil beatae maiores perferendis?</p>
                        <h4>美容清洁</h4>
                    </div>
                </div>
                <div class="content_body">
                    <div class="content_child" v-for="item in goodslist.slice(18,24)" :key="item.lid">
                        <a><img :src="item.pic"></a>
                        <p class="details">{{item.details}}</p>
                        <div class="content_text">
                            <p class="price">¥{{item.price}}</p>
                            <p class="sall">&nbsp;&nbsp;已售:{{item.sold_count}}件</p>
                            <p class="more">...</p>
                        </div>
                        
                    </div>
                </div>
                <div class="btn"><mt-button type="danger">查看更多</mt-button></div>
            </div>
        </div>
        <!-- 5F -->
        <div class="five">
            <div class="content">
                <div class="content_head">
                    <div class="content_left"><img src="http://127.0.0.1:3000/img/index/5f.jpg"></div>
                        <div class="content_right">
                        <h3>Everyday</h3>
                        <h3>Items</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Labore, commodi perferendis. Atque, culpa corporis! Totam ex, possimus, corrupti nam optio debitis eligendi facilis repellat dicta quod, nihil beatae maiores perferendis?</p>
                        <h4>日常用品</h4>
                    </div>
                </div>
                <div class="content_body">
                    <div class="content_child"  v-for="item in goodslist.slice(24)" :key="item.lid">
                        <a><img :src="item.pic"></a>
                        <p class="details">{{item.details}}</p>
                        <div class="content_text">
                            <p class="price">¥{{item.price}}</p>
                            <p class="sall">&nbsp;&nbsp;已售:{{item.sold_count}}件</p>
                            <p class="more">...</p>
                        </div>
                        
                    </div>
                </div>
                <div class="btn"><mt-button type="danger">查看更多</mt-button></div>  
            </div>
        </div>
        <!-- end -->
        <div class="end">
            <img src="http://127.0.0.1:3000/img/more.jpg">
        </div>
        <!-- 底部 -->
        <footer-box></footer-box>
    </div>
</template>
<script>
    import {Toast} from "mint-ui";
    import header from "../subcomponents/header";
    import footer from "../subcomponents/footer";
    import aside from "../subcomponents/Aside";
    export default {
        data(){
            return{
                imagelist:[],
                goodslist:[]
            }
        },
        methods:{
            getDetails(lid){
                this.$router.push({path:"/goodsinfo/"+lid});
            },
            getImageList(){
                // 获取图片轮播数据
                var url="index/imagelist";
                this.$http.get(url).then(result=>{
                    if(result.body.code==1){
                        this.imagelist=result.body.msg;
                    }else{
                        // 出错提示
                        Toast("加载轮播图片失败...");
                    }
                })
            },
            getGoodsList(){
                this.$http.get("index/goodslist").then(result=>{
                    console.log(result);
                    this.goodslist=result.body.msg;
                });
            }
        },
        created(){
           this.getImageList();
           this.getGoodsList();
        },
        components:{
            'header-box':header,  //注册子组件
            'footer-box':footer,
            'aside-box':aside,
        }
    }
</script>
<style>
.app .mint-swipe{
    height:600px;
} 
.app .mint-swipe img{
    width:100%;
    height:100%;
}
.app .falsh{
    text-align: center;
    box-shadow: 0 0 1px #EFEFF4;
    margin-bottom:20px !important;
    padding:30px 60px 30px 60px;
}
.app .falsh>h2{
    font-size:44px;
    font-style:italic;
}
.app .falsh>h1{
    font-size:64px;
    font-style:italic;
}
.app .falsh .link{
    margin-top:50px;
    margin-bottom:30px;
    display: flex;
    justify-content: space-around;
}
.app .falsh .link>div{
    width:24%;
    padding:30px;
    border:1px solid black;
}
.app .falsh .link>div img{
    width:100%;
}
.app .falsh .link>div>p>a{
    color:#8F8F94;
    font-size:16px;
}
.app .falsh,.app .content{
    width:80%;
    margin:0 auto;
    background: white;
    padding:50px 60px 30px 60px;
    margin-top:20px;
}
.app .falsh{
    margin-top:0 !important;
}
.app .content .content_head{  
    display: flex;
    box-shadow: 0 0 1px #EFEFF4;
    padding: 50px 100px;
}
.app .content .content_head .content_left{
    width:55%;
}
.app .content .content_head .content_right{
    width:45%;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
}
.app .content .content_head .content_left img{
    padding-right:100px;
    width:100%;
    height:100%;
}
.app .content .content_head .content_right h3{
    color:#F47E7A;
    font-size:52px;
    font-style: italic;
}
.app .content .content_head .content_right h4{
    font-size:24px;
    padding:10px 23px;
    width:150px;
    border: 1px solid black;
}
.app .content_right p{
    font-size:20px;
}
.app .content .content_body{
    margin-top:30px;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}
.app .content .content_body .content_child{
    box-shadow: 0 0 3px #EFEFF4;
    margin-bottom: 20px;
    width:27%;
    cursor: pointer;
}
.app .content .content_body .content_child:hover{
    transform: scale(1.02);
    box-shadow: 3px 3px 20px #b7b7b7 ;
    transition: all 0.3s linear;
}
.app .content .content_body .content_child .content_text,.app .content .content_body .content_child .details{
    padding:0 20px 10px 10px;
    font-size:15px;
}
.app .content .content_body .content_child .content_text .price{
    float: left;
    color:#F47E7A;
    font-size:22px;
    font-weight:bold;

}
.app .content .content_body .content_child .content_text .sall{
    float:left;
    font-size:16px;
}
.app .content .content_body .content_child .content_text .more{
    float:right;
    font-size:20px;
}
.app .content .content_body img{
    width:100%;
    cursor: pointer;
}
.app .content .btn{
    margin-top:20px;
    text-align: center;
    width:100%;
}
.app .content .btn button{
    background: #F47E7A;
    width:150px;
    height:40px;
    border-radius: 20px;
}

.app .end{
    width:80%;
    margin:20px auto;

}
.app .end img{
    width:100%;
}
</style>