set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set incsearch
set relativenumber
set autoread
set hlsearch
set lazyredraw
set showmatch


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'mkitt/tabline.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme dracula

let NERDTreeQuitOnOpen = 1

" Leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Moving around windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"
" " Managing tabs
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tm :tabmove

" Managing COC
nnoremap <Leader>gd :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap <Leader>gr :call CocAction('jumpReferences')<CR>
nnoremap <Leader>i :call CocAction('doHover')<CR>

" File system
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>b :NERDTree %<CR>


" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
