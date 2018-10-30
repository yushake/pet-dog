SET NAMES UTF8;
DROP DATABASE IF EXISTS pet;
CREATE DATABASE pet CHARSET=UTF8;
USE pet;



/*用户信息*/
CREATE TABLE pet_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(32),
  phone VARCHAR(16),
  avatar VARCHAR(128),  #头像图片路径
  gender INT
);

/*收货地址信息*/
CREATE TABLE receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  receiver VARCHAR(16), #接收人姓名
  province VARCHAR(16), #省
  city VARCHAR(16),     #市
  county VARCHAR(16),   #县
  address VARCHAR(64),  #详细地址
  cellphone VARCHAR(16),#联系电话

  is_default BOOLEAN    #是否为默认地址
);

/*购物车*/
CREATE TABLE pet_car_item(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,    #商品编号
  detail VARCHAR(64),
  spec VARCHAR(32),
  count INT,         #购买数量
  price VARCHAR(8),
  img_url VARCHAR(64)
);

/*用户订单*/
/*CREATE TABLE order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,            #订单状态
  order_time BIGINT,     #下单时间
  pay_time BIGINT,       #付款时间
  deliver_time BIGINT,   #发货时间
  received_time BIGINT   #签收时间
);*/

/*用户订单明细*/
CREATE TABLE order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,    #订单编号
  product_id INT,  #商品编号
  count INT        #购买数量
);

/*商品分类*/
CREATE TABLE product_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/*商品信息*/
CREATE TABLE product_list(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  item_id INT,        #所属商品分类编号
  -- pname VARCHAR(32),    #商品名称
  details VARCHAR(128), #商品详细信息
  spec VARCHAR(32),     #规格
  now_price VARCHAR(8),
  old_price VARCHAR(8),
  img_url VARCHAR(128),
  sold_count INT,       #已售出数量
  is_onsale BOOLEAN     #是否促销中
);

