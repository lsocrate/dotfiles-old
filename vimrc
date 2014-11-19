set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'wavded/vim-stylus'
Bundle 'heartsentwined/vim-emblem'
Bundle 'nono/vim-handlebars'
Bundle 'kchmck/vim-coffee-script'
Bundle 'elzr/vim-json'
Bundle 'mattn/emmet-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/PreserveNoEOL'
Bundle 'editorconfig/editorconfig-vim'

Plugin 'flazz/vim-colorschemes'

" Show trailing spaces
set listchars=trail:.,tab:--
set list

" Syntax highlight
syntax on

" Display line numbers
set number

" Indenting
set autoindent smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

set encoding=utf-8

colorscheme candy

" Support all markdown extensions
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown

" Backup and tmp files
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Status line
set laststatus=2
set statusline=%f
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L

" code width
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Trim whitespace
autocmd FileType php,javascript,python,html,handlebars.html autocmd BufWritePre <buffer> :%s/\s\+$//e

" Autocomplete
set complete=.,w,b,u,U,t,i,d
set completeopt-=preview
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Shortcuts
let mapleader = " "
" -- Tabs
nnoremap to :Texplore<CR>
nnoremap tt :tabnew<CR>
nnoremap te :tabedit
nnoremap tc :tabclose<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
" -- Syntastic
nnoremap <leader>l :SyntasticCheck<CR>
