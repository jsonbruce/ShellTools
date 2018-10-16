"==========================================
" Author:  Max Xu
" Version: 2.0
" Email: xuhuan@mail.com
" Blog: http://blog.csdn.net/ultimatestudio
" ReadMe: README.md
" Last_modify: 2014-01-14
" Sections:
"     ->General 基础设置
"     ->Show 展示/排版等界面格式设置
"     ->file encode, 文件编码,格式
"     ->others 其它基础配置
"     ->hot key  自定义快捷键
"     ->bundle 插件管理和配置项
"     ->colortheme 主题,及一些展示上颜色的修改
"==========================================

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source % 

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"设置背景主题
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark
set background=light
"color desert          
"color torte

set mouse=v
"set mouse=a     " Enable mouse usage (all modes)
" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
"set selection=exclusive
set selection=inclusive
set selectmode=mouse,key

set shortmess=atI      "启动时不显示那个援助索马里儿童的提示

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"    

" 根据模式更改 Vim 光标
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   格式和排版
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible       "不使用vi默认键盘布局
set number             "设置行号
set nowrap             "不要换行
syntax on              "语法高亮
set formatoptions=tcrqn "自动格式化

" 缩进
set autoindent              "继承前一行的缩进方式，特别适合多行注释
set cindent                 "使用C样式的缩进
set smartindent             " 为C语言提供自动缩进 

set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4             " number of spaces to use for autoindenting
set softtabstop=4            " 按退格键时可以一次删掉 4 个空格

set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set noexpandtab             " 不要用空格代替制表符
"set expandtab               " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

" 代码折叠
set foldenable
    " 折叠方法
    " manual    手工折叠
    " indent    使用缩进表示折叠
    " expr      使用表达式定义折叠
    " syntax    使用语法定义折叠
    " diff      对没有更改的文本进行折叠
    " marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99    "设置折叠层数 
set foldcolumn=0             "设置折叠区域的宽度

" manual    以下用于手工折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   文件设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"禁止生成临时文件
set nobackup              "不要生成备份文件
set noswapfile
set history=2000          " history存储长度。

"set autowrite      " Automatically save before commands like :next and :make
set autoread        " Set to auto read when a file is changed from the outside"

" Hide buffers when they are abandoned
set hidden             
set wildmode=list:longest
set ttyfast

set confirm            "在处理未保存或只读文件时，弹出确认框
set noerrorbells       "不让Vim发出滴滴声:

"检测文件类型
filetype on

"针对不同的文件类型采用不同的缩进格式
filetype indent on

" 载入文件类型插件
filetype plugin on

"启动自动补全,为特定文件类型载入相关缩进文件
filetype plugin indent on

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" 新文件文件头
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c/.cpp/.h/.sh/.py/.java/.scala文件，自动插入文件头 

autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.java,*.scala,*.sh,Makefile,*.mk,*.py,*.rb exec ":call SetTitle()" 


" Set Comment for .c, .h, .java, etc.
func! SetComment()
	call setline(1,"/*************************************************************************") 
	call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
	call append(line(".")+1, "*   ") 
	call append(line(".")+2, "*   FILE: ".expand("%:t")) 
	call append(line(".")+3, "*   AUTHOR: Max Xu")
	call append(line(".")+4, "*   MAIL: xuhuan@live.cn") 
	call append(line(".")+5, "*   DATE: ".strftime("%m/%d/%Y    TIME:%H:%M:%S")) 
	call append(line(".")+6, "*")
	call append(line(".")+7, "*************************************************************************/") 
	call append(line(".")+8, "")
	call append(line(".")+9, "")
endfunc


" Set Comment for .sh, .mk, .py, .rb, etc.
func! SetCommentForScript()
	call setline(4, "#########################################################################") 
	call setline(5, "#   Copyright (C) ".strftime("%Y")." All rights reserved.")
	call setline(6, "#   ") 
	call setline(7, "#   FILE: ".expand("%:t")) 
	call setline(8, "#   AUTHOR: Max Xu")
	call setline(9, "#   MAIL: xuhuan@live.cn") 
	call setline(10, "#   DATE: ".strftime("%m/%d/%Y    TIME:%H:%M:%S")) 
	call setline(11, "#")
	call setline(12, "#########################################################################")
	call setline(13, "")
	call setline(14, "")
endfunc 


