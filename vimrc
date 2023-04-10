" For Rust analyzer check this website => https://rust-analyzer.github.io/manual.html

" Misc 
set undofile
set backup
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Mouse support
set mouse=a

" enable syntax
syntax on
filetype plugin indent on
set encoding=utf-8
set nocompatible 

" line number
set number
set relativenumber

" highlight
set cursorline
:highlight Cursorline cterm=bold ctermbg=black
set incsearch
nnoremap <silent> <C-r> :set colorcolumn=80 <CR><C-r>
nnoremap <silent> <C-v> :set colorcolumn-=80 <CR><C-v>

" highlight
set hlsearch

" smart case
set smartcase
set ignorecase

" Indentation
set tabstop		=4
set softtabstop	=4
set shiftwidth	=4
set textwidth	=79
set expandtab

set autoindent
set smartindent
set cindent

" Qhow matching pair
set showmatch

" Remove traling whitespace
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.rs :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufNewFile,BufRead *.rs set filetype=rust

" Enable color theme
if !has('gui_running')
    set t_Co=256
endif

" Colors support
set termguicolors

" Vim colorscheme
colorscheme koehler

" Unhighlight
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Find a files
set wildmenu
set path+=**

" Search with nohlsearch
nnoremap <silent> <C-n> :nohlsearch<CR><C-n>

nnoremap <C-i> :tabn<CR>
nnoremap <C-p> :tabnew<CR>

"""""""""""""""""""""""""""""
"      PLUGINS
"""""""""""""""""""""""""""""

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'vimsence/vimsence'

call plug#end()

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

" Rust configuration

let g:ale_linters = {
\  'rust': ['analyzer'],
\}

let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }

" Optional, configure as-you-type completions
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>

