<template>
    <div id="app_cart">   
        <header-box></header-box>
        <div class="container">
            <div class="item">
                
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
            this.getImageList();
        },
        components:{
            'header-box':header,  //注册子组件
            'footer-box':footer
        }
    }
</script>
<style>

</style>

