// 1:加载模块 express
const express=require("express");
const bodyParser=require("body-parser");

// 1.1加载模块文件
const index=require("./routes/index");
const product=require("./routes/product");
const cart=require("./routes/cart");
const user=require("./routes/user");

var app=express();

app.use(bodyParser.urlencoded({extended:false}));

// 2.1加载处理跨域模块
const cors=require("cors");
// 2.2允许哪个地址跨域访问
app.use(cors({
    origin:["http://127.0.0.1:3001"],
    credentials:true
}));
// 3.绑定监听端口
app.listen(3000);

// 4.挂载静态资源
app.use(express.static("public"));
// 5.将图片轮播模块加载当前应用中指定访问路径
app.use("/index",index);
app.use("/product",product);
app.use("/cart",cart);
app.use("/user",user);



