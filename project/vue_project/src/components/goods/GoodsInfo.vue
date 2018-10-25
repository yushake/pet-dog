<template>
    <div id="app_goodsinfo">   
        <aside-box></aside-box>
        <header-box></header-box>
        <div class="container">
            <div class="left">
                <img src="http://127.0.0.1:3000/img/products/md/1.1.1-md.jpg">
                <ul>
                    <li><img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg"></li>
                    <li><img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg"></li>
                    <li><img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg"></li>
                    <li><img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg"></li>
                    <li><img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg"></li>
                    <li><img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg"></li>
                </ul>
            </div>
            <div class="right">
                <div class="title">小狗狗衣服幼犬奶狗猫咪宠物服饰春秋款彩虹牛仔衣泰迪比熊博美衣</div>
                <div>
                    <div class="detail">
                        <div class="price">
                            <p class="oldprice">¥45.00</p>
                            <p class="newprice">¥24.50</p>
                        </div>
                        <div class="data">
                            <p class="comment">117<br>累计评论</p>
                            <p class="sallcount">1425<br>交易成功</p>
                        </div>
                    </div>
                    <div class="coupon">
                        <p>优惠</p>
                        <div>
                            <div>
                                <img src="../../img/coupon.png"> <span>15元优惠券,满99可用</span>
                            </div>
                            <div>
                                <img src="../../img/coupon.png"> <span>15元优惠券,满99可用</span>
                            </div>
                            <div>
                                <img src="../../img/sales.png"> <span>本店促销活动</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="delivery">
                    <span>配送:</span><span>至雨花台区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span>快递:¥5.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span>72小时发货</span>
                </div>
                <div class="spec">
                    <p>s码</p><p>m码</p><p>l码</p>
                </div>
                <div class="count">
                    <p>数量</p>
                    <div>
                        <button>-</button>
                        <input type="text" value=1>
                        <button>+</button>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;件(库存234件)</p>
                    </div>
                </div>
                <div class="btn">
                    <button class="sall">立即购买</button>
                    <button class="joincart">加入购物车</button>
                </div>
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
                lid:this.$route.params.lid,
                details:{},
                imagelist:[]
            }
        },
        methods:{
            goSub(){
                if(this.num<=1){
                    return;
                }
                    this.num--;
            },
            goAdd(){
                if(this.num>=99){return;}
                this.num++;
            },
            // 获取当前商品数据
            getDetails(){
                // 发送请求获取数据
                this.$http.get("product/details?lid="+this.lid).then(result=>{
                    // 保存在info数据对象中
                    this.details=result.body;
                    // console.log(this.details);
                })
            },
            getImageList(){
                var url="product/goodspic?lid="+this.lid;
                this.$http.get(url).then(result=>{
                    this.imagelist=result.body;
                    console.log(this.imagelist)
                })
            }
        },
        created(){
            this.getImageList();
            this.getDetails();
            this.getImageList();
        },
        components:{
            'header-box':header,  //注册子组件
            'footer-box':footer,
            'aside-box':aside,
        }
    }
</script>
<style>
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.container{
    margin:40px auto;
    /* margin-top:20px; */
    padding:20px 40px;
    width:70%;
    border:1px solid #ddd;
    box-shadow: 0 0 3px #ddd;
    display: flex;
}
.container .left{
    width:50%;
    padding-right:50px;
}
.container .left>img{
    width:100%;
}
.container .right{
    width:50%;
}
.container .left,.container .right{
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
.container .left>ul{
    list-style: none;
    display: flex;
    justify-content: flex-start;
    overflow: hidden;
    padding:0;
}
.container .left>ul>li{
    width:25%;
    padding:20px 20px 0 0;
    
}
.container .right .title{
    font-size: 16px;
    font-weight:bold;
}
.right .detail{
    padding:20px;
    background: #FFF2E8;
}
.right .detail,.right .detail .data{
    display: flex;
    justify-content: space-between;
    margin-top:10px;
}
.right .detail .price{
    margin-top:5px;
}
.right .detail .price .oldprice{
    font-size:16px;
    text-decoration: line-through;
}
.right .detail .price .newprice{
    font-size:24px;
    color:#F47E7A;
}
.right .comment{
    padding-right:20px;
}
.right .sallcount{
    padding-left:20px;
    border-left:1px solid #ddd;
}
.right .coupon{
    padding:15px;
    background: #FFF9F5;
    font-size:14px;
}
.right .coupon p{
    margin-left:5px;
    margin-bottom:0;
}
.right .coupon>div{
    display: flex;
    flex-direction: column;
}
.right .coupon>div>div{
    display: flex;
    padding:5px;
}
.right .coupon>div>div>img{
    width:70px;
    vertical-align: middle;
    margin-right:15px;
}
.right .delivery{
    margin-top:10px;
    font-size:16px;
    color:rgb(148, 144, 144);
}
.right .spec{
    display: flex;
    margin-top:20px;
}
.right .spec>p{
    margin-right:20px;
    padding:5px 15px;
    border:1px solid #bbb;
}
.right .count{
    display: flex;
}
.right .count>p{
    line-height: 30px;
    margin-right:50px;
    font-size:16px;
}
.right .count>div>p{
    display: inline;
}
.right .count button{
    padding: 0;
    width:30px;
    height:30px;
    background: #E8E8E8;
}
.right .count input{
    width:50px;
    height:30px;
    margin-bottom:0;
    padding:0;
    text-align: center;
}
.right .btn{
    display: flex;
    justify-content: center;
    height:40px;
}
.right .btn .sall{
    width:130px;
    margin-right:10px;
    background: #FFE4D0;
}
.right .btn .joincart{
    width:170px;
    background: #FF4400;
}
</style>