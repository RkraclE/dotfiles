""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""
let mapleader = ";"
map <leader>w :w!<cr>
map <leader>pp :setlocal paste!<cr>
map <leader>sp :setlocal spell!<cr>


""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/vim-plug
" (Plugin settings at end ^G)
""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'vimsence/vimsence'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


""""""""""""""""""""""""""""""""""""
" Formatting
""""""""""""""""""""""""""""""""""""
" For all souls.
filetype plugin indent on
syntax enable
set textwidth=78
set backspace=indent,eol,start

" For the Orthodox among us, may the peace with you.
" https://www.kernel.org/doc/html/v4.10/process/coding-style.html
set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab

" For heretics.
" http://www.vex.net/~x/python_and_vim.html
"set tabstop     =4
"set shiftwidth  =4
"set softtabstop =4
"set expandtab


""""""""""""""""""""""""""""""""""""
" Highlight unwanted whitespace
""""""""""""""""""""""""""""""""""""
highlight default link LinuxError ErrorMsg
syn match LinuxError / \+\ze\t/
syn match LinuxError /\%>80v[^()\{\}\[\]<>]\+/
autocmd InsertEnter * match LinuxError /\s\+\%#\@<!$/
autocmd InsertLeave * match LinuxError /\s\+$/


""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark
set cursorline
set number
set laststatus=2
set showcmd
set showtabline=1
set termguicolors
syntax enable
set number

""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set undofile
set backup
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set mouse=a
set hidden
set complete-=i
set nrformats-=octal
set ruler
set wildmenu
set wildmode=longest,list
set wildignorecase
set showcmd
set scrolloff=5
set sidescrolloff=5
set display+=lastline
set autoread
set history=1000
set tabpagemax=50
set sessionoptions-=options
set lazyredraw
set ttimeout
set ttimeoutlen=100


""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set incsearch
set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


""""""""""""""""""""""""""""""""""""
" Extra / other
""""""""""""""""""""""""""""""""""""
" See the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif


""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""
" nerdtree
map <C-n> :NERDTreeToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" lightline
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive'
  \ },
\ }
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
