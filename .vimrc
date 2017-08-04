set ai

set t_Co=256

syntax on

" 啟用暗色背景模式。
set background=dark
"
" " 啟用行游標提示。
set cursorline
"
" " 文字編碼加入 utf8。
set enc=utf8
"
" " 標記關鍵字。
"set hls
"
" " 顯示行號。
set nu
"
" " 搜尋不分大小寫。
set ic

"自動補齊
set incsearch

"自動補齊()
inoremap ( ()<Esc>i

"自動補齊{}
inoremap {<CR> {<CR>}<Esc>ko

"自動補齊{{
inoremap {{ {}<ESC>i

" " 使用空白取到 Tab。
set expandtab
"
" " 自訂縮排 (Tab) 位元數。
set tabstop=4
set shiftwidth=4
"
" " 字數過長時換行。
set wrap
" "set nowrap     " 不換行。
"
" " 關閉嗶嗶聲。
set noeb
"
" " 自動切換當前目錄。
set autochdir
"
" " 捲動時保留底下 3 行。
set scrolloff=3
"
" " 摺疊 Folding。
"set foldenable
"set foldmethod=indent
"set foldcolumn=1
"set foldlevel=5
"
" " 在 fish 裡相容 Vim 裡的 Neobundle。
set shell=/bin/bash
"
" " 高亮當前行 (水平)。
"set cursorline
"

set laststatus=2
set statusline=%<\ [%F]\ %m%=\ %h%r\ %-19([%p%%]\ %l/%L,%02c%03V%)%y
set statusline+=[%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
      highlight StatusLine term=bold,reverse cterm=bold,reverse

" ***********************
"Trace code
set mouse=nv
" === ctags ===
set tags=./tags,./TAGS,tags;~,TAGS;~

" === cscope ===
set cscopetag
set csto=0

if filereadable("cscope.out")
   "cs add cscope.out   
   elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
       endif
       set cscopeverbose
        
       " 找出C語言name的符號
       nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
       " 找出name定義的地方
       nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
       " 找出使用name的地方
       nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
       " 找出name的字串
       nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
       " 相當於egrep功能，但速度更佳
       nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
       " 尋找檔案
       nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
       " 尋找include此檔案的檔案
       nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
       " 尋找name裡面使用到的函式
       nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

" === taglist ===
" 將F8設為開啟taglist的快捷鍵
nmap <F8> :TlistToggle<CR><CR>
" 只顯示當下瀏覽檔案的func，不顯示之前瀏覽的檔案
let Tlist_Show_One_File=1
" 如果taglist區塊是最後一個，則退出vim
let Tlist_Exit_OnlyWindow=1
" taglist會標示目前在操作哪個function or variable，但更新速度很慢，這裡把更新速度設成100ms
set ut=100

" === nerdtree ===
" 將F9設為開啟nerdtree的快捷鍵
nmap <F9> :NERDTreeFind<CR><CR>
" 將nerdtree區塊放在右邊
"let NERDTreeWinPos=1
let g:pymode_syntax = 1

" === SrcExpl(Source Explorer) ===
" 將F10設為開啟srcexpl的快捷鍵
nmap <F10> :SrcExplToggle<CR>
" 若有安裝taglist or nerdtree則需輸入
let g:SrcExpl_pluginList = ["__Tag_List__", "_NERD_tree_", "Source_Explorer"]

" === trinity ===
" 將F7設為一次打開taglist, nerdtree, srcexpl的快捷鍵
nmap <F7> :TrinityToggleAll