INSERT INTO product_list VALUES
(NULL,1,'狗狗衣服宠物猫咪服饰秋冬加厚毛衣泰迪贵宾可爱博美斗牛犬秋衣','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','19.98','39.90','http://127.0.0.1:3000/img/index/1.1.jpg',234,1),
(NULL,1,'宠物衣服泰迪比熊狗狗猫咪服饰秋冬公主妮子裙约克夏幼犬奶狗大衣','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','24.98','39.9','http://127.0.0.1:3000/img/index/1.2.jpg',234,1),
(NULL,1,'狗狗衣服宠物服饰猫咪泰迪比熊幼犬奶狗秋冬贵妇皮草公主外套棉衣','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','39.98','49.90','http://127.0.0.1:3000/img/index/1.3.jpg',234,1),
(NULL,1,'宠物衣服泰迪比熊博美斗牛犬服饰 小狗狗猫咪土豪奢华丝质睡衣','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','29.98','49.90','http://127.0.0.1:3000/img/index/1.4.jpg',234,1),
(NULL,1,'狗狗衣服 秋冬泰迪加厚棉衣四脚服装中小型犬比熊衣服宠物狗衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','31.98','49.99','http://127.0.0.1:3000/img/index/1.5.jpg',234,1),
(NULL,1,'小狗狗冬季加厚内绒棉背心泰迪比熊博美猫咪宠物服饰幼犬奶狗衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','29.98','59.99','http://127.0.0.1:3000/img/index/1.6.jpg',234,1),
(NULL,2,'狗狗衣服 夏装小狗服饰法斗小型犬泰迪比熊薄款衣服宠物猫咪衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','28.98','39.99','http://127.0.0.1:3000/img/index/2.1.jpg',234,1),
(NULL,2,'狗狗衣服 夏天小衣服泰迪可爱狗裙子博美夏季裙装小型犬幼犬服饰','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','22.98','32.50','http://127.0.0.1:3000/img/index/2.2.jpg',234,1),
(NULL,2,'泰迪狗狗衣服小博美衣服夏季背心T恤小型犬幼犬狗衣服宠物潮牌','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','14.98','25.50','http://127.0.0.1:3000/img/index/2.3.jpg',234,1),
(NULL,2,'宠物衣服 泰迪衣服夏装薄款博美法斗狗幼犬衣服七彩糖果polo小熊','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','14.98','29.98','http://127.0.0.1:3000/img/index/2.4.jpg',234,1),
(NULL,2,'宠物衣服泰迪约克夏小鹿犬蕾丝唯美公主风衬衫 春夏新款狗狗衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','18.98','32.50','http://127.0.0.1:3000/img/index/2.5.jpg',234,1),
(NULL,2,'18新款狗狗衣服夏装泰迪比熊衣服小型犬背心贵宾宠物衣服小狗衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','14.98','39.90','http://127.0.0.1:3000/img/index/2.6.jpg',234,1),
(NULL,3,'颜值超能打的宠物猫咪狗狗发光磨牙玩具泰迪比熊约克夏小型犬训练','均码','15.98','38.80','http://127.0.0.1:3000/img/index/3.1.jpg',234,1),
(NULL,3,'宠物玩具发声糖胶可爱泰迪小型犬互动玩具无毒无味鸡+蛋组合7个装','均码','12.98','28.80','http://127.0.0.1:3000/img/index/3.2.jpg',234,1),
(NULL,3,'宠物玩具泰迪比熊博美斗牛犬大恐龙安抚玩具磨牙耐咬发声狗玩具','均码','19.98','32.50','http://127.0.0.1:3000/img/index/3.3.jpg',234,1),
(NULL,3,'狗狗发声玩具 泰迪玩具博美比熊中小型犬玩具幼犬宠物用品 玩具','均码','9.98','21.98','http://127.0.0.1:3000/img/index/3.4.jpg',234,1),
(NULL,3,'狗狗磨牙玩具发声耐咬狗狗玩具洁齿耐咬绳结金毛哈士奇磨牙玩具','均码','18.80','35.50','http://127.0.0.1:3000/img/index/3.5.jpg',234,1),
(NULL,3,'小狗狗发声玩具互动糖胶无毒无味可爱博士熊泰迪比熊博美斗牛犬','均码','12.98','24.45','http://127.0.0.1:3000/img/index/3.6.jpg',234,1),
(NULL,4,'【2包包邮】宠物猫狗尿片100片 幼犬尿不湿狗尿垫尿布 兔子小宠','均码','28.80','44.68','http://127.0.0.1:3000/img/index/4.1.jpg',234,1),
(NULL,4,'Petcircle狗狗沐浴露 泰迪博美犬狗用品清洁浴液宠物洗澡沐浴露','均码','19.98','38.98','http://127.0.0.1:3000/img/index/4.2.jpg',234,1),
(NULL,4,'狗狗用品狗梳子 泰迪博美祛毛针梳 小型犬狗毛刷 宠物猫梳毛刷','均码','33.90','52.96','http://127.0.0.1:3000/img/index/4.3.jpg',234,1),
(NULL,4,'wow狗狗牙刷牙膏 泰迪宠物除口臭清洁牙结石清洁工具猫咪牙刷单片','均码','3.80','11.50','http://127.0.0.1:3000/img/index/4.4.jpg',234,1),
(NULL,4,'宠物用品猫咪洗澡香皂泰迪金毛萨摩耶比熊狗狗沐浴皂','均码','15.80','30.50','http://127.0.0.1:3000/img/index/4.5.jpg',234,1),
(NULL,4,'派锐 网红推荐 清理泪痕神奇又方便 猫咪狗狗泰迪去泪痕纸巾','均码','18.00','36.00','http://127.0.0.1:3000/img/index/4.6.jpg',234,1),
(NULL,5,'猫狗窝宠物用品小型犬狗屋封闭式蒙古包安全感深睡眠床泰迪博美','均码','40.00','55.00','http://127.0.0.1:3000/img/index/5.1.jpg',234,1),
(NULL,5,'猫窝狗窝宠物大中小型犬狗屋四季通用狗狗用品床泰迪猫咪封闭式','均码','39.98','59.98','http://127.0.0.1:3000/img/index/5.2.jpg',234,1),
(NULL,5,'狗狗自动伸缩牵引绳泰迪牵引比熊狗链狗绳5米小型犬可伸缩牵引绳','均码','15.98','32.69','http://127.0.0.1:3000/img/index/5.3.jpg',234,1),
(NULL,5,'狗狗铃铛项圈 蝴蝶结狗圈颈圈大中小型犬用品 宠物泰迪金毛猫咪','均码','9.90','15.69','http://127.0.0.1:3000/img/index/5.4.jpg',234,1),
(NULL,5,'不锈钢无毒猫猫泰迪比熊博美狗狗宠物食盆狗碗猫盆狗盆双盆带托','均码','18.00','36.00','http://127.0.0.1:3000/img/index/5.5.jpg',234,1),
(NULL,5,'宠物花色狗链狗绳多款式狗狗牵引绳泰迪狗链子小幼犬胸背带用品','均码','9.98','15.25','http://127.0.0.1:3000/img/index/5.6.jpg',234,1),
(NULL,1,'狗狗衣服宠物猫咪服饰秋冬加厚毛衣泰迪贵宾可爱博美斗牛犬秋衣','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','19.98','39.90','http://127.0.0.1:3000/img/index/1.1.jpg',234,1),
(NULL,1,'宠物衣服泰迪比熊狗狗猫咪服饰秋冬公主妮子裙约克夏幼犬奶狗大衣','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','24.98','39.9','http://127.0.0.1:3000/img/index/1.2.jpg',234,1),
(NULL,1,'狗狗衣服宠物服饰猫咪泰迪比熊幼犬奶狗秋冬贵妇皮草公主外套棉衣','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','39.98','49.90','http://127.0.0.1:3000/img/index/1.3.jpg',234,1),
(NULL,1,'宠物衣服泰迪比熊博美斗牛犬服饰 小狗狗猫咪土豪奢华丝质睡衣','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','29.98','49.90','http://127.0.0.1:3000/img/index/1.4.jpg',234,1),
(NULL,1,'狗狗衣服 秋冬泰迪加厚棉衣四脚服装中小型犬比熊衣服宠物狗衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','31.98','49.99','http://127.0.0.1:3000/img/index/1.5.jpg',234,1),
(NULL,1,'小狗狗冬季加厚内绒棉背心泰迪比熊博美猫咪宠物服饰幼犬奶狗衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','29.98','59.99','http://127.0.0.1:3000/img/index/1.6.jpg',234,1),
(NULL,2,'狗狗衣服 夏装小狗服饰法斗小型犬泰迪比熊薄款衣服宠物猫咪衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','28.98','39.99','http://127.0.0.1:3000/img/index/2.1.jpg',234,1),
(NULL,2,'狗狗衣服 夏天小衣服泰迪可爱狗裙子博美夏季裙装小型犬幼犬服饰','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','22.98','32.50','http://127.0.0.1:3000/img/index/2.2.jpg',234,1),
(NULL,2,'泰迪狗狗衣服小博美衣服夏季背心T恤小型犬幼犬狗衣服宠物潮牌','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','14.98','25.50','http://127.0.0.1:3000/img/index/2.3.jpg',234,1),
(NULL,2,'宠物衣服 泰迪衣服夏装薄款博美法斗狗幼犬衣服七彩糖果polo小熊','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','14.98','29.98','http://127.0.0.1:3000/img/index/2.4.jpg',234,1),
(NULL,2,'宠物衣服泰迪约克夏小鹿犬蕾丝唯美公主风衬衫 春夏新款狗狗衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','18.98','32.50','http://127.0.0.1:3000/img/index/2.5.jpg',234,1),
(NULL,2,'18新款狗狗衣服夏装泰迪比熊衣服小型犬背心贵宾宠物衣服小狗衣服','S码--适合2-5斤,M码--适合5-10斤,L码--适合10-15斤','14.98','39.90','http://127.0.0.1:3000/img/index/2.6.jpg',234,1),
(NULL,3,'颜值超能打的宠物猫咪狗狗发光磨牙玩具泰迪比熊约克夏小型犬训练','均码','15.98','38.80','http://127.0.0.1:3000/img/index/3.1.jpg',234,1),
(NULL,3,'宠物玩具发声糖胶可爱泰迪小型犬互动玩具无毒无味鸡+蛋组合7个装','均码','12.98','28.80','http://127.0.0.1:3000/img/index/3.2.jpg',234,1),
(NULL,3,'宠物玩具泰迪比熊博美斗牛犬大恐龙安抚玩具磨牙耐咬发声狗玩具','均码','19.98','32.50','http://127.0.0.1:3000/img/index/3.3.jpg',234,1),
(NULL,3,'狗狗发声玩具 泰迪玩具博美比熊中小型犬玩具幼犬宠物用品 玩具','均码','9.98','21.98','http://127.0.0.1:3000/img/index/3.4.jpg',234,1),
(NULL,3,'狗狗磨牙玩具发声耐咬狗狗玩具洁齿耐咬绳结金毛哈士奇磨牙玩具','均码','18.80','35.50','http://127.0.0.1:3000/img/index/3.5.jpg',234,1),
(NULL,3,'小狗狗发声玩具互动糖胶无毒无味可爱博士熊泰迪比熊博美斗牛犬','均码','12.98','24.45','http://127.0.0.1:3000/img/index/3.6.jpg',234,1),
(NULL,4,'【2包包邮】宠物猫狗尿片100片 幼犬尿不湿狗尿垫尿布 兔子小宠','均码','28.80','44.68','http://127.0.0.1:3000/img/index/4.1.jpg',234,1),
(NULL,4,'Petcircle狗狗沐浴露 泰迪博美犬狗用品清洁浴液宠物洗澡沐浴露','均码','19.98','38.98','http://127.0.0.1:3000/img/index/4.2.jpg',234,1),
(NULL,4,'狗狗用品狗梳子 泰迪博美祛毛针梳 小型犬狗毛刷 宠物猫梳毛刷','均码','33.90','52.96','http://127.0.0.1:3000/img/index/4.3.jpg',234,1),
(NULL,4,'wow狗狗牙刷牙膏 泰迪宠物除口臭清洁牙结石清洁工具猫咪牙刷单片','均码','3.80','11.50','http://127.0.0.1:3000/img/index/4.4.jpg',234,1),
(NULL,4,'宠物用品猫咪洗澡香皂泰迪金毛萨摩耶比熊狗狗沐浴皂','均码','15.80','30.50','http://127.0.0.1:3000/img/index/4.5.jpg',234,1),
(NULL,4,'派锐 网红推荐 清理泪痕神奇又方便 猫咪狗狗泰迪去泪痕纸巾','均码','18.00','36.00','http://127.0.0.1:3000/img/index/4.6.jpg',234,1),
(NULL,5,'猫狗窝宠物用品小型犬狗屋封闭式蒙古包安全感深睡眠床泰迪博美','均码','40.00','55.00','http://127.0.0.1:3000/img/index/5.1.jpg',234,1),
(NULL,5,'猫窝狗窝宠物大中小型犬狗屋四季通用狗狗用品床泰迪猫咪封闭式','均码','39.98','59.98','http://127.0.0.1:3000/img/index/5.2.jpg',234,1),
(NULL,5,'狗狗自动伸缩牵引绳泰迪牵引比熊狗链狗绳5米小型犬可伸缩牵引绳','均码','15.98','32.69','http://127.0.0.1:3000/img/index/5.3.jpg',234,1),
(NULL,5,'狗狗铃铛项圈 蝴蝶结狗圈颈圈大中小型犬用品 宠物泰迪金毛猫咪','均码','9.90','15.69','http://127.0.0.1:3000/img/index/5.4.jpg',234,1),
(NULL,5,'不锈钢无毒猫猫泰迪比熊博美狗狗宠物食盆狗碗猫盆狗盆双盆带托','均码','18.00','36.00','http://127.0.0.1:3000/img/index/5.5.jpg',234,1),
(NULL,5,'宠物花色狗链狗绳多款式狗狗牵引绳泰迪狗链子小幼犬胸背带用品','均码','9.98','15.25','http://127.0.0.1:3000/img/index/5.6.jpg',234,1);

