
https://segmentfault.com/a/1190000007542620

```
sudo apt install nodejs-legacy
sudo apt install npm

sudo npm install npm@latest -g

sudo npm install -g n

//安装官方最新版本
sudo n latest
//安装官方稳定版本
sudo n stable
//安装官方最新LTS版本
sudo n lts
```

卧槽 这两个之间 出现了官方bug 66666 用新版本npm+老版本node更新不了 连install都不行

所以采取 从官网wget nodejs的tar包 再用

`ln -s npm绝对路径 /usr/bin/npm`和`ln -s node绝对路径 /usr/bin/node`
