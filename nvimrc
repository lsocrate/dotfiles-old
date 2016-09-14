filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'wavded/vim-stylus'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'cohama/lexima.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'othree/html5.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'chriskempson/base16-vim'
Plug 'pangloss/vim-javascript'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdtree'
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'digitaltoad/vim-jade'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'lervag/vimtex'


" Add plugins to &runtimepath
call plug#end()

filetype plugin on

" Show trailing spaces
set list listchars=tab:»·,trail:·,nbsp:·

" Display line numbers
set number
set numberwidth=5
set scrolloff=5

" Indenting
set autoindent smartindent
set expandtab

" Colorschemes
let base16colorspace=256
set background=dark
colorscheme base16-monokai
set nohlsearch

" Remember position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Support all markdown extensions
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown

" Support other json extensions
au BufNewFile,BufRead .jshintrc set filetype=json

" Backup and tmp files
set backup
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/tmp

" Autoreload files changed on disk
set autoread

" Status line
set laststatus=2

" code width
set colorcolumn=81

" Trim whitespace
autocmd FileType php,javascript,python,html,handlebars.html autocmd BufWritePre <buffer> :%s/\s\+$//e

" Autocomplete
set complete=.,w,b,u,U,t,i,d
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete

" Split to right and bottom. Makes more sense
set splitbelow
set splitright

" This allows buffers to be hidden if you've modified a buffer.
set hidden

" Visual autocomplete
set wildmenu

" Disable mouse
set mouse=

" Git commit messages should start with cursor on line 1
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])


" ----- JAVASCRIPT -----
" Highlight jsdoc
let g:javascript_plugin_jsdoc = 1

" ----- JSDOC -----
" Underscore is private
let g:jsdoc_underscore_private = 1

" Enable es6
let g:jsdoc_enable_es6 = 1

" ----- AIRLINE -----
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" ----- CtrlP -----
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|bower_components|tmp|dist|plugins)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" ----- Buffergator -----
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" ----- NERDTree -----
let g:nerdtree_tabs_open_on_gui_startup = 0

" ----- Neomake -----
let g:neomake_verbose = 0
let g:neomake_javascript_enabled_makers = ['jshint', 'eslint']
" Make run authomatically on saves
autocmd FileType javascript autocmd BufWritePost * Neomake

" #########
" Shortcuts
let mapleader = " "

" Format JSON
map <leader>j !python -m json.tool<CR>

" Activate and deactivate paste mode
nmap <leader>v :set paste!<cr>

" To open a new empty buffer
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>h :BuffergatorMruCyclePrev<cr>

" Move to the previous buffer
nmap <leader>l :BuffergatorMruCycleNext<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Easy split
nmap <silent><C-w>n :vsplit<cr>

" Nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

" Jsdoc
nmap <silent> <C-l> <Plug>(jsdoc)
