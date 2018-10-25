<template>
    <div class="app_aside"> 
        <div class="talk">  
            <img src="../../img/talk.jpg">
        </div>
        <hr>
        <div class="cart">
            <p class="mui-icon mui-icon-extra mui-icon-extra-cart"></p>
            <p class="mui-tab-label">购物车</p>
            <p class="cart_count">
                <span class="mui-badge">9</span>
            </p>
        </div>
        <hr>
        <div class="mui-mbar-tab-logo mui-mbar-tab-logo-asset"></div>
    </div>
   
</template>
<script>
    import {Toast} from "mint-ui";
    export default{
        data(){
            return{
                
            }
        },
        methods:{
           
        },
        created(){
            
        }
    }
</script>
<style>
.app_aside{
    width:35px;
    height:100%;
    z-index:1000;
    background:rgba(0,0,0,.9);
    position: fixed;
    right:0;
    padding:50px 3px;
}
.app_aside .talk>img{
    width:30px;
    height:30px;
    border-radius:50%;
}
.app_aside .cart{
    text-align: center;
    padding:2px;
}
.app_aside .cart .cart_count{
    width:20px;
    height:20px;
    border-radius: 50%;
    background: red;
    margin: 0 auto;
}
.app_aside .cart .cart_count span{
    color:white;
}
</style>