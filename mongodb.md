
这个是mongodb 3.x 的安装 以及权限管理的学习记录

mongodbinstall.sh :

```
#!/bin/bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64,ppc64el,s390x ] http://repo.mongodb.com/apt/ubuntu xenial/mongodb-enterprise/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-enterprise.list
sudo apt-get update
sudo apt-get install -y mongodb-enterprise
sudo service mongod start
```

首先执行上面的sh进行安装 ，安装完后

```
>mongo
MongoDB Enterprise > show dbs
admin  0.000GB
local  0.000GB
MongoDB Enterprise > use admin
switched to db admin
MongoDB Enterprise > db.runCommand({"buildInfo":1})
查看版本
MongoDB Enterprise > db.createUser({user:"su",pwd:"su", roles: [{ role: "userAdminAnyDatabase", db: "admin" }]});
创建su用户 密码也是su 有admin的权限
MongoDB Enterprise > exit
> sudo vim /etc/mongod.conf
```

编辑配置文件加上下面这个 启用认证

```
security:
  authorization: enabled
```

再重启mongd服务
```
> sudo service mongod restart
> mongo
MongoDB Enterprise > show dbs 
显示权限不够
MongoDB Enterprise > db.auth("su","su")
登录 依然不行 查了半天 说是要先use admin 再db.auth("su","su")就可以
MongoDB Enterprise > use admin
MongoDB Enterprise > db.auth("su","su")
1
MongoDB Enterprise > show dbs
admin  0.000GB
local  0.000GB
```

为数据库添加管理员 接着上面登录后的
```
MongoDB Enterprise > use ttteeesssttt
switched to db ttteeesssttt
MongoDB Enterprise > db.ccc.find()
发现是超管无权限访问的 其中的一个ccc的collection 虽然不存在 但是报错是权限错误
MongoDB Enterprise > db.createUser({user:"ttteeessstttAdmin",pwd:"123456",roles:[{role:"dbOwner",db:"ttteeesssttt"}]})
创建了有该db权限的一个admindbdb
MongoDB Enterprise > db.auth("ttteeessstttAdmin","123456")
用新的身份登录
MongoDB Enterprise > db.ccc.find()
返回空 没有权限错误成功
```

相关[1](http://www.cnblogs.com/myrunning/p/5444170.html) [2](http://blog.csdn.net/hulongbin/article/details/51261880)

官方文档 [不同的内置角色](https://docs.mongodb.com/manual/reference/built-in-roles/#built-in-roles) [用户管理api](https://docs.mongodb.com/manual/reference/method/js-user-management/)

