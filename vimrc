"Set ma	pleader
let g:mapleader = ","

set nocompatible

set backspace=indent,eol,start

"显示行号
set nu

"windows manger
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>


"打开语法高亮
syntax on
"let asmsyntax="gas"
let asmsyntax="nasm"
"设置字体
set guifont=DejaVu\ Sans\ Mono\ 12

"设置缩进
set softtabstop=8
set shiftwidth=8
set expandtab

"关闭toolbar
set guioptions-=T

"关闭自动备份
set nobackup

set completeopt=longest,menu

"自动格式化
set formatoptions=tcrqn

"在行和段开始处使用制表符
set smarttab

"在normal模式下使用系统剪贴板
"set clipboard+=unnamed

"自动缩进设置
set cindent
set smartindent
set incsearch
set autoindent
set cinoptions=:0
"Show matching bracets
set showmatch

"Get out of VI's compatible mode
set nocompatible

"Have the mouse enabled all the time
set mouse=a

"Set to auto read when a file is changed from the outside
set autoread

"Enable filetype plugin
filetype plugin indent on

"设置配色方案为torte
"colo torte
colo desert
"colo tango
"设置支持的文件编码类项，目前设置为utf-8和gbk两种类型
set fenc=utf-8
set fileencodings=utf-8,chinese,gb18030,gbk,gb2312,cp936
set enc=utf-8
let &termencoding=&encoding


"设置断词
set linebreak

"设置搜索结果高亮显示
set hlsearch

"设置记录的历史操作列表
set history=200

"设置折叠
set foldenable
set foldcolumn=2
set foldlevel=3

"打开目录时不显示隐藏目录和文件
let g:netrw_hide= 1
let g:netrw_list_hide= '^\..*'

"AutoCommand
" 鼠标跳到上次关闭时，编辑的位置
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif
"新建.c,.h.cpp,.sh,.java,.php,.py文件自动打开Taglist
autocmd BufNewFile *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":call SetTitle()"
"读入.c,.h.cpp,.sh,.java,.php,.py文件自动打开Taglist
"autocmd BufRead *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":Tlist"
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
"如果是新建的php文件，则自动定位到最后第二行
autocmd BufNewFile *.php normal k

"写入.c,.h.cpp,.sh,.java,.php,.py文件自动更新Taglist
autocmd BufWritePost *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":TlistUpdate"
"
"读入python文件，设置缩进格式
autocmd BufNewFile,BufRead *.py set cinwords=if,elif,else,for,while,try,expect,finally,def,class

"读入C文件，设置折叠方式为syntax
autocmd BufNewFile,BufRead *.[ch],*.cpp set foldmethod=syntax

"读入其它文件，设置折叠方式为indent
autocmd BufNewFile,BufRead *.py,*.sh,*.java,*.php set foldmethod=indent

"设置Java代码的自动补全
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"autocmd FileType java set tags=./tags,./../tags,./http://www.cnblogs.com/tags

"设置输入代码的自动补全
"autocmd BufEnter * call DoWordComplete()
set complete=.,w,b,u,t,i,k
set completeopt=longest,menu

"设置当回复邮件时自动定位到最后一行
autocmd BufRead /tmp/mutt-* normal G
"autocmd BufRead /tmp/mutt-* normal $ 
"绑定自动补全的快捷键<C-X><C-O>到<leader>;
imap <leader>; <C-X><C-O>

"绑定复制到系统剪贴板快捷键
vmap <leader>c "+y
nmap <leader>c "+y

"绑定粘贴系统剪贴板内容快捷键
"imap <leader>v <ESC>"+p "不设置insert模式下的快捷键，因为会造成无法输入,v
vmap <leader>v <ESC>"+p
nmap <leader>v "+p

"设定开关Taglist插件的快捷键为F4，可以在VIM的左侧栏列出函数列表等
map <F4> :Tlist<CR>

"设置程序的运行和调试的快捷键F5和Ctrl-F5
map <F5> :call CompileRun()<CR>
map <C-F5> :call Debug()<CR>
"设置手动更新tags文件
map <F8> :!ctags -R * <CR>
map <F9> :!splint % <CR>
"设置tab操作的快捷键，绑定:tabnew到<leader>t，绑定:tabn, :tabp到<leader>n,
"<leader>p
map <leader>t :tabnew<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>

"设置空格键开关折叠
nmap <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"使用<leader>r打开上次运行的命令
nmap <leader>r :<UP>

"-------Tags----------
"用cscope支持
set csprg=/usr/bin/cscope
set updatetime=100
let Tlist_Ctags_Cmd='/users/findstr/bin/ctags'
let Tlist_Show_One_File=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Process_File_Always=1
"默认打开Taglist
let Tlist_Auto_Open=1

"设置搜索的tags文件范围
set tags=./tags,./../tags,./http://www.cnblogs.com/tags,/usr/include/tags,/usr/src/linux-3.2.6/include/tags

"--MiniBufferExplorer--
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapCTabSwitchWindows=1
let g:miniBufExplModSelTarget=1

"使用<leader>e打开当前文件同目录中的文件
if has("unix")
        map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
else
        map <leader>e :e <C-R>=expand("%:p:h") . "\" <CR>
endif

"定义函数SetTitle，自动插入文件头
func SetTitle()
        "如果文件类型为.sh文件
        if &filetype == 'sh' || &filetype == 'python'
                call setline(1, "\#========================================================================")
                call append(line("."), "\# Author: findstr")
                call append(line(".")+1, "\# Email: findstr@sina.com")
                call append(line(".")+2, "\# File Name: ".expand("%"))
                call append(line(".")+3, "\# Description: ")
                call append(line(".")+4, "\#   ")
                call append(line(".")+5, "\# Edit History: ")
                call append(line(".")+6, "\#   ".strftime("%Y-%m-%d")."    File created.")
                call append(line(".")+7, "\#========================================================================")
                call append(line(".")+8, "")
                "其它程序文件
        else
                call setline(1, "/**")
                call append(line("."), "=========================================================================")
                call append(line(".")+1, " Author: findstr")
                call append(line(".")+2, " Email: findstr@sina.com")
                call append(line(".")+3, " File Name: ".expand("%"))
                call append(line(".")+4, " Description: (C)  ".strftime("%Y-%m"). "  findstr")
                call append(line(".")+5, "   ")
                call append(line(".")+6, " Edit History: ")
                call append(line(".")+7, "   ".strftime("%Y-%m-%d")."    File created.")
                call append(line(".")+8, "=========================================================================")
                call append(line(".")+9, "**/")
                call append(line(".")+10, "")
        endif
        "如果为php文件，添加相应头和尾
        if &filetype == 'php'
                call append(0, "<?php")
                call append(line("$"), "?>")
        endif
        "如果为sh文件，添加相应的头
        if &filetype == 'sh'
                call append(0, "\#!/bin/bash")
                "如果为python文件，添加相应的头和编码设定
        elseif &filetype == 'python'
                call append(0, "\#!/usr/bin/python")
                call append(1, "\# -*- coding: utf-8 -*-")
        endif
endfunc

"ececute project relate configuration in current directory
if filereadable("workspace.vim")
        source workspace.vim
endif