func! SetTitle()
	if &filetype == 'make' || expand("%:e") == "mk"
		call setline(1, "") 
		call setline(2, "")
    call setline(3, "")
		call SetCommentForScript()

	elseif &filetype == 'sh' || expand("%:e") == "sh"
		call setline(1, "#!/bin/bash") 
		call setline(2, "")
    call setline(3, "")
		call SetCommentForScript()

  elseif &filetype == 'python' || expand("%:e") == "py"
    call setline(1, "#!/usr/bin/env python") 
		call setline(2, "# coding=utf-8")
    call setline(3, "")
		call SetCommentForScript()
    call setline(15, "import os") 
    call setline(16, "import sys")
    call setline(17, "") 
    call setline(18, "") 
    call setline(19, "def main(args):") 
    call setline(20, "    pass") 
    call setline(21, "") 
    call setline(22, "") 
    call setline(23, "if __name__ == \"__main__\":") 
    call setline(24, "    main(sys.argv[1:])")  
	
  elseif &filetype == 'ruby' || expand("%:e") == "rb"
    call setline(1,"#!/usr/bin/env ruby")
    call setline(2,"# encoding: utf-8")
    call setline(3, "")
    call SetCommentForScript()
  
	else
    call SetComment()
    if expand("%:e") == 'hpp' 
      call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H") 
      call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H") 
      call append(line(".")+12, "#ifdef __cplusplus") 
      call append(line(".")+13, "extern \"C\"") 
      call append(line(".")+14, "{") 
      call append(line(".")+15, "#endif") 
      call append(line(".")+16, "") 
      call append(line(".")+17, "#ifdef __cplusplus") 
      call append(line(".")+18, "}") 
      call append(line(".")+19, "#endif") 
      call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H") 

    elseif &filetype == 'cpp' || expand("%:e") == 'cpp' 
      call append(line(".")+10, "#include<iostream>")
      call append(line(".")+11, "#include \"".expand("%:t:r").".h\"") 
      call append(line(".")+12, "using namespace std;")
      call append(line(".")+13, "")
      call append(line(".")+14, "int main(void)")
		  call append(line(".")+15, "{")
		  call append(line(".")+16, "")
		  call append(line(".")+17, "}")

    elseif expand("%:e") == "h" || expand("%:e") == "hh"
      call append(line(".")+10, "#pragma once") 
      call append(line(".")+11, "#ifndef _".toupper(expand("%:r"))."_H")
  		call append(line(".")+12, "#define _".toupper(expand("%:r"))."_H")
  		call append(line(".")+13, "#endif")

    elseif &filetype == "c" || expand("%:e") == "c" || expand("%:e") == "cc"
      call append(line(".")+10, "#include <stdio.h>")
   		call append(line(".")+11, "#include <stdlib.h>")
      call append(line(".")+12, "#include \"".expand("%:t:r").".h\"") 
      call append(line(".")+13, "")
		  call append(line(".")+14, "int main(void)")
		  call append(line(".")+15, "{")
		  call append(line(".")+16, "")
		  call append(line(".")+17, "}")
    
    elseif &filetype == "java" || expand("%:e") == "java"
      call append(line(".")+10, "public class ".expand("%:r") ."{")
      call append(line(".")+11, "")
      call append(line(".")+12, "    public static void main(String[] args) {")
      call append(line(".")+13, "      ")
      call append(line(".")+14, "    }")
      call append(line(".")+15, "}")

    elseif expand("%:e") == "scala"
      call append(line(".")+10, "def main(args: Array[String]) {")
      call append(line(".")+11, "}")

    endif

	endif
endfunc

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   搜索和匹配
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd         " Show (partial) command in status line.显示输入的命令
set showmode        " Show current mode
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase		" Do smart case matching

set scrolloff=7     " Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间

set incsearch		"搜索逐字符高亮
set hlsearch        "高亮被搜索的句子
set novisualbell      "设置不要闪烁

"当前行设置
set cursorcolumn
set cursorline       "突出显示当前行
autocmd InsertEnter * se cul         "用浅色高亮当前行
"hi CursorLine cterm=NONE ctermbg=lightcyan ctermfg=white guibg=darkred guifg=white       "cterm改变背景和前景的颜色，gui改变下划线的颜色
"hi CursorLine cterm=NONE ctermbg=lightblue ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE gui=NONE guibg=darkred guifg=white
"autocmd InsertEnter * highlight CursorColumn guibg=#000050 guifg=fg

"状态行设置
set ruler             "设置显示状态标尺
set laststatus=2      "总是显示状态栏,默认值为1无法显示
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%Y.%m.%d\ %H:%M\")}       "设置状态行的显示内容

"状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

" For regular expressions turn magic on
set magic      


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class


"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set completeopt+=longest
set completeopt=longest,menu
"set completeopt=preview,menu

"自动补全
:inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}'<CR>
:inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']'<CR>
:inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
   else
		return a:char
   endif
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Ctags 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags=~/Development/eclipse/tags
set autochdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  TagList 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  winManagerWindowLayout 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:autoOpenWinManager=0
nmap wm :WMToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  OmniCppComplete 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  SuperTab 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Pathogen - Plugin Manager 
"  Plugins to be installed can be extracted to  ~/.vim/bundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

let vim_markdown_preview_github=1
"let vim_markdown_preview_hotkey='<C-m>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  NeoComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  NeoComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
