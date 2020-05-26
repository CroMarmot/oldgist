
0. DownLoad and install
- [mint official page](https://www.linuxmint.com/download.php), i'm using Cinnamon 64bit
- Partition:SSD(32G /, 8G swap, 88G /home) HDD(/data) [TODO learn lvm](https://gist.github.com/YeXiaoRain/950fd5592f48e67a6e7ba932594b80a6)
- [about swap](https://gist.github.com/YeXiaoRain/ec52ad8638a52cadc78fa8c6e5f9d10e)

1. Change the software sources mirrors, both Main(sonya) and Base(xenial)
- I'm using ustc(sonya) and aliyun(xenial) now

2. Install softwares from apt

```bash
sudo apt update
sudo apt install git gitg vim vim-gtk exuberant-ctags build-essential gcc-multilib chromium-browser htop goldendict kolourpaint4 gimp php apache2 steam mplayer vlc evince nodejs-legacy npm cheese viewnior gedit tree openssh-server nmap vokoscreen -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
```

Some other packages may be needed `gitk chmsee unity-tweak-tool numix-icon-theme-circle numix-gtk-theme compizconfig-settings-manager playonlinux`

3. config

[spf13-vim](https://github.com/spf13/spf13-vim) :`curl https://j.mp/spf13-vim3 -L > /tmp/spf13-vim.sh && sh /tmp/spf13-vim.sh`

`~/.bashrc`,`~/.vimrc.before & ~./vimrc.local` `~/.gitconfig` `~/.npmrc` `~/.ssh/`

4. Change the shortcut
- such as (Ctrl+Alt+down)=>(window+s),(Ctrl+Alt+up)=>(window+w)

# Other software

[sogouinput](http://pinyin.sogou.com/linux/?r=pinyin)

[vmware](https://my.vmware.com/cn/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0)

[beyond compare](http://www.scootersoftware.com/download.php)

[netease cloud music](http://music.163.com/#/download)

[skypeforlinux](https://www.skype.com/en/download-skype/skype-for-linux/downloading-web/?type=weblinux-deb) it seems the website will auto redirect in PRC, so try this link: [https://repo.skype.com/latest/skypeforlinux-64.deb](https://repo.skype.com/latest/skypeforlinux-64.deb)

[npm and nodejs version](https://gist.github.com/YeXiaoRain/62282c1f5839922b875fb019de180f67)

## idea/webstorm/androidstudio

- just download, extract to `~/Public`(i like this directory) and run, you can add them to menu by search `desktop` in program

- register server:`http://idea.iteblog.com/key.php`

  [idea](https://www.jetbrains.com/idea/download/#section=linux)
  
  [webstorm](https://www.jetbrains.com/webstorm/)
  
  [android studio](https://developer.android.com/studio/index.html)
  
## Install QQ

[NEED Official wine2+](https://wiki.winehq.org/Ubuntu) i'm using stable version now ,[QQ](http://im.qq.com/pcqq/)

[wine-qq on github](https://github.com/askme765cs/Wine-QQ)

choose the early windows such as win7 or winxp, win10+qq has crashed according to my test. vedio chat does not seem to be available

[https://github.com/askme765cs/Wine-QQ/wiki](https://github.com/askme765cs/Wine-QQ/wiki)

[https://www.ubuntukylin.com/ukylin/forum.php?mod=viewthread&tid=30511](https://www.ubuntukylin.com/ukylin/forum.php?mod=viewthread&tid=30511)

# fuck china's gfw

 [hosts](https://raw.githubusercontent.com/racaljk/hosts/master/hosts)

 [lantern](https://github.com/getlantern/forum/issues/833)

 [ss](https://github.com/shadowsocks/shadowsocks/tree/master)

# relative

[helpful](https://gist.github.com/YeXiaoRain/0fabf6a85d1e9e3c304aa42ef17afce0)

[my ubuntu config](https://gist.github.com/YeXiaoRain/4dc7e4a6044db74e56f719ddf21ab112)

# TODO

upload some package to baidu cloud dick
