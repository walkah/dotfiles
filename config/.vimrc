"
" walkah's vimrc (vim 6)
"
" $Id: .vimrc,v 1.2 2005-11-08 20:17:32 walkah Exp $

" no compatible
set nocp

" don't wrap lines
set nowrap

" don't keep backups
set nobackup

" visual bell
set visualbell

set laststatus=2

" indenting stuff
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent

set title

" folding
set foldmethod=marker

" search
set nohlsearch
set incsearch
set ignorecase

set showmatch

" syntax hilighting
syntax on

" mappings
map <PageUp> <C-B>
map <PageDown> <C-F>
