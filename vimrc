set nocompatible
:let $LANG="en"
set langmenu=en
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
" -----------------------------------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

" vundle {
if !g:iswindows
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif
" }
"
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
Bundle 'Solarized'
Bundle 'xolox/vim-misc'
Bundle 'clang-complete'
Bundle 'Syntastic'
Bundle 'Tagbar'

" vim-scripts repos
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'a.vim'
Bundle 'minibufexpl.vim'	
Bundle 'luainspect.vim'
Bundle 'ctrlp.vim'
Bundle 'grep.vim'
Bundle 'cscope.vim'
Bundle 'TagHighlight'
Bundle 'vmark.vim--Visual-Bookmarking'
Bundle 'delimitMate.vim'

" non github reposo
" ...

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"color
syntax on
syntax enable
"set background=dark
colorscheme solarized
let w:solarized_style="dark"
let g:solarized_termcolors=256

"font
set guifont=ConSolas:h16

"size
set lines=30
set columns=60

"cmd
set showcmd
set showmode
set cmdheight=2
set wildmenu

"status line
set laststatus=2 
set ruler
set statusline=
set statusline+=%1*\ %<%F\ 	"File+path
set statusline+=%2*\ %y\ 	"FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %=\ %l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%6*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User3 guifg=#292b00  guibg=#f4f597

set history=100
set nobackup
set confirm
set nu
set cursorline
"complete
filetype plugin indent on 
set completeopt=longest,menu
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
set fenc=utf-8
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set langmenu=zh_CN.utf-8
"language messages zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"minibuffer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplSplitToEdge = 1

"ctrlp
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
let g:ctrlp_root_markers = ['myroot']
let g:ctrlp_max_files = 10000

"luainspector
let g:lua_inspect_events = ''
let g:lua_inspect_warnings = 0
inoremap <F6> <C-o>:LuaInspectToggle<CR>
nnoremap <F6>      :LuaInspectToggle<CR>
"Taglist
inoremap <F8> <C-o>:TagbarOpenAutoClose<CR>
nnoremap <F8> :TagbarOpenAutoClose<CR>
"The-Nerd-Tree
inoremap <F9> <C-o>:NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeToggle<CR>
"clang-complete
let g:clang_complete_copen=1
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000
highlight SyntasticError guibg=#2f0000
