execute pathogen#infect()
syntax enable

"colorscheme solarized
"let g:solarized_termcolors=256

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

set number
set ruler
"set background=dark

let g:neocomplete#enable_at_startup = 1
let g:go_disable_autoinstall = 0

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

set wildmenu

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch 

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs!
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
