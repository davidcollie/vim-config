set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Gundo'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'

"language specific
Plugin 'elzr/vim-json.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'

call vundle#end()
" Enable filetype plugin
filetype plugin indent on

colors zenburn


" Make the command-line completion better
set wildmenu


"ignore certain files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/target/*,*/bower_components/*,*/bin/*,*/lib_managed/*

"ctrl-p ignore dot files
let g:ctrlp_dotfiles = 0

"map Gundo
nnoremap <F4> :GundoToggle<CR>

"syntastic disabled by default
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-e> :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

let g:SuperTabDefaultCompletionType = "context"

if has('gui_running')
	if has('unix')
		set guifont=Menlo:h12
	else
		set guifont=Consolas:h11:cANSI
	endif
	" remove toolbar, right and left scrollbars
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
endif

set numberwidth=4


" auto change windows present working directory to file being edited
autocmd BufEnter * silent! lcd %:p:h

" Set to auto read when a file is changed from the outside
set autoread

" Enable line numbers
set number

" Turn of line wrap
set nowrap

set ignorecase "Ignore case when searching
set smartcase

set hlsearch! "Highlight search things
nnoremap <esc> :noh<return><esc>


set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions


set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

syntax on

highlight ColorColumn ctermbg=grey guibg=#333333
let &colorcolumn=join(range(81,500),",")

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"turn on indenting
set autoindent
set smartindent

"always use space
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab


" show as much whitespace as possible
set listchars=tab:»\ ,eol:¬,nbsp:·,trail:·,extends:>,precedes:<
set list

"folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

au FileType cs set omnifunc=syntaxcomplete#Complete

let mapleader = ","
set diffexpr=

