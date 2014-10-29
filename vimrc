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
