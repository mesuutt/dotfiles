iab chlog <c-r>=strftime("%Y-%m-%d")<cr>  Alper KANAT  <alperkanat@raptiye.org><cr>
map <F4> :set filetype=
map <F5> :set syntax=
map <F6> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
map <F7> :set wrap<CR>:set textwidth=80<CR>
map <F8> :vs<CR>:bn<CR>
map <C-x> :qa!<CR>
nnoremap <silent> <F9> :TlistToggle<CR>

set nocompatible
set hlsearch
set incsearch
set showmatch
set ts=4
set sts=4
set sw=4
set expandtab
set backspace=indent,eol,start
set fileencoding=utf-8
set encoding=utf-8
set history=50
set showcmd
set showmatch
set title
set wildmenu
set nowrap
set ai
set nu
set mouse=
set nobackup
set laststatus=2
set background=dark
set ruler
set smarttab
set smartindent

colorscheme elflord

if has("autocmd")
    filetype plugin indent on
endif

filetype plugin on
syn on
