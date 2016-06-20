:let $LANG="en"
set langmenu=en
source $VIMRUNTIME/vimrc_example.vim
set guioptions-=T
"source $VIMRUNTIME/mswin.vim
"behave mswin
" -----------------------------------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

" vundle {

set nocompatible
filetype off                  " required
if !g:iswindows
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

"call vundle#begin()
"
" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'tpope/vim-rails.git'
"Plugin 'altercation/solarized'
Plugin 'tomasr/molokai'
Plugin 'xolox/vim-misc'
"Plugin 'clang-complete'
Plugin 'Syntastic'
Plugin 'Tagbar'

" vim-scripts repos
"Plugin 'bufexplorer.zip'
Plugin 'The-NERD-tree'
Plugin 'a.vim'
"Plugin 'minibufexpl.vim'	
"Plugin 'luainspect.vim'
Plugin 'ctrlp.vim'
Plugin 'grep.vim'
"Plugin 'cscope.vim'
Plugin 'TagHighlight'
Plugin 'delimitMate.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'bling/vim-airline'
Plugin 'FelikZ/ctrlp-py-matcher'
"Plugin 'Conque-Shell'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'commentary.vim'
" non github reposo
" ...

" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"color
syntax on
syntax enable
"set background=dark
colorscheme molokai
"let w:solarized_style="dark"
"let g:solarized_termcolors=256

"font
set guifont=Hermit:h18
"set guifontwide=幼圆:h18

"size
set lines=40
set columns=150

"cmd
set showcmd
set showmode
set cmdheight=2
set wildmenu

"status line
set laststatus=2 
set history=100

set nobackup
set confirm
set nu
set cursorline
"complete
set completeopt=longest,menu,preview
set tags+=tags
set autochdir

"indent
set shiftwidth=4
set tabstop=4
set smarttab
set shiftround
set smartindent
set cindent

"match
set showmatch
set matchtime=1

"search
set hls
set incsearch   
set ignorecase
set magic

"copy
set clipboard+=unnamed

"diff
set diffopt+=vertical

"encoding
set fencs=ucs-bom,utf-8,shift-jis,gb18030,gbk,gb2312,cp936
set fenc=utf-8
set encoding=utf-8
"set langmenu=en_US
"let $LANG='en_US'
"set langmenu=zh_CN.utf-8
"language messages zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"minibuffer
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplForceSyntaxEnable = 1
"let g:miniBufExplSplitToEdge = 1
"let g:miniBufExplorerMoreThanOne=0

"leader
let mapleader='f'
:set timeout timeoutlen=500
"ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = "raw"
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|obj|lib)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
let g:ctrlp_root_markers = ['myroot']
let g:ctrlp_max_files = 10000
let g:ctrlp_clear_cache_on_exit = 0
nnoremap <silent><s-P> :CtrlPCmdPalette<CR>
nnoremap <silent><leader>r :CtrlPFunky<CR>
nnoremap <silent><leader>b :CtrlPBuffer<CR>
let g:ctrlp_extensions = ['funky']
if !has('python')
	echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
	let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

"luainspector
"let g:lua_inspect_events = ''
"let g:lua_inspect_warnings = 0
"inoremap <F6> <C-o>:LuaInspectToggle<CR>
"nnoremap <F6>      :LuaInspectToggle<CR>
"Taglist
inoremap <F8> <C-o>:TagbarOpenAutoClose<CR>
nnoremap <F8> :TagbarOpenAutoClose<CR>
"The-Nerd-Tree
inoremap <F9> <C-o>:NERDTreeTabsToggle<CR>
nnoremap <F9> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0
"clang-complete
"let g:clang_complete_copen=1
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000
highlight SyntasticError guibg=#2f0000

"air line
"let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
nnoremap <silent><c-tab> :bn<CR>
nnoremap <silent><c-s-tab> :bp<CR>
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

nnoremap <silent><leader>q :bd<CR>

nnoremap <silent><leader>x :simalt ~x<CR>

"neocomplete
let g:neocomplete#enable_at_startup = 1