/*首页商品信息*/
CREATE TABLE pet_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,
  details VARCHAR(128), #商品详细信息
  price VARCHAR(8),
  pic VARCHAR(64),
  sold_count INT       #已售出数量
);
-- 首页轮播图
CREATE TABLE index_carousel(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(64),
  title VARCHAR(24)
);
/*商品图片*/
CREATE TABLE product_pic(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,     #商品编号
  sm VARCHAR(128),
  md VARCHAR(128),
  lg VARCHAR(128)
);


/*数据导入*/
/*首页轮播图*/
INSERT INTO index_carousel VALUES
(NULL,"http://127.0.0.1:3000/img/index/banner1.jpg","图片1"),
(NULL,"http://127.0.0.1:3000/img/index/banner2.jpg","图片2"),
(NULL,"http://127.0.0.1:3000/img/index/banner3.jpg","图片3"),
(NULL,"http://127.0.0.1:3000/img/index/banner4.jpg","图片4");

/*商品首页信息*/
INSERT INTO pet_index_product VALUES
(NULL,1,'狗狗衣服宠物猫咪服饰秋冬加厚毛衣泰迪贵宾可爱博美斗牛犬秋衣','19.98','http://127.0.0.1:3000/img/index/1.1.jpg',234),
(NULL,2,'宠物衣服泰迪比熊狗狗猫咪服饰秋冬公主妮子裙约克夏幼犬奶狗大衣','24.98','http://127.0.0.1:3000/img/index/1.2.jpg',234),
(NULL,3,'狗狗衣服宠物服饰猫咪泰迪比熊幼犬奶狗秋冬贵妇皮草公主外套棉衣','39.98','http://127.0.0.1:3000/img/index/1.3.jpg',234),
(NULL,4,'宠物衣服泰迪比熊博美斗牛犬服饰 小狗狗猫咪土豪奢华丝质睡衣','29.98','http://127.0.0.1:3000/img/index/1.4.jpg',234),
(NULL,5,'狗狗衣服 秋冬泰迪加厚棉衣四脚服装中小型犬比熊衣服宠物狗衣服','31.98','http://127.0.0.1:3000/img/index/1.5.jpg',234),
(NULL,6,'小狗狗冬季加厚内绒棉背心泰迪比熊博美猫咪宠物服饰幼犬奶狗衣服','29.98','http://127.0.0.1:3000/img/index/1.6.jpg',234),
(NULL,7,'狗狗衣服 夏装小狗服饰法斗小型犬泰迪比熊薄款衣服宠物猫咪衣服','28.98','http://127.0.0.1:3000/img/index/2.1.jpg',234),
(NULL,8,'狗狗衣服 夏天小衣服泰迪可爱狗裙子博美夏季裙装小型犬幼犬服饰','22.98','http://127.0.0.1:3000/img/index/2.2.jpg',234),
(NULL,9,'泰迪狗狗衣服小博美衣服夏季背心T恤小型犬幼犬狗衣服宠物潮牌','14.98','http://127.0.0.1:3000/img/index/2.3.jpg',234),
(NULL,10,'宠物衣服 泰迪衣服夏装薄款博美法斗狗幼犬衣服七彩糖果polo小熊','14.98','http://127.0.0.1:3000/img/index/2.4.jpg',234),
(NULL,11,'宠物衣服泰迪约克夏小鹿犬蕾丝唯美公主风衬衫 春夏新款狗狗衣服','18.98','http://127.0.0.1:3000/img/index/2.5.jpg',234),
(NULL,12,'18新款狗狗衣服夏装泰迪比熊衣服小型犬背心贵宾宠物衣服小狗衣服','14.98','http://127.0.0.1:3000/img/index/2.6.jpg',234),
(NULL,13,'颜值超能打的宠物猫咪狗狗发光磨牙玩具泰迪比熊约克夏小型犬训练','15.98','http://127.0.0.1:3000/img/index/3.1.jpg',234),
(NULL,14,'宠物玩具发声糖胶可爱泰迪小型犬互动玩具无毒无味鸡+蛋组合7个装','12.98','http://127.0.0.1:3000/img/index/3.2.jpg',234),
(NULL,15,'宠物玩具泰迪比熊博美斗牛犬大恐龙安抚玩具磨牙耐咬发声狗玩具','19.98','http://127.0.0.1:3000/img/index/3.3.jpg',234),
(NULL,16,'狗狗发声玩具 泰迪玩具博美比熊中小型犬玩具幼犬宠物用品 玩具','9.98','http://127.0.0.1:3000/img/index/3.4.jpg',234),
(NULL,17,'狗狗磨牙玩具发声耐咬狗狗玩具洁齿耐咬绳结金毛哈士奇磨牙玩具','18.80','http://127.0.0.1:3000/img/index/3.5.jpg',234),
(NULL,18,'小狗狗发声玩具互动糖胶无毒无味可爱博士熊泰迪比熊博美斗牛犬','12.98','http://127.0.0.1:3000/img/index/3.6.jpg',234),
(NULL,19,'【2包包邮】宠物猫狗尿片100片 幼犬尿不湿狗尿垫尿布 兔子小宠','28.80','http://127.0.0.1:3000/img/index/4.1.jpg',234),
(NULL,20,'Petcircle狗狗沐浴露 泰迪博美犬狗用品清洁浴液宠物洗澡沐浴露','19.98','http://127.0.0.1:3000/img/index/4.2.jpg',234),
(NULL,21,'狗狗用品狗梳子 泰迪博美祛毛针梳 小型犬狗毛刷 宠物猫梳毛刷','33.90','http://127.0.0.1:3000/img/index/4.3.jpg',234),
(NULL,22,'wow狗狗牙刷牙膏 泰迪宠物除口臭清洁牙结石清洁工具猫咪牙刷单片','3.80','http://127.0.0.1:3000/img/index/4.4.jpg',234),
(NULL,23,'宠物用品猫咪洗澡香皂泰迪金毛萨摩耶比熊狗狗沐浴皂','15.8','http://127.0.0.1:3000/img/index/4.5.jpg',234),
(NULL,24,'派锐 网红推荐 清理泪痕神奇又方便 猫咪狗狗泰迪去泪痕纸巾','18.00','http://127.0.0.1:3000/img/index/4.6.jpg',234),
(NULL,25,'猫狗窝宠物用品小型犬狗屋封闭式蒙古包安全感深睡眠床泰迪博美','40.00','http://127.0.0.1:3000/img/index/5.1.jpg',234),
(NULL,26,'猫窝狗窝宠物大中小型犬狗屋四季通用狗狗用品床泰迪猫咪封闭式','39.98','http://127.0.0.1:3000/img/index/5.2.jpg',234),
(NULL,27,'狗狗自动伸缩牵引绳泰迪牵引比熊狗链狗绳5米小型犬可伸缩牵引绳','15.98','http://127.0.0.1:3000/img/index/5.3.jpg',234),
(NULL,28,'狗狗铃铛项圈 蝴蝶结狗圈颈圈大中小型犬用品 宠物泰迪金毛猫咪','9.90','http://127.0.0.1:3000/img/index/5.4.jpg',234),
(NULL,29,'不锈钢无毒猫猫泰迪比熊博美狗狗宠物食盆狗碗猫盆狗盆双盆带托','18.00','http://127.0.0.1:3000/img/index/5.5.jpg',234),
(NULL,30,'宠物花色狗链狗绳多款式狗狗牵引绳泰迪狗链子小幼犬胸背带用品','9.98','http://127.0.0.1:3000/img/index/5.6.jpg',234);

