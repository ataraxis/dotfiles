set nocompatible          " Be iMproved
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'kien/ctrlp.vim'
Bundle 'argtextobj.vim'

" Color schemes
Bundle 'BusyBee'
Bundle 'darkburn'
Bundle 'darktango.vim'
Bundle 'jellybeans.vim'
Bundle 'twilight'
Bundle 'Zmrok'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'cocopon/iceberg.vim'
Bundle 'croaker/mustang-vim'
Bundle 'gregsexton/Muon'

filetype plugin indent on


syntax on

set encoding=utf-8        " Necessary to show Unicode glyphs
set rnu                   " Relative line numbers rock
set number                " 'Hybrid' line number mode
set tabstop=2
set softtabstop=2
set expandtab
set ignorecase            " Ignore case in search ...
set smartcase             "  unless upper case chars occur in search string

silent !mkdir $HOME/.vim/swap > /dev/null 2>&1
"call mkdir($HOME . "/.vim/swap", 'p')
set directory=$HOME/.vim/swap//

set t_Co=256
set background=dark
colorscheme jellybeans

if has('gui_running')
  set nomousehide
  set guioptions-=T
endif

let mapleader=","

inoremap <C-Space> <C-x><C-o>


" Enable fancy symbols in Powerline
set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h14
set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 11
let g:Powerline_symbols = 'fancy'

" Remove trailing whitespace
autocmd FileType bash,c,coffee,css,java,html,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

" Auto-clean Fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Search by filename (not full path) by default
let g:ctrlp_by_filename = 1
set wildignore+=*/target/*,*.class,*.jar


" Map w!! to write file with sudo, when forgot to open with sudo.
cmap w!! w !sudo tee % >/dev/null

" More natural splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Automatically reload changes to .vimrc
if has('autocmd')
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
