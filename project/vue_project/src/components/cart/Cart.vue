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
                <li class="goods">
                    <div class="check"><input type="checkbox"></div>
                    <div class="info">
                        <img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg" alt="">
                        <p>商品详细信息hahahahhahhahahahahah</p>
                    </div>
                    <div class="spec">
                        <p>尺寸</p>
                        <p>颜色</p>
                    </div>
                    <div class="price">¥19.00</div>
                    <div class="count">
                        <button @click="goSub">-</button>
                        <input type="number" v-model="num">
                        <button @click="goAdd">+</button>
                    </div>
                    <div class="total">¥19.00</div>
                    <div class="do">
                        <a href="#">移入收藏夹</a>
                        <a href="#">删除</a>
                    </div>
                </li>
                <li class="goods">
                    <div class="check"><input type="checkbox"></div>
                    <div class="info">
                        <img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg" alt="">
                        <p>商品详细信息hahahahhahhahahahahah</p>
                    </div>
                    <div class="spec">
                        <p>尺寸</p>
                        <p>颜色</p>
                    </div>
                    <div class="price">¥19.00</div>
                    <div class="count">
                        <button @click="goSub">-</button>
                        <input type="number" v-model="num">
                        <button @click="goAdd">+</button>
                    </div>
                    <div class="total">¥19.00</div>
                    <div class="do">
                        <a href="#">移入收藏夹</a>
                        <a href="#">删除</a>
                    </div>
                </li>
                <li class="goods">
                    <div class="check"><input type="checkbox"></div>
                    <div class="info">
                        <img src="http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg" alt="">
                        <p>商品详细信息hahahahhahhahahahahah</p>
                    </div>
                    <div class="spec">
                        <p>尺寸</p>
                        <p>颜色</p>
                    </div>
                    <div class="price">¥19.00</div>
                    <div class="count">
                        <button @click="goSub">-</button>
                        <input type="number" v-model="num">
                        <button @click="goAdd">+</button>
                    </div>
                    <div class="total">¥19.00</div>
                    <div class="do">
                        <a href="#">移入收藏夹</a>
                        <a href="#">删除</a>
                    </div>
                </li>
            </ul>
            <div class="bottom">
                <div>
                    <div class="operation">
                        <div class="checkall">
                            <input type="checkbox">全选
                        </div>
                        <div class="delete"><a href="#">删除</a></div>
                        <div class="collection"><a href="#">移入收藏夹</a></div>
                        <div class="share"><a href="#">分享</a></div>
                    </div>
                    <div class="clear">
                        <p>已选商品0件</p>
                        <p>合计(不含运费):</p><h5>¥19</h5>
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
                lid:this.$route.params.lid,
                num:1
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
                    // console.log(result);
                    this.details=result.body[0];
                    var specs=result.body[0].spec.split(",");
                    this.spec=specs;
                    // console.log(this.details);
                    // console.log(this.spec);
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
.cart_container .goods{
    margin-top:10px;
    border:1px solid #ddd;
    box-shadow: 0 0 3px #ddd;
}
.cart_container .check{
    width:7%;
}
.cart_container .info{
    width:35%;
    display: flex;
}
.cart_container .info>img{
    width:70px;
    height:70px;
}
.cart_container .info>p{
    padding:0 10px;
    font-size: 16px;
    color:#000;
}
.cart_container .spec{
    width:13%
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
    margin-top:30px;
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
    font-size:18px;
    border-radius:0;
    border:0;
}
.cart_container .operation,.cart_container .clear{
    width:50%;
    display: flex;
}
.cart_container .clear{
    justify-content: flex-end;
}
.cart_container .operation>div,.cart_container .clear>p,.cart_container .clear>h5{
    padding-right: 20px;
}

</style>

