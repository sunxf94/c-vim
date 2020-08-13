c-vim
=======================

> refer [wklken](https://github.com/wklken/k-vim)

> VERSION: 1.0

> LAST_UPDATE_TIME: 2020-06-05

> 本次更新: 全面重写，每一行都确认含义，根据自己的需求定制

# 目标

> Just a Better Vim Config. Keep it Simple.

---------------------------------

# 截图

solarized主题

![solarized](https://github.com/wklken/gallery/blob/master/vim/solarized.png?raw=true)

molokai主题

![molokai](https://github.com/wklken/gallery/blob/master/vim/molokai.png?raw=true)

---------------------------------
---------------------------------

# 安装步骤

### 1. clone 到本地

```
git clone https://github.com/sunxf94/c-vim.git
```


### 2. 安装依赖包

```
# ubuntu
sudo apt-get install ctags

# centos
sudo yum install ctags

# mac
brew install ctags
```

### 3. 安装

```
进入目录, 执行安装
# 注意原先装过的童鞋, 重装时，不要到~/.vim下执行(这是软连接指向k-vim真是目录)，必须到c-vim原生目录执行
# 会进入安装插件的列表，一安装是从github clone的，完全取决于网速, 之后会自动编译 YCM, 编译失败的话需要手动编译, 有问题见YCM文档
# 如果发现有插件安装失败 可以进入vim, 执行`:PlugInstall'

cd c-vim/
sh -x install.sh
```

------------------------
------------------------

# 移除安装

```
cd ~ && rm -rf .vim .vimrc .vimrc.plugins && cd -
```

---------------------------------
---------------------------------

# 常见问题

------------------------
------------------------

# 插件

### 选择安装插件集合

编辑vimrc.bundles中

```
" more options: ['json', 'nginx', 'golang', 'ruby', 'less', 'json', ]
let g:bundle_groups=['php', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta']
```

选定集合后, 使用插件管理工具进行安装/更新

### 插件管理

使用 [vim-plug](https://github.com/junegunn/vim-plug) 管理插件

`vim-plug` 常见问题: [vim-plug faq](https://github.com/junegunn/vim-plug/wiki/faq) / [YCM timeout](https://github.com/junegunn/vim-plug/wiki/faq#youcompleteme-timeout)
／[YCM 国人在国内做的镜像](https://github.com/LooEv/A-bridge-to-YouCompleteMe)

管理插件的命令

```
:PlugInstall     install                      安装插件
:PlugUpdate      install or update            更新插件
:PlugClean       remove plugin not in list    删除本地无用插件
:PlugUpgrade     Upgrade vim-plug itself      升级本身
:PlugStatus      Check the status of plugins  查看插件状态
```



### 插件列表
见 vimrc.plugins 注释

#### alvan/vim-php-manual php文档
快捷键
> shift + k

2. 切换为中文文档

[原文地址](http://luokr.com/p/20)

```
1) 下载最新的中午多文件版本的[PHP手册](https://www.php.net/download-docs.php)
2) 解压下载回来的压缩包，将目标目录重命名为src/，和doc.php文件放在同一级目录下(vim-php-manual/manual/)
3) 使用brew/yum 安装w3m
4) 执行php doc.php, 生成一个doc文件夹（将原来的doc文件夹保存或者删除）
```

------------------------
------------------------


# 自定义快捷键

```
注意, 以下 ',' 代表<leader>
1. 可以自己修改vimrc中配置，决定是否开启鼠标，默认不开启

set mouse-=a           " 鼠标暂不启用, 键盘党....
set mouse=a            " 开启鼠标

2. 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 如果不需要可以关掉
    好处：误删什么的，如果以前屏幕打开，可以找回....惨痛的经历

set t_ti= t_te=

3. 可以自己修改vimrc决定是否使用方向键进行上下左右移动，默认关闭，强迫自己用 hjkl，可以注解
hjkl  上下左右

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

4. 上排F功能键

F1 废弃这个键,防止调出系统帮助
F2 set nu/nonu,行号开关，用于鼠标复制代码用
F3 set list/nolist,显示可打印字符开关
F4 set wrap/nowrap,换行开关
F6 syntax on/off,语法开关，关闭语法可以加快大文件的展示

F9 tagbar

5. 分屏移动

ctrl + j/k/h/l   进行上下左右窗口跳转,不需要ctrl+w+jkhl

6. 搜索
<space> 空格，进入搜索状态
/       同上
,/      去除匹配高亮

7. 按键修改
Y         =y$   复制到行尾
U         =Ctrl-r
,sa       select all,全选
gv        选中并高亮最后一次插入的内容
,v        选中段落
kj        代替<Esc>，不用到角落去按esc了

,q     :q，退出vim
,w     :w, 保存当前文件

ctrl+n    相对/绝对行号切换
<enter>   normal模式下回车选中当前项

更多细节优化:
    1. j/k 对于换行展示移动更友好
    2. HL 修改成 ^$, 更方便在同行移动
    3. ; 修改成 : ，一键进入命令行模式，不需要按shift
    4. 命令行模式 ctrl+a/e 到开始结尾
    5. <和> 代码缩进后自动再次选中, 方便连续多次缩进, esc退出
    6. 保存自动去行尾空白，打开自动加行首代码
    7. 'w!!'强制保存, 即使readonly
    8. 去掉错误输入提示
    9. 交换\`和', '能跳转到准确行列位置
    10. 保存时自动去行尾空白
    11. 统一所有分屏打开的操作位v/s[nerdtree/ctrlspace] (特殊ctrlp ctrl+v/x)
```

------------------------
------------------------

### Inspire

1. vimrc文件布局`vimrc+vimrc.bundles`配置方式参考 [maximum-awesome](https://github.com/square/maximum-awesome)

2. install.sh 参考`spf13-vim` 的`bootstrap.sh` [spf13-vim](https://github.com/spf13/spf13-vim)

2. 插件管理使用[Vim-plug](https://github.com/junegunn/vim-plug)

3. 自动补全 [YCM](https://github.com/Valloric/YouCompleteMe)

4. 插件挑选 [VimAwesome](http://vimawesome.com/)

------------------------
------------------------

The End!

