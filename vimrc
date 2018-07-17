"Set ma	pleader
let g:mapleader = ","

set nocompatible

set backspace=indent,eol,start

"��ʾ�к�
set nu

"��ǩ
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"windows manger
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>


"���﷨����
syntax on
"let asmsyntax="gas"
let asmsyntax="nasm"
"��������
set guifont=DejaVu\ Sans\ Mono\ 12

"��������
set softtabstop=8
set shiftwidth=8
set noexpandtab

"�ر�toolbar
set guioptions-=T

"�ر��Զ�����
set nobackup

set completeopt=longest,menu

"�Զ���ʽ��
set formatoptions=tcrqn

"���кͶο�ʼ��ʹ���Ʊ��
set smarttab

"��normalģʽ��ʹ��ϵͳ������
"set clipboard+=unnamed

"�Զ���������
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
au BufRead,BufNewFile *.go set filetype=go
"������ɫ����Ϊtorte
"colo torte
colo desert
"colo tango
"����֧�ֵ��ļ��������Ŀǰ����Ϊutf-8��gbk��������
set fenc=utf-8
set fileencodings=utf-8,chinese,gb18030,gbk,gb2312,cp936
set enc=utf-8
let &termencoding=&encoding

"set cursorline

set colorcolumn=81
highlight colorcolumn ctermbg=LightBlue

"���öϴ�
set linebreak

"�����������������ʾ
set hlsearch

"���ü�¼����ʷ�����б�
set history=200

"�����۵�
set foldenable
set foldcolumn=2
set foldlevel=3

"��Ŀ¼ʱ����ʾ����Ŀ¼���ļ�
let g:netrw_hide= 1
let g:netrw_list_hide= '^\..*'

"AutoCommand
" ��������ϴιر�ʱ���༭��λ��
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif

autocmd BufWritePre * :call StripTailWhitespaces()

"�½�.c,.h.cpp,.sh,.java,.php,.py�ļ��Զ���Taglist
autocmd BufNewFile *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":call SetTitle()"
autocmd BufNewFile,BufRead *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":call AddCscope()"
"�½��ļ����Զ���λ���ļ�ĩβ
autocmd BufNewFile * normal G
"������½���php�ļ������Զ���λ�����ڶ���
autocmd BufNewFile *.php normal k

"д��.c,.h.cpp,.sh,.java,.php,.py�ļ��Զ�����Taglist
autocmd BufWritePost *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":TlistUpdate"
"
"����python�ļ�������������ʽ
autocmd BufNewFile,BufRead *.py set cinwords=if,elif,else,for,while,try,expect,finally,def,class

"����C�ļ��������۵���ʽΪsyntax
autocmd BufNewFile,BufRead *.[ch],*.cpp set foldmethod=syntax

"���������ļ��������۵���ʽΪindent
autocmd BufNewFile,BufRead *.py,*.sh,*.java,*.php set foldmethod=indent

"����Java������Զ���ȫ
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"�������������Զ���ȫ
"autocmd BufEnter * call DoWordComplete()
set complete=.,w,b,u,t,i,k
set completeopt=longest,menu

set modeline
set modelines=5

set list
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<

"���õ��ظ��ʼ�ʱ�Զ���λ�����һ��
autocmd BufRead /tmp/mutt-* normal G
"autocmd BufRead /tmp/mutt-* normal $
"���Զ���ȫ�Ŀ�ݼ�<C-X><C-O>��<leader>;
imap <leader>; <C-X><C-O>

"�󶨸��Ƶ�ϵͳ�������ݼ�
vmap <leader>c "+y
nmap <leader>c "+y

"��ճ��ϵͳ���������ݿ�ݼ�
"imap <leader>v <ESC>"+p "������insertģʽ�µĿ�ݼ�����Ϊ������޷�����,v
vmap <leader>v <ESC>"+p
nmap <leader>v "+p

"�趨����Taglist����Ŀ�ݼ�ΪF4��������VIM��������г������б��
map <F4> :Tlist<CR>

"���ó�������к͵��ԵĿ�ݼ�F5��Ctrl-F5
map <F5> :call CompileRun()<CR>
map <C-F5> :call Debug()<CR>
"�����ֶ�����tags�ļ�
map <F8> :!ctags -R * <CR>
map <F9> :!splint % <CR>
"����tab�����Ŀ�ݼ�����:tabnew��<leader>t����:tabn, :tabp��<leader>n,
"<leader>p
map <leader>t :tabnew<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>

"���ÿո�������۵�
nmap <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"ʹ��<leader>r���ϴ����е�����
nmap <leader>r :<UP>
"gd + ctrl+o
nnoremap F gd <C-O>

"-------Tags----------
"��cscope֧��
set csprg=/usr/bin/cscope
set csto=1
set updatetime=100
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Process_File_Always=1
let Tlist_WinWidth=40
"Ĭ�ϴ�Taglist
let Tlist_Auto_Open=1

"����������tags�ļ���Χ
set tags=./tags,./../tags,./../../tags,./../../../tags,/usr/include/tags,/usr/src/linux-3.2.6/include/tags

"--MiniBufferExplorer--
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapCTabSwitchWindows=1
let g:miniBufExplModSelTarget=1

"ʹ��<leader>e�򿪵�ǰ�ļ�ͬĿ¼�е��ļ�
if has("unix")
        map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
else
        map <leader>e :e <C-R>=expand("%:p:h") . "\" <CR>
endif

func StripTailWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfunc

"���庯��SetTitle���Զ������ļ�ͷ
func SetTitle()
        "���Ϊphp�ļ��������Ӧͷ��β
        if &filetype == 'php'
                call append(0, "<?php")
                call append(line("$"), "?>")
        endif
        "���Ϊsh�ļ��������Ӧ��ͷ
        if &filetype == 'sh'
                call append(0, "\#!/bin/bash")
                "���Ϊpython�ļ��������Ӧ��ͷ�ͱ����趨
        elseif &filetype == 'python'
                call append(0, "\#!/usr/bin/python")
                call append(1, "\# -*- coding: utf-8 -*-")
        endif
endfunc

func AddCscope()
	let n = 10
	let dir = '../'
	let i = 0
	let fname = 'cscope.out'
	while i < n
		if filereadable(dir . fname)
			set nocsverb
			execute 'cs add ' . dir . fname . ' ' . dir
			"execute 'cs add ' . dir . fname
			set csverb
			break
		endif
		let dir = dir . '../'
		let i = i + 1
	endwhile
endf

"ececute project relate configuration in current directory
if filereadable("workspace.vim")
        source workspace.vim
endif


