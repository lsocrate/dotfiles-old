filetype off

call plug#begin('~/.config/nvim/plugged')
" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jeetsukumaran/vim-buffergator'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Marker support
Plug 'kshenoy/vim-signature'

" Build
Plug 'w0rp/ale'

" Languages
Plug 'wavded/vim-stylus'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'kchmck/vim-coffee-script'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'digitaltoad/vim-jade'
Plug 'mxw/vim-jsx'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim' " Typescript highlight
Plug 'hdima/python-syntax'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-stylishask'
Plug 'exu/pgsql.vim'

" HTML structure builder
Plug 'mattn/emmet-vim'

" Auto-close parentheses etc
Plug 'cohama/lexima.vim'

" JSON Validation and formatting
Plug 'alfredodeza/jacinto.vim'

" Misc
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'heavenshell/vim-jsdoc'

" SQL Client
Plug 'vim-scripts/dbext.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on
syntax enable

" Show trailing spaces
set list listchars=tab:»·,trail:·,nbsp:·

" Display line numbers
set number
set numberwidth=3
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

" Support all js extensions
au BufNewFile,BufRead *.js.es6 set filetype=javascript

" Support other json extensions
au BufNewFile,BufRead .jshintrc,.eslintrc set filetype=json

" Typescript
au BufNewFile,BufRead *.ts setlocal filetype=typescript

" Backup and tmp files
set backup
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/tmp

" Autoreload files changed on disk
set autoread

" Status line
set laststatus=2

" code width
set colorcolumn=101

" Trim whitespace
autocmd FileType php,javascript,python,html,handlebars.html autocmd BufWritePre <buffer> :%s/\s\+$//e

" Autocomplete
set complete=.,w,b,u,U,t,i,d
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete

" Enable deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = "omnifunc"
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Do not complete markdown
autocmd FileType markdown let b:deoplete_disable_auto_complete=1

" SQL Connections
source $HOME/.sql_connections.vim

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

" Allow JSX in common js files
let g:jsx_ext_required = 0

" Snippets
autocmd FileType javascript inoremap <C-s>c const 
autocmd FileType javascript inoremap <C-s>l console.log()<left>
autocmd FileType javascript inoremap <C-s>f function ()<left>
autocmd FileType javascript inoremap <C-s>eg get(this, )<left>
autocmd FileType javascript inoremap <C-s>es set(this, )<left>

" ----- PYTHON -----
let python_highlight_all = 1

" ----- SQL -----
let g:sql_type_default = 'pgsql'

" ----- HASKELL -----
let g:haskell_indent_after_bare_where = 0
let g:haskell_indent_guard = 4

" ----- AIRLINE -----
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" ----- Buffergator -----
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" ----- ALE -----
let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = 'Δ'
let g:ale_fixers = {
\ 'javascript': ['prettier']
\}
let g:ale_javascript_prettier_use_global = 1

" #########
" Shortcuts
let mapleader = " "

" Replace current word and allows redoing it with .
nmap <silent><leader>r #*cgn

" Activate and deactivate paste mode
nmap <silent><leader>v :set paste!<cr>

" To open a new empty buffer
nmap <silent><leader>t :enew<cr>

" Ale fix
nmap <silent><leader>f :ALEFix<cr>

" Move to the next buffer
nmap <silent><leader>h :BuffergatorMruCyclePrev<cr>

" Move to the previous buffer
nmap <silent><leader>l :BuffergatorMruCycleNext<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <silent><leader>q :bp <BAR> bd #<CR>

" Easy split
nmap <silent><C-w>n :vsplit<cr>

" Nerdtree
nnoremap <silent><leader>nt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" Jsdoc
nmap <silent><leader>d <Plug>(jsdoc)

" Lint
nmap <silent><silent><C-l> :ALELint<cr>

" Increase number with Ctrl + i
nmap <C-i> <C-a>

"""""
" FZF
"""""
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" Filter files
nmap <silent><leader>p :GFiles<cr>

" Filter open buffers
nnoremap <silent><Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Out of terminal mode
tnoremap jj <C-\><C-n>
