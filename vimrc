" neobundle install
" git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

" Required:
filetype off
filetype plugin indent off

""" Initial Settings.
" ビジュアルモードで選択するとクリップボードに入れる
set guioptions+=a
set hlsearch
set noautoindent
set noswapfile
set nowrap
set ruler
set title
set tabstop=4
" □ ◯oとかをきれいに表示
set ambiwidth=double
" コマンドモードの補完
"set wildmenu
" コマンドモードでの補完設定
"set wildmode=longest:full,list
" カーソル行をハイライト重い
"set cursorline
" 矩形選択で自由に移動する
set virtualedit+=block

" 自動コメント無効
augroup auto_comment_off
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=r
	autocmd BufEnter * setlocal formatoptions-=o
augroup END

""" Neobundle Settings.
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomasr/molokai'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'terryma/vim-expand-region'
"NeoBundle "ctrlpvim/ctrlp.vim"
"NeoBundle 'fatih/vim-go'
call neobundle#end()

""" neocomplcache Settings.
let g:neocomplcache_enable_at_startup = 1

"""" neosnippet Settings.
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"
"" For snippet_complete marker.
"if has('conceal')
"	set conceallevel=2 concealcursor=i
"endif

""" PHP用の辞書読込 for mk_phpdic.php
autocmd FileType php  :set dictionary=~/.vim/php.dict
""" PHP Syntax Check
"autocmd FileType php set makeprg=php\ -l\ %
"autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

""" quickrun Settings.
let g:quickrun_config={'*': {'split': 'vertical'}}

""" colorscheme Settings.
syntax on
"colorscheme molokai

""" indentLine Settings.
set list listchars=tab:\|\ 
let g:indentLine_faster = 1

""" キー割当 Settings.
"nnoremap <silent><C-t> :NERDTreeToggle<CR>
map <C-t> <plug>NERDTreeTabsToggle<CR>
nnoremap <Esc><Esc> :<C-u>nohlsearch<cr><Esc>

" Required:
filetype plugin on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck


"" タブ関連
" Anywhere SID.
function! s:SID_PREFIX()
	return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
	let s = ''
	for i in range(1, tabpagenr('$'))
		let bufnrs = tabpagebuflist(i)
		let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
		let no = i  " display 0-origin tabpagenr.
		let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
		let title = fnamemodify(bufname(bufnr), ':t')
		let title = '[' . title . ']'
		let s .= '%'.i.'T'
		let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
		let s .= no . ':' . title
		let s .= mod
		let s .= '%#TabLineFill# '
	endfor
	let s .= '%#TabLineFill#%T%=%#TabLine#'
	return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
	execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> <C-n> :tabnext<CR>
" tn 次のタブ
map <silent> <C-p> :tabprevious<CR>
" tp 前のタブ

"" easymotion

"" expand-region
"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)

