"==========================================
" Author: 孙雪峰
" Email: sunxf94@gmail.com
" ReadMe: README.md
" Sections:
"   -> 初始化
"   -> 加载插件
" 	-> 基础设置
" 	-> 展示设置
" 	-> 自定义快捷键设置
" 	-> 自定义函数
" Note: 将不懂的配置踢出vimrc
" Note: 也可以:h [option] 学习一下
"==========================================

"==========================================
" 初始化 - 部分设置最好放在加载插件之前
"==========================================

" 修改leader键
let g:mapleader=','

" 打开文件类型检测 允许加载插件 打开自动缩进 详见:h filetype
filetype plugin indent on

"==========================================
" 加载插件
"==========================================

" install plugins
" expand 扩展{expr}里的通配符和关键字 当前是将 ~ 转换为绝对路径
if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

"==========================================
" 基础设置
"==========================================

" Reload/Edit the vimrc file quickly
nnoremap <Leader>ev :vs $MYVIMRC<CR>
nnoremap <Leader>eg :vs $MYVIMRC.plugins<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" history 存储容量
set history=1000

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
set viminfo^=%
" 检查是否有autocmd特性 详情见 :h has
" 当遇到 BufReadPost 事件时，自动执行命令：满足if条件时，执行 normal! g'"
" normal! g'" 命令：到前次离开本缓冲区时的光标位置 详见 :h '"
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vim外的文件修改后自动重新载入
set autoread

" 取消备份 详见 :h backup
set nobackup
set nowritebackup

" 关闭vi兼容
set nocompatible

" 关闭交换文件
set noswapfile

" 禁止鼠标
set mouse-=a

" 退出vim后，内容显示在终端
set t_ti= t_te=

" 设置退格键为正常模式
set backspace=2

" 设置tab表示的空格数
set tabstop=4

" 表现为tab 实际是空格 一次退格可以删除和添加4个空格
set softtabstop=4

" tab时化零为整
set shiftround

" 设置自动缩进
set smartindent

" 将tab自动转化为空格(需要tab时，使用 ctrl+V+tab)
set expandtab

" 设置自动缩进的时候使用的空格数
set shiftwidth=4

" 新文件编码设置成 UTF-8
set encoding=utf-8

" 自动判断编码时，依次尝试一下编码
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set termencoding=utf-8

" 设置文件格式
set ffs=unix,mac,dos

" 新文件自动添加文件头
autocmd BufNewFile *.sh, *.php exec ":call AutoSetFileHead()"

"==========================================
" 展示设置
"==========================================

" 主题 需要搭配 Plug: one
set background=dark
colorscheme one

" 设置状态栏高度
set cmdheight=1

" 状态栏显示
" 0不显示 1窗口多余一个时显示 2总是显示
set laststatus=2

" 设置 foldlevel = 99 保证超过99以上的代码才会被折叠 详见 :h set 搜索foldlevel
set nofoldenable
" set foldmethod=manual
" set foldmethod=indent
" set foldlevel=30
" " 折叠快捷键
" let g:FoldMethod = 0
" map <Leader>zz :call ToggleFold()<CR>
" fun! ToggleFold()
  " if g:FoldMethod == 0
      " exe "normal! zM"
      " let g:FoldMethod = 1
  " else
      " exe "normal! zR"
      " let g:FoldMethod = 0
  " endif
" endfun

" 语法高亮
syntax on

" 显示行号
set number

" 相对行号
set relativenumber number
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber number

" TODO 菜单: 连续按一个键42次会触发，还没想好怎么玩
" au UserGettingBored * exe ""

" 默认换行
set wrap

" 高亮搜索结果
set hlsearch

" 搜索时 实时匹配
set incsearch

" 光标的上方或下方至少会保留的显示的行数
set scrolloff=7

" 凸显当前行列
set cursorcolumn
set cursorline

" 搜索时忽略大小写
" 有一个及以上大写字母时恢复大小写敏感
set ignorecase
set smartcase

" 状态行显示正在输入的命令
set showcmd

" 不展示援助乌干达儿童的提示
set shortmess=atI

"==========================================
" 自定义快捷键设置
"==========================================

" 快速进入命令行
nnoremap ; :

" 取消搜索高亮
nnoremap <silent><Leader><space> :nohls<CR>

" v模式调整缩进后，还是选中状态 详见 :h gv
vnoremap < <gv
vnoremap > >gv

" 关闭方向键
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" 发生折行的时候像多行一样上下移动
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

noremap H ^
noremap L $

" 分屏窗口间切换
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" 搜索
map <space> /

" select all
map <Leader>sa ggVG

" [w!!] to [!sudo tee %]
cnoremap w!! w !sudo tee %

cnoremap hh rightbelow vertical help<Space>

" buffer 切换
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" 回车即选中当前项
" nnoremap <silent> <CR> *

" kj 替代 ESC
inoremap kj <Esc>

" <C-n> 弹窗时上下移动的快捷键
" 使用 YouCompleteMe 的配置 不需要这个了
inoremap <expr> <C-j>       pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k>       pumvisible() ? "\<C-p>" : "\<Up>"

" 上下快速翻屏
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" 快速查找一个词
nnoremap <CR> <S-*>

" 撤销
nnoremap U <C-r>

" F1 废弃
noremap <F1> <Esc>

" F2 行号开关
" nnoremap <F2> :call HideLineNum()<CR>
nnoremap <F2> :set relativenumber! number!<CR>

" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>

" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F5 复制模式
" nnoremap <F5> :call StartPasteMode()<CR>

" F6 语法开关 关闭语法可以加快大文件展示速度
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

"==========================================
" 自定义函数
"==========================================

" 设置可以高亮的关键字
if has('autocmd')
    if v:version > 701
        autocmd Syntax * call matchadd('TODO', '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
endif

" 行号与相对行号切换
function HideLineNum()
    if (&relativenumber)
        set norelativenumber nonumber
    else
        set relativenumber number
    endif
endfunc

" 新文件 根据文件类型自动添加文件头
function AutoSetFileHead()
    if &filetype == 'sh'
        call seline(1, "\#!/bin/bash")
    endif

    if &filetype == 'php'
        call setline(1, "<?php")
    endif
endfunc