/*商品图片信息*/
INSERT INTO product_pic VALUES
(NULL,1,"http://127.0.0.1:3000/img/products/sm/1.1.1-sm.jpg","http://127.0.0.1:3000/img/products/md/1.1.1-md.jpg","http://127.0.0.1:3000/img/products/lg/1.1.1-lg.jpg"),
(NULL,1,"http://127.0.0.1:3000/img/products/sm/1.1.2-sm.jpg","http://127.0.0.1:3000/img/products/md/1.1.2-md.jpg","http://127.0.0.1:3000/img/products/lg/1.1.2-lg.jpg"),
(NULL,1,"http://127.0.0.1:3000/img/products/sm/1.1.3-sm.jpg","http://127.0.0.1:3000/img/products/md/1.1.3-md.jpg","http://127.0.0.1:3000/img/products/lg/1.1.3-lg.jpg"),
(NULL,2,"http://127.0.0.1:3000/img/products/sm/1.2.1-sm.jpg","http://127.0.0.1:3000/img/products/md/1.2.1-md.jpg","http://127.0.0.1:3000/img/products/lg/1.2.1-lg.jpg"),
(NULL,2,"http://127.0.0.1:3000/img/products/sm/1.2.2-sm.jpg","http://127.0.0.1:3000/img/products/md/1.2.2-md.jpg","http://127.0.0.1:3000/img/products/lg/1.2.2-lg.jpg"),
(NULL,2,"http://127.0.0.1:3000/img/products/sm/1.2.3-sm.jpg","http://127.0.0.1:3000/img/products/md/1.2.3-md.jpg","http://127.0.0.1:3000/img/products/lg/1.2.3-lg.jpg"),
(NULL,2,"http://127.0.0.1:3000/img/products/sm/1.2.4-sm.jpg","http://127.0.0.1:3000/img/products/md/1.2.4-md.jpg","http://127.0.0.1:3000/img/products/lg/1.2.4-lg.jpg"),
(NULL,2,"http://127.0.0.1:3000/img/products/sm/1.2.5-sm.jpg","http://127.0.0.1:3000/img/products/md/1.2.5-md.jpg","http://127.0.0.1:3000/img/products/lg/1.2.5-lg.jpg"),
(NULL,3,"http://127.0.0.1:3000/img/products/sm/1.3.1-sm.jpg","http://127.0.0.1:3000/img/products/md/1.3.1-md.jpg","http://127.0.0.1:3000/img/products/lg/1.3.1-lg.jpg"),
(NULL,3,"http://127.0.0.1:3000/img/products/sm/1.3.2-sm.jpg","http://127.0.0.1:3000/img/products/md/1.3.2-md.jpg","http://127.0.0.1:3000/img/products/lg/1.3.2-lg.jpg"),
(NULL,3,"http://127.0.0.1:3000/img/products/sm/1.3.3-sm.jpg","http://127.0.0.1:3000/img/products/md/1.3.3-md.jpg","http://127.0.0.1:3000/img/products/lg/1.3.3-lg.jpg"),
(NULL,3,"http://127.0.0.1:3000/img/products/sm/1.3.4-sm.jpg","http://127.0.0.1:3000/img/products/md/1.3.4-md.jpg","http://127.0.0.1:3000/img/products/lg/1.3.4-lg.jpg"),
(NULL,3,"http://127.0.0.1:3000/img/products/sm/1.3.5-sm.jpg","http://127.0.0.1:3000/img/products/md/1.3.5-md.jpg","http://127.0.0.1:3000/img/products/lg/1.3.5-lg.jpg"),
(NULL,4,"http://127.0.0.1:3000/img/products/sm/1.4.1-sm.jpg","http://127.0.0.1:3000/img/products/md/1.4.1-md.jpg","http://127.0.0.1:3000/img/products/lg/1.1.1-lg.jpg"),
(NULL,4,"http://127.0.0.1:3000/img/products/sm/1.4.2-sm.jpg","http://127.0.0.1:3000/img/products/md/1.4.2-md.jpg","http://127.0.0.1:3000/img/products/lg/1.4.2-lg.jpg"),
(NULL,4,"http://127.0.0.1:3000/img/products/sm/1.4.3-sm.jpg","http://127.0.0.1:3000/img/products/md/1.4.3-md.jpg","http://127.0.0.1:3000/img/products/lg/1.4.3-lg.jpg"),
(NULL,5,"http://127.0.0.1:3000/img/products/sm/1.5.1-sm.jpg","http://127.0.0.1:3000/img/products/md/1.5.1-md.jpg","http://127.0.0.1:3000/img/products/lg/1.5.1-lg.jpg"),
(NULL,5,"http://127.0.0.1:3000/img/products/sm/1.5.2-sm.jpg","http://127.0.0.1:3000/img/products/md/1.5.2-md.jpg","http://127.0.0.1:3000/img/products/lg/1.5.2-lg.jpg"),
(NULL,5,"http://127.0.0.1:3000/img/products/sm/1.5.3-sm.jpg","http://127.0.0.1:3000/img/products/md/1.5.3-md.jpg","http://127.0.0.1:3000/img/products/lg/1.5.3-lg.jpg"),
(NULL,5,"http://127.0.0.1:3000/img/products/sm/1.5.4-sm.jpg","http://127.0.0.1:3000/img/products/md/1.5.4-md.jpg","http://127.0.0.1:3000/img/products/lg/1.5.4-lg.jpg"),
(NULL,5,"http://127.0.0.1:3000/img/products/sm/1.5.4-sm.jpg","http://127.0.0.1:3000/img/products/md/1.5.4-md.jpg","http://127.0.0.1:3000/img/products/lg/1.5.4-lg.jpg"),
(NULL,6,"http://127.0.0.1:3000/img/products/sm/1.6.1-sm.jpg","http://127.0.0.1:3000/img/products/md/1.6.1-md.jpg","http://127.0.0.1:3000/img/products/lg/1.6.1-lg.jpg"),
(NULL,6,"http://127.0.0.1:3000/img/products/sm/1.6.2-sm.jpg","http://127.0.0.1:3000/img/products/md/1.6.2-md.jpg","http://127.0.0.1:3000/img/products/lg/1.6.2-lg.jpg"),
(NULL,6,"http://127.0.0.1:3000/img/products/sm/1.6.3-sm.jpg","http://127.0.0.1:3000/img/products/md/1.6.3-md.jpg","http://127.0.0.1:3000/img/products/lg/1.6.3-lg.jpg"),
(NULL,6,"http://127.0.0.1:3000/img/products/sm/1.6.4-sm.jpg","http://127.0.0.1:3000/img/products/md/1.6.4-md.jpg","http://127.0.0.1:3000/img/products/lg/1.6.4-lg.jpg"),
(NULL,7,"http://127.0.0.1:3000/img/products/sm/2.1.1-sm.jpg","http://127.0.0.1:3000/img/products/md/2.1.1-md.jpg","http://127.0.0.1:3000/img/products/lg/2.1.1-lg.jpg"),
(NULL,7,"http://127.0.0.1:3000/img/products/sm/2.1.2-sm.jpg","http://127.0.0.1:3000/img/products/md/2.1.2-md.jpg","http://127.0.0.1:3000/img/products/lg/2.1.2-lg.jpg"),
(NULL,7,"http://127.0.0.1:3000/img/products/sm/2.1.3-sm.jpg","http://127.0.0.1:3000/img/products/md/2.1.3-md.jpg","http://127.0.0.1:3000/img/products/lg/2.1.3-lg.jpg"),
(NULL,7,"http://127.0.0.1:3000/img/products/sm/2.1.4-sm.jpg","http://127.0.0.1:3000/img/products/md/2.1.4-md.jpg","http://127.0.0.1:3000/img/products/lg/2.1.4-lg.jpg"),
(NULL,7,"http://127.0.0.1:3000/img/products/sm/2.1.5-sm.jpg","http://127.0.0.1:3000/img/products/md/2.1.5-md.jpg","http://127.0.0.1:3000/img/products/lg/2.1.5-lg.jpg");

