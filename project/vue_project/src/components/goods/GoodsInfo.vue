<template>
    <div id="app_goodsinfo">   
        <aside-box></aside-box>
        <header-box></header-box>
        <div class="container">
            <div class="left">
                <img src="http://127.0.0.1:3000/img/products/md/1.1.1-md.jpg">
                <ul>
                    <li v-for="item in imagelist" :key="item.cid"><img :src="item.sm" data-md="item.md" data-lg="item.lg"></li>
                    
                </ul>
            </div>
            <div class="right">
                <div class="title">{{details.details}}</div>
                <div>
                    <div class="detail">
                        <div class="price">
                            <p class="oldprice">¥{{details.old_price}}</p>
                            <p class="newprice">¥{{details.now_price}}</p>
                        </div>
                        <div class="data">
                            <p class="comment">117<br>累计评论</p>
                            <p class="sallcount">{{details.sold_count}}<br>交易成功</p>
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
                    <a v-for="(item,index) in spec" :key="item.index" :class="{'checked': index == active}" @click="check_show(index)">{{item}}</a>
                </div>
                <div class="count">
                    <p>数量</p>
                    <div>
                        <button @click="goSub">-</button>
                        <input type="number" v-model="num">
                        <button @click="goAdd">+</button>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;件(库存234件)</p>
                    </div>
                </div>
                <div class="btn">
                    <button class="sall">立即购买</button>
                    <button class="joincart" @click="postCart">加入购物车</button>
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
                spec:[],
                imagelist:[],
                num:1,
                active:0
            }
        },
        methods:{
            // addCart(){
            //     //修改vuex中共享数据,参数方法名称
            //     this.$store.commit("increment",this.num);
            // },
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
                    this.details=result.body[0];
                    var specs=result.body[0].spec.split(",");
                    this.spec=specs;
                })
            },
            getImageList(){
                var url="product/goodspic?lid="+this.lid;
                this.$http.get(url).then(result=>{
                    this.imagelist=result.body;
                    console.log(this.imagelist)
                })
            },
            check_show: function(index) {
                this.active = index;
            },
            postCart(){
                var product_id=this.lid;
                var detail=this.details.details;
                var spec=this.spec[this.active];
                var count=this.num; 
                var price=this.details.now_price;
                var img_url=this.imagelist[0].sm; 
                var url="cart/add";
                var obj={
                    product_id:product_id,
                    detail:detail,
                    spec:spec,
                    count:count,
                    price:price,
                    img_url:img_url    
                };
                console.log(obj)
                this.$http.post(url,obj).then(result=>{
                    console.log(result);
                    Toast("添加成功")
                })
            },
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
    width:75%;
    border:1px solid #ddd;
    box-shadow: 0 0 3px #ddd;
    display: flex;
}
.container .left{
    width:45%;
    padding-right:50px;
}
.container .left>img{
    width:100%;
}
.container .right{
    width:55%;
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
    /* width:25%; */
    padding:15px 20px 0 0;
    
}
.container .left>ul>li>img{
    width:75px;
}
.container .right .title{
    font-size: 16px;
    font-weight:bold;
}
.right .detail{
    padding:10px 20px;
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
    /* margin-top:10px; */
    font-size:16px;
    color:rgb(148, 144, 144);
}
.right .spec{
    display: flex;
    margin-top:20px;
}
.right .spec>a{
    margin-right:20px;
    padding:5px 15px;
    font-size:14px;
    color:#aaa;
    border:1px solid #bbb;
}
.right .spec>a.checked{
    border:1px solid rgb(14, 212, 212);
    color:rgb(14, 212, 212);
}
.right .count{
    display: flex;
    width:100%;
}
.right .count>p{
    display: flex;
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