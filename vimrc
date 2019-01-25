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
" 矩形選択で自由に移動する
set virtualedit+=block
" backupdir
set backupdir=~/.vim/tmp
" カーソル位置の背景色を変える
"set cursorcolumn
"set cursorline
" ステータス行を常に表示
set laststatus=2
set statusline=%<[%n]%m%r%h%w%y\ %F\ %{fugitive#statusline()}%=\ %{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}\ %l,%c%V%8P

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
" 括弧を自動クローズ
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomasr/molokai'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Lokaltog/vim-easymotion'
" 選択領域
NeoBundle 'terryma/vim-expand-region'
"NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'fatih/vim-go'
"NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'posva/vim-vue'
"NeoBundle 'apple-swift', {'type': 'nosync', 'base': '~/.vim/bundle/manual'} 
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-fugitive'
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

" vim-go Settings.
"" mapping  
""" go runのキーマッピング  
"au FileType go nmap gr (go-run)  
""" go testのキーマッピング  
"au FileType go nmap gt (go-test)  
"" highlight  
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_interfaces = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
"" GoFmt時にインポートするパッケージを整理(GoFmtはファイル書き込み時に自動的に実行される)  
let g:go_fmt_command = "goimports"  

""" quickrun Settings.
let g:quickrun_config={'*': {'split': 'vertical'}}

""" colorscheme Settings.
syntax on
colorscheme molokai
set t_Co=256

""" indentLine Settings.
set list listchars=tab:\|\ 
let g:indentLine_faster = 1

""" キー割当 Settings.
nnoremap <Esc><Esc> :<C-u>nohlsearch<cr><Esc>

""" vim-vue Settings.
autocmd FileType vue syntax sync fromstart

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

" Open and Close
map <C-t> <plug>NERDTreeTabsToggle<CR>
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
	execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> <C-n> :tabnext<CR>
" tp 前のタブ
map <silent> <C-p> :tabprevious<CR>
" 文字化け対応
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeWinSize = 40

"" easymotion

"" expand-region
"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)
