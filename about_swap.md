哇 终于知道swap干什么用的了，如果超过内存上限，我没开swap的直接就爆了。

不打算重新装，尝试用gparted分区，但不知道怎么把它关联到swap上。现在用下面的方法解决了

首先通过命令`free`查看是否有swap 我这里swap的部分是`0 0 0`

`sudo dd if=/dev/zero of=<pathname> bs=1024 count=16000000`

这里`<pathname>` 为将要创建的一个新的文件 比如我的是在`/data/swap`一个HDD上,count 可以调整大小这里是16G，我主要用它的两个地方——1.在超过物理内存时保证不会死机，2.hibernate

大小我的个人建议根据使用具体情况估计，虽然有人说1~2被RAM大小，但是我已经16GB RAM 最多总共也不会到20GB 所以我就只分了4G,另外一个要分大的原因是用于hibernate

`sudo chmod 600 <pathname>`

`sudo mkswap <pathname>` 把这个文件转化为swap格式

`sudo swapon <pathname>` 启用swap

然后用`free`就可以看到已经启用了，用用viewnoir/gimp或者什么打开点大内存 并超过本身内存上限的 可以看到它能保护不被卡死`_(:з」∠)_`

**上面两个也都要加上sudo**虽然不加也能运行，但是 它实际上应该属于系统管理 应该是root作为所有者 而不是用户，所以应该加上sudo

有想过使用时的和hibernate用不同的文件---比如使用时用SSD,hibernate时HDD,感觉通过swapon/swapoff应该也能实现，个人没这个需求就没用弄

## quick-script

输入要多少兆 比如要2G 输入 `2048`

```shell
#!/bin/bash
# author: yexiaorain
# date: 2017-09-19
set -e

mainFun(){
  if test "$1" = ""
  then
    echo "empty size"
    return
  fi
  echo :
  sudo dd if=/dev/zero of=/swap bs=1024000 count=$1
  sudo chmod 600 /swap
  sudo mkswap /swap
  sudo swapon /swap
  sudo sysctl vm.swappiness=60
  echo "/swap swap swap defaults 0 0" >> /etc/fstab
  echo "please add `vm.swappiness = 60` to /etc/sysctl.d/99-sysctl.conf"
  read line
  sudo vim /etc/sysctl.d/99-sysctl.conf
}

mainFun $1
```


## 其他细节的配置

配置内存还是swap的优先度输入命令`sudo sysctl vm.swappiness=10` 并在`/etc/sysctl.d/99-sysctl.conf` 中添加`vm.swappiness = 10`具体数值见下方链接解释

### 开机自动挂载

`sudo vim /etc/fstab` 编辑这个文件 虽然其他的都是UUID之类的但这里我们添加`<pathname> swap swap defaults 0 0`

重启试验成功 `_(:з」∠)_`

[add/remove swap](http://www.tldp.org/HOWTO/Partition/setting_up_swap.html)

[swap size](https://askubuntu.com/questions/49109/i-have-16gb-ram-do-i-need-32gb-swap)

[hibernate without swap ](http://www.informit.com/articles/article.aspx?p=1565700)

[hibernate without swap ](https://wiki.debian.org/Hibernation/Hibernate_Without_Swap_Partition)

[swappiness](https://en.wikipedia.org/wiki/Swappiness)
