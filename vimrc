"==========================================
" Author: sunxuefeng
" Version: 0.1
" Email: sunxf94@gmail.com
" ReadMe: README.md
" Last_modify: 2020.5.27
" Sections:
"   -> 加载插件
" 	-> 基础设置
" 	-> 主题设置
" 	-> 展示设置
" 	-> 自定义快捷键设置
" 	-> 文件类型设置
" 	-> 自定义函数
" Note: Don't put anything in your .vimrc you don't understand!
"==========================================

"==========================================
" 加载插件
"==========================================

" 修改leader键
let mapleader = ','

" install plugins
if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

" 开始文件类型检测 允许加载插件 (这是两条命令)
filetype plugin on

"==========================================
" 基础设置
"==========================================

" Reload/Edit the vimrc file quickly
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" history 存储容量
set history=1000

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
set viminfo^=%
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" vim外的文件修改后自动重新载入
set autoread

" 取消备份
set nobackup

" 关闭vi兼容
set nocompatible

" 关闭交换文件
set noswapfile

" 禁止鼠标
set mouse-=a

" 退出vim后，内容显示在终端
set t_ti= t_te=

" 设置退格键未正常模式
set backspace=2

" 自动缩进
set autoindent

" 设置tab键宽度
set tabstop=4

" 将tab自动转化为空格(需要tab时，使用 ctrl+V+tab)
set expandtab

"==========================================
" 主题设置
"==========================================

set t_Co=256
set background=dark

colorscheme one

"==========================================
" 展示设置
"==========================================

" 代码折叠
set foldenable
set foldmethod=manual
set foldlevel=99
"" 折叠快捷键
" map <leader>zz :call ToggleFold()<CR>
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

" 换行
set wrap

set hlsearch

" 光标的上方或下方至少会保留的显示的行数
set scrolloff=7

" 凸显当前行列
set cursorcolumn
set cursorline

" 高亮搜索的文本
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 有一个及以上大写字母时恢复大小写敏感
set smartcase

" 不展示援助乌干达儿童的提示
set shortmess=atI

"==========================================
" 自定义快捷键设置
"==========================================

" 快速进入命令行
nnoremap ; :

" <C+n> 自动补全快捷键
" inoremap <C+j> <C+n>
" inoremap <C+k> <C+p>

" 取消搜索高亮
nnoremap <slient><leader>/ :noh<CR>

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
map <space> /\v

" select all
map <leader>sa ggVG

" [w!!] to [!sudo tee %]
cmap w!! w !sudo tee %

" buffer 切换
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" kj 替代 ESC
inoremap kj <Esc>

" 上下快速翻屏
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

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

" F6 语法开关 关闭语法可以加快大文件展示速度
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : syn on'<CR>

"==========================================
" 文件类型设置
"==========================================

" 新文件编码设置成 UTF-8
set encoding=utf-8

" 自动判断编码时，依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 设置文件格式
set ffs=unix,mac,dos

autocmd BufNewFile *.sh, *.php exec ":call AutoSetFileHead()"

"==========================================
" 自定义函数
"==========================================

" 设置可以高亮的关键字
if has('autocmd')
    if v:version > 701 
        autocmd Syntax * call matchadd('TODO', '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd Syntax * cal matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
endif

function HideLineNum()
    if (&relativenumber)
        set norelativenumber nonumber
    else
        set relativenumber number
    endif
endfunc

function AutoSetFileHead()
    if &filetype == 'sh'
        call seline(1, "\#!/bin/bash")
    endif

    if &filetype == 'php'
        call setline(1, "<?php")
    endif
endfunc
