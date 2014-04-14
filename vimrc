set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/vundle/
let path='~/vimfiles/bundle'
call vundle#rc(path)

" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Gundo'
Plugin 'tpope/vim-fugitive'

" Enable filetype plugin
filetype plugin indent on

colors zenburn

set guifont=Consolas:h11:cANSI
set guioptions-=T

set columns=100
set lines=50
set numberwidth=4

if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

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

" tag related configuration
set tags=./tags;/

syntax on

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"turn on indenting
set autoindent
set smartindent

"always use tabs
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

" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen au FileType cs set omnifunc=syntaxcomplete#Complete 
au FileType cs set foldmethod=marker 
au FileType cs set foldmarker={,} 
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',) 
au FileType cs set foldlevelstart=2  

au FileType cs set omnifunc=syntaxcomplete#Complete

let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
"inoremap ( ()<esc>i
"inoremap [ []<esc>i
"inoremap { {}<Left>
"inoremap {<CR> {<CR>}<esc>O
"inoremap ' ''<esc>i
"inoremap " ""<esc>i

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


