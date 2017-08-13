## php_sho架构图
```shell
＝＝＝＝＝＝＝＝＝＝分布部署＝＝＝＝＝＝＝＝＝＝＝＝＝＝
商品服务  订单服务  支付服务
＝＝＝＝＝＝＝＝＝服务层＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

	        http或thrift协议 方式传输

＝＝＝＝＝＝＝＝（业务）缓存＝＝＝＝＝＝＝
微信      H5       web端   后台
   
公用方法写在vendor包中（类似sdk，业务端传参数引用即可）   
```


```shell
＊＊＊＊＊＊＊＊＊＊＊＊＊＊技术栈＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
＊＊＊swoole 、laravel 、thrift 、 mysql 、 redis
＊＊＊
＊＊＊
＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
```

目前服务3个、应用4个（暂时不做H5和web端）

goods_server
order_server
pay_server

admin_web
wechat_web
wap_web
pc_web
