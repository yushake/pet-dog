<template>
    <div id="app_cart">
        <div class="mui-card">
            <div class="mui-card-header">购物车</div>
            <div class="mui-card-content" v-for="item in list" :key="item.id">
                <div class="mui-card-content-inner">
                    <p>{{item.name}}</p>
                    <div class="count">
                    <p class="price">单价:¥{{item.price}}</p>
                        <div class="mui-numbox">
                            <button class="mui-btn mui-btn-numbox-minus" type="button" @click="setSub(item.id)">-</button>
                            <input id="test" class="mui-input-numbox" type="number" :value="item.count"/>
                            <button class="mui-btn mui-btn-numbox-plus" type="button" @click="setAdd(item.id)">+</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mui-card-footer">
                <span>小计:</span>
                <span>¥{{getsubtotal}}</span>
            </div>
        </div>
    </div>
</template>
<script>
    export default{
        data(){
            return{
                list:[]
            }
        },
        methods:{
            setSub(id){
                for(var item of this.list){
                    if(item.id==id){
                        if(item.count<=1){return}
                        item.count--;
                    }
                }
            },
            setAdd(id){
                // 获取当前购物车id,依据id将对应count自增操作
                for(var item of this.list){
                    if(item.id==id){
                        if(item.count>=99){return;}
                        item.count++;
                    }
                }
            },
            getCartList(){
                this.$http.get("cartlist/list").then(result=>{
                    this.list=result.body.msg;
                })
            }
        },
        created(){
            this.getCartList();
        },
        computed:{
            // 计算属性 计算多个数据变化
            getsubtotal:function(){
                var sum=0;
                for(var item of this.list){
                    sum+=item.price*item.count;
                }
                return sum;
            }
        }
    }
</script>
<style>
#app_cart .mui-card .mui-card-content .mui-card-content-inner .count,#app_cart .mui-card .mui-card-footer{
    display: flex;
    justify-content: space-between;
}
#app_cart .mui-card .mui-card-content .mui-card-content-inner .count .price{
    color:red
}
</style>