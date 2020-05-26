
[http://conglang.github.io/2015/04/06/spf13-vim-cheat-sheet/](http://conglang.github.io/2015/04/06/spf13-vim-cheat-sheet/)

## the commonly used

默认的`<leader>`是`,`
  
安装或更新`curl https://j.mp/spf13-vim3 -L -o - | sh`

**以下有对Bundles进行修改的,或者有依赖软甲安装的 修改保存后 执行命令`：BundleInstall`**

在`.vimrc.bundles`中修改`HTML-AutoCloseTag`的依赖路径 [diff](https://github.com/spf13/spf13-vim/pull/1056/commits/e8e4197110696521657344ad8190cdd53f5089c3)

### [NERDCommenter](https://github.com/scrooloose/nerdcommenter) 快捷注释切换

    <leader>c<Space> 切换注释
    i	在新split打开选中文件
    s	在新vsplit中打开选中文件
    C	设置选中目录为根结点

### [NERDTree](http://github.com/scrooloose/nerdtree) 文件数

    <C-e> 打开关闭 文件树

### [ctrlp](http://kien.github.io/ctrlp.vim/) 快速查找

    <C-p>快速搜文件 <C-f>/<C-b> 切换模式

    - <c-v>, <c-x> to open the selected entry in a new tab or in a new split. 以split形式打开
    
    - <F5> 刷新缓存
      - Refresh the match window and purge the cache for the current directory.
      - Remove deleted files from MRU list.
    
    注意 它是根据 最近的.git来作为根目录 所以 一般有.git维护的就ok,没有的 还不懂 要怎么设置 调了半天也没能让它 scan当前目录

### [numbers.vim](https://github.com/myusuf3/numbers.vim) 显示 相对 的行号

现在的spf13中没有了？？？ 只是看到说是有，在`~/.vimrc.local`中加上
    
    Bundle "myusuf3/numbers.vim"
    nnoremap <F3> :NumbersToggle<CR>
    
    <F3>切换 相对行数和绝对行数
    
### [fugitive](https://github.com/tpope/vim-fugitive) git快捷

感觉我个人还是喜欢git自己的命令
 
    <leader>gd :Gdiff
    
### Tabularize 对齐工具 比如按等号对齐 感觉一级棒

    <Leader>a= :Tabularize /=
    <Leader>a: :Tabularize /:
    <Leader>a:: :Tabularize /:\zs
    <Leader>a, :Tabularize /,
    <Leader>a<Bar> :Tabularize /
    
### [tagbar](https://github.com/majutsushi/tagbar) 类结构
    
    <leader>tt
    
### [ack](https://github.com/mileszs/ack.vim) 类似grep

依赖`apt install ack-grep`
    
    :Ack
    
### [easymotion](https://github.com/easymotion/vim-easymotion) 快速跳转

    <leader><leader>w
    
