<template>
    <div id="app_cart">   
        <header-box></header-box>
        <div class="cart_container">
            <div class="title">
                <div class="check"><input type="checkbox">全选</div>
                <div class="info">商品信息</div>
                <div class="spec">规格</div>
                <div class="price">单价</div>
                <div class="count">数量</div>
                <div class="total">金额</div>
                <div class="do">操作</div>
            </div>
            <ul class="content">
                <li class="goods" v-for="item in list" :key="item.cid">
                    <div class="check"><input type="checkbox"></div>
                    <div class="info">
                        <img :src="item.img_url">
                        <p>{{item.detail}}</p>
                    </div>
                    <div class="spec">
                        <p>尺寸:{{item.spec}}</p>
                    </div>
                    <div class="price">¥{{parseFloat(item.price).toFixed(2)}}</div>
                    <div class="count">
                        <button @click="goSub(item.cid)">-</button>
                        <input type="number" :value="item.count">
                        <button @click="goAdd(item.cid)">+</button>
                    </div>
                    <div class="total">¥{{(item.price*item.count).toFixed(2)}}</div>
                    <div class="do">
                        <a href="#">移入收藏夹</a>
                        <a href="#" @click="delData(item.cid)">删除</a>
                    </div>
                </li>
            </ul>
            <div class="bottom">
                <div>
                    <div class="operation">
                        <div class="checkall">
                            <input type="checkbox"><a>全选</a>
                        </div>
                        <div class="delete"><a>删除</a></div>
                        <div class="collection"><a href="#">移入收藏夹</a></div>
                        <div class="share"><a href="#">分享</a></div>
                    </div>
                    <div class="clear">
                        <h5>已选商品0件</h5>
                        <h5>合计(不含运费):</h5>
                        <h3>¥{{getsubtotal}}</h3>
                    </div>
                </div>
                <button>结算</button>
            </div>
        </div>
        <footer-box></footer-box>
    </div>
</template>
<script>
    import {Toast} from "mint-ui";
    import header from "../subcomponents/header";
    import footer from "../subcomponents/footer";
    
    export default{
        data(){
            return{
                list:[],
            }
        },
        methods:{
            goSub(cid){
                for(var item of this.list){
                    if(item.cid==cid){
                        if(item.count<=1){return}
                            item.count--;
                    }
                }
            },
            goAdd(cid){
                for(var item of this.list){
                    if(item.cid==cid){
                        if(item.count>=99){return}
                            item.count++;
                    }
                }
            },
            delData(cid){
                for(var item of this.list){
                    if(item.cid==cid){
                        this.$http.get("cart/sub?cid="+cid).then(result=>{
                            Toast("删除成功");
                            this.getCartList();
                        })
                    }
                }
            },
            getCartList(){
                this.$http.get("cart/list").then(result=>{
                    this.list=result.body;
                })
            },
        },
        created(){
            this.getCartList();
        },
        computed:{
            getsubtotal:function(){
                var sum=0;
                for(var item of this.list){
                    sum+=item.price*item.count;
                }
                return sum.toFixed(2);
            }
        },
        components:{
            'header-box':header,  //注册子组件
            'footer-box':footer
        }
    }
</script>
<style>
ul{
    padding:0;
}
li{
    list-style: none;
}
.cart_container a{
    font-size:14px;
    color:#000 !important;
}
.cart_container{
    width:75%;
    margin:30px auto;
}

.cart_container .title,.cart_container .goods{
    display: flex;
    padding:10px;
}
.cart_container .title>div{
    font-size:16px;
    color:rgb(95, 92, 92);
}
.cart_container .goods{
    margin-top:10px;
    border:1px solid #ddd;
    box-shadow: 0 0 3px #ddd;
}
.cart_container .check{
    width:7%;
}
.cart_container .info{
    width:33%;
    display: flex;
}
.cart_container .info>img{
    width:70px;
    height:70px;
}
.cart_container .info>p{
    padding:0 10px;
    font-size: 14px;
    font-weight: bold;
    color:#000;
}
.cart_container .spec{
    width:15%
}
.cart_container .count{
    width:13%;
    display: flex;
}
.cart_container .price,.count,.cart_container .total{
    width:10%;
    display: flex;
}
.cart_container .do{
    width:12%;
}
.cart_container .goods .count>button{
    width:25px;
    height:25px;
    padding:0;
    background:#ddd;
}
.cart_container .goods .count>input{
    width:30px;
    height:25px;
    padding:2px;
    text-align: center
}
.cart_container .do a{
    font-size:12px;
    color:#aaa;
    margin-right:10px;
}
.cart_container .bottom{
    display: flex;
    margin-top:50px;
    margin-bottom:65px;
}
.cart_container .bottom>div{
    width:90%;
    display: flex;
    padding:10px;
    background: #ddd;
}
.cart_container .bottom>button{
    width:10%;
    background: red;
    font-size:20px;
    border-radius:0;
    border:0;
}
.cart_container .bottom a{
    line-height: 34px;
}
.cart_container .operation,.cart_container .clear{
    width:50%;
    display: flex;
}
.cart_container .clear{
    justify-content: flex-end;
}
.cart_container .operation>div,.cart_container .clear>h5,.cart_container .clear>h3{
    padding-right: 20px;
}
.cart_container .clear>h5{
    margin:0;
    font-size:16px;
    color:#000;
    line-height: 34px;
}
.cart_container .clear>h3{
    margin:0;
    color:#F47E7A;
    line-height: 34px;
}
</style>

