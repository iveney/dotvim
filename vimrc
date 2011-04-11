" IMPORTANT: call pathogen at first to manage bundles
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Binding MEMO:
" nmap: in normal mode
" imap: in insert mode
" cmap: in commandline mode
" vmap: in visual
" omap:operating pending
" lmap: in all(above all)
" [n|c|...]noremap : not allow recursive mapping
"Set mapleader( replace <leader> to the string )

let mapleader=","

" Sets the character encoding used inside Vim.
set enc=utf-8
" Sets the character encoding for the file of this buffer.
set fenc=utf-8
" a list of character encodings considered when starting to edit an existing
" file.
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set nocompatible

"自动检测文件类型打开缩进
filetype on
filetype plugin on
filetype indent on
syntax on
syntax enable
set hlsearch

" no highlight search
map <F2> <ESC>:nohlsearch<CR>

" map <F3> to toggle paste mode
set pastetoggle=<F3>

" when `paste' is set, filetype indent and autoindent don't work
nnoremap <F4> :set paste<CR>"*p:set nopaste<CR>
nnoremap <F5> :set paste<CR>"+p:set nopaste<CR>
inoremap <F4> <ESC>:set paste<CR>"*p:set nopaste<CR>i
inoremap <F5> <ESC>:set paste<CR>"+p:set nopaste<CR>i

" Check Platform
function! MySys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" latex-suite plugin
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

function! RemoteLaTeX()
    let g:Tex_ViewRule_dvi="xdvi -editor 'gvim --servername \"".expand("%:p")
        \."\" --remote-silent'"
    augr remotelatex
    au!
    augr END
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open document and put cursor to the last editing position
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gui settings

if has("gui")
	set guifont=Monaco:h12
	colorscheme evening

	" maximize window
	set lines=999 
	set columns=999
	set go-=L
else
	colorscheme desert
endif

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

set number
" set the line number color to dark cyan
hi LineNr ctermfg=darkcyan ctermbg=black

" miniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" combine project window and taglist window
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap <leader>wm :WMToggle<cr>

" quick fix plugin
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

" auto fold 
set completeopt=longest,menu
set fdm=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map buffer operation shortcuts
imap <M-1> <C-O>:hide buffer 1<cr>
imap <M-2> <C-O>:hide buffer 2<cr>
imap <M-3> <C-O>:hide buffer 3<cr>
imap <M-4> <C-O>:hide buffer 4<cr>
imap <M-5> <C-O>:hide buffer 5<cr>
imap <M-6> <C-O>:hide buffer 6<cr>
imap <M-7> <C-O>:hide buffer 7<cr>
imap <M-8> <C-O>:hide buffer 8<cr>
imap <M-9> <C-O>:hide buffer 9<cr>
nmap <M-1> :hide buffer 1<cr>
nmap <M-2> :hide buffer 2<cr>
nmap <M-3> :hide buffer 3<cr>
nmap <M-4> :hide buffer 4<cr>
nmap <M-5> :hide buffer 5<cr>
nmap <M-6> :hide buffer 6<cr>
nmap <M-7> :hide buffer 7<cr>
nmap <M-8> :hide buffer 8<cr>
nmap <M-9> :hide buffer 9<cr>
imap <M-`> <C-O>:hide bnext<cr>
nmap <M-`> :hide bnext<cr>
imap <M-~> <C-O>:hide bprev<cr>
nmap <M-~> :hide bprev<cr>

imap 1 <C-O>:hide buffer 1<cr>
imap 2 <C-O>:hide buffer 2<cr>
imap 3 <C-O>:hide buffer 3<cr>
imap 4 <C-O>:hide buffer 4<cr>
imap 5 <C-O>:hide buffer 5<cr>
imap 6 <C-O>:hide buffer 6<cr>
imap 7 <C-O>:hide buffer 7<cr>
imap 8 <C-O>:hide buffer 8<cr>
imap 9 <C-O>:hide buffer 9<cr>
nmap 1 :hide buffer 1<cr>
nmap 2 :hide buffer 2<cr>
nmap 3 :hide buffer 3<cr>
nmap 4 :hide buffer 4<cr>
nmap 5 :hide buffer 5<cr>
nmap 6 :hide buffer 6<cr>
nmap 7 :hide buffer 7<cr>
nmap 8 :hide buffer 8<cr>
nmap 9 :hide buffer 9<cr>
imap <M-`> <C-O>:hide bnext<cr>
nmap <M-`> :hide bnext<cr>
imap <M-~> <C-O>:hide bprev<cr>
nmap <M-~> :hide bprev<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

"s:查找C语言符号，即查找函数名、宏、枚举值等出现的地方 
nmap <C-,>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"g:查找函数、宏、枚举等定义的位置，类似ctags所提供的功能 
nmap <C-,>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"c: 查找调用本函数的函数 
nmap <C-,>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"t: 查找指定的字符串 
nmap <C-,>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"e: 查找egrep模式，相当于egrep功能
nmap <C-,>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"f: 查找并打开文件，类似vim的find功能 
nmap <C-,>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"i: 查找包含本文件的文件 
nmap <C-,>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"d: 查找本函数调用的函数 
nmap <C-,>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

"MEMO: the convinient command to gen cscope file
"find . -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files
"cscope -bkq -i cscope.files
"ctags -R

" quick fix option for make,cn,cp
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr> 

" switch between header and source file
map <leader>sw :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" mark those exceed 80 columns
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.*/
nmap <leader>mm :match OverLength /\%81v.*/<cr>
nmap <leader>mc :match OverLength //<cr>

" nmap <leader>gdb :run! macros/gdb_mappings.vim<CR>

" dictionary
set dictionary=/usr/share/dict/words

" cpp tags
set tags+=~/.vim/tags/cpp

" Tabular mapping
" Align the text to `='
map <leader>t= :Tab/=<cr>

" NERDTree mapping
map <F3> :NERDTreeToggle<CR>

" map gundo
map <F5> :GundoToggle<CR>
