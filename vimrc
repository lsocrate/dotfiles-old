set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'wavded/vim-stylus'
Bundle 'heartsentwined/vim-emblem'
Bundle 'kchmck/vim-coffee-script'
Bundle 'elzr/vim-json'
Bundle 'mattn/emmet-vim'
Bundle 'Raimondi/delimitMate'


set listchars=trail:.,tab:--
set list

syntax on
set number
set autoindent smartindent

set expandtab
set shiftwidth=2
set tabstop=2

set smarttab

set encoding=utf-8

" Support all markdown extensions
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set laststatus=2
set statusline=%f
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L
