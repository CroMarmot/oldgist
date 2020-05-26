先买ECS=。=妈的还好有五天无理由秒退款，不过只有一次机会 之前买成虚拟云主机了 什么鬼:-)

买了之后 通过管理界面改密码

就可以`ssh root@界面上看到的公网ip`登入了

为了不要始终在root下就创建个用户,把下面保存为`ecsinitial.sh`并`chmod +x ./ecsinitial.sh`

```shell
#!/bin/bash
# author: yexiaorain
# date: 2017-09-19
set -e

mainFun(){
  if test "$1" = ""
  then
    echo "empty username"
    return
  fi
  useradd -d /home/"$1" -m "$1"
  passwd "$1"
  usermod -a -G sudo "$1"
  # groups "$1"
  chsh -s /bin/bash "$1"
  su - $1
}

mainFun $1
```

然后改改配置`~/.bashrc` 加加`./.ssh/authorized_keys`什么的 

~~好像也没啥要记录的~~ 主要就是别买错了 以及创建普通用户 之后就可以`ssh cromarmot@界面上看到的公网ip`登录了=。= 【国内的server也访问不了google】

[端口安全规则](https://help.aliyun.com/knowledge_detail/41938.html)

本地电脑`~/.ssh/config`写上`ServerAliveInterval 60` 让ssh和server保持连接

本地电脑`~/.ssh/config`配置别名 让ssh 每次只用输入别名 就能连接

以及发现买的小内存1G的 在node build会爆 所以还要配置虚拟内存 见我gist中的 about swap，其中设置swappiness很重要 因为ecs默认值是0
