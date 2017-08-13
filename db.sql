create database `php_shop`;
use `php_shop`;

create table `shop_goods` (
	`id` bigint unsigned not null auto_increment comment '编号',
	`title` varchar(32) not null default '' comment '商品名',
	`description` varchar(255) not null default '' comment '商品简介',
	`thumb` varchar(255) not null default '' comment '缩略图',
	`buy_start` datetime default null comment '售卖开始时间',
	`buy_end` datetime default null comment '售卖结束时间',
	`max_buy_all` int unsigned not null default 0 comment '最大允许购买数量,默认0不限购',
	`max_buy_time` int unsigned not null default 0 comment '每次最多允许购买数量，默认0不限购',
	`price` int unsigned not null default 0 comment '商品单价（分）',
	`number` int unsigned not  null default 0 comment '商品总数',
	`stock` int unsigned not  null default 0 comment '商品库存',
	`create_time` datetime default null comment '创建时间',
	`update_time` datetime default null comment '修改时间',
	`status` tinyint(2) not null default 2 comment '商品状态{1:上架,2:下架}',
	primary key (`id`),
	key `idx_start_end` (`buy_start`, `buy_end`)
) engine=InnoDB auto_increment=1 default charset=utf8 comment '商品表';

create table `shop_goods_body` (
	`goods_id` bigint unsigned not null comment '商品ID',
	`notice` text default null comment '预定须知',
	`info` text default null comment '商品详情',
	primary key (`goods_id`)
) engine=InnoDB default charset=utf8 comment '商品介绍详情表';


create table `shop_order` (
	`id` bigint unsigned not null auto_increment comment '编号',
	`user_id` bigint unsigned not null comment '下单用户',
	`order_no` bigint unsigned not null comment '订单编号',
	`total_price` int unsigned not null comment '订单总价格（分）',
	`pay_status`  tinyint(2) not null comment '支付状态',
	`create_time` datetime default null comment '创建时间',
	`update_time` datetime default null comment '修改时间',
	`status` tinyint(2) not null comment '订单状态',
	primary key (`id`),
	key `idx_user_id` (`user_id`),
	unique key `uk_order_no` (`order_no`)
) engine=InnoDB auto_increment=1 default charset=utf8 comment '订单表';

create table `shop_order_info` (
	`id` bigint unsigned not null auto_increment comment '编号',
	`order_no` bigint unsigned not null comment '订单号',
	`order_value` varchar(128) default null comment '订单值',
	`goods_id` bigint unsigned not null comment '商品编号',
	`goods_title` varchar(32) not null default '' comment '商品名',
	`goods_description` varchar(255) not null default '' comment '商品简介',
	`goods_thumb` varchar(255) not null default '' comment '缩略图',
	`goods_price` int unsigned not null comment '商品单价',
	`goods_number` int unsigned not null comment '商品数量',
	primary key (`id`),
	key `idx_order_no` (`order_no`)
) engine=InnoDB auto_increment=1 default charset=utf8 comment '订单详情表';

create table `shop_pay` (
	`id` bigint unsigned not null auto_increment comment '编号',
	`goods_order_no` bigint unsigned not null comment '商品订单号',
	`pay_title` varchar(64) not null default '' comment '支付标题', 
	`pay_order_no` bigint unsigned not null comment '支付订单号',
	`unique_sequence` bigint unsigned not null comment '支付流水号',
	`status` tinyint(2) not null comment '支付状态',
	primary key (`id`),
	key `idx_goods_order_no` (`goods_order_no`)
) engine=InnoDB auto_increment=1 default charset=utf8 comment '支付表';

create table `shop_pay_type` () engine=InnoDB auto_increment=1 default charset=utf8 comment '支付方式表';