/*用户信息*/
INSERT INTO pet_user VALUES
(NULL,'毛豆','123456','maodou@qq.com','13912345678',NULL,'1'),
(NULL,'苹果','123456','maodou@qq.com','13912345678',NULL,'0'),
(NULL,'小米','123456','maodou@qq.com','13912345678',NULL,'1'),
(NULL,'奥利奥','123456','maodou@qq.com','13912345678',NULL,'0'),
(NULL,'嘟嘟','123456','maodou@qq.com','13912345678',NULL,'1'),
(NULL,'八月','123456','maodou@qq.com','13912345678',NULL,'0'),
(NULL,'宝宝','123456','maodou@qq.com','13912345678',NULL,'1'),
(NULL,'baby','123456','maodou@qq.com','13912345678',NULL,'1');

/*商品分类*/
INSERT INTO product_item VALUES
(NULL,'秋季新品'),
(NULL,'季末薄款'),
(NULL,'宠物玩具'),
(NULL,'日常用品'),
(NULL,'美容清洁');

/*商品信息*/
-- INSERT INTO product_list VALUES
-- (NULL,1,'海洋之星','2kg','abcdtfg','159','1998','true'),
-- (NULL,1,'皇冠','2kg','abcdtfg','135','1258','false'),
-- (NULL,2,'磨牙棒','500g','abcdtfg','59','1697','true'),
-- (NULL,2,'火腿肠','60包','abcdtfg','35','1264','false'),
-- (NULL,3,'福来恩','3支','abcdtfg','144','1965','true'),
-- (NULL,3,'钙片','200粒','abcdtfg','85','598','false'),
-- (NULL,4,'沐浴露','500ml','abcdtfg','88','2598','true'),
-- (NULL,4,'牙膏','50g','abcdtfg','83','3652','true'),
-- (NULL,5,'狗窝','5kg','abcdtfg','69','1568','true');