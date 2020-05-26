首先安装vmware

然后安装unlock让vmware支持osx

`git clone https://github.com/DrDonk/unlocker.git && cd unlocker && sudo ./lnx-install.sh` 更多可选 见下方文档

然后安装`sudo apt install dmg2img`, 用命令`dmg2img -i 下载的macox的dmg文件 -o MACOSX.iso`转换为iso，卧槽 这里我下了一个不知道是错误的还是怎么的MACOSX10.12 调了好久... 最后下了一个10.8的 终于可以跑了

现在有了能运行osx的vmware和转换出的iso，就可以正常安装了

[unlocker](https://github.com/DrDonk/unlocker)

[dmg2img](https://github.com/Lekensteyn/dmg2img)

[参考](http://blog.csdn.net/bupt073114/article/details/46622297)
