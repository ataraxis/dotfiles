set nocompatible          " Be iMproved
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish'
Bundle 'Lokaltog/vim-powerline'
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'kien/ctrlp.vim'
Bundle 'argtextobj.vim'
Bundle 'mileszs/ack.vim'

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
Bundle 'whatyouhide/vim-gotham'

filetype plugin indent on


syntax on

set encoding=utf-8        " One encoding to rule them all
set rnu                   " Relative line numbers rock
set number                " 'Hybrid' line number mode
set ignorecase            " Ignore case in search ...
set smartcase             "  unless upper case chars occur in search string

" Tab width of 2 in scala, js and coffee; 4 in everything else
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType javascript,coffe,scala setlocal sw=2 sts=2 ts=2 et

" Store swap files out of the way of git/sbt
silent !mkdir $HOME/.vim/swap > /dev/null 2>&1
set directory=$HOME/.vim/swap//

set t_Co=256
set background=dark
colorscheme jellybeans

if has('gui_running')
  set nomousehide
  set guioptions-=T
endif

let mapleader = "\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

inoremap <C-Space> <C-x><C-o>


" Enable fancy symbols in Powerline
set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h14
set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 11
let g:Powerline_symbols = 'fancy'

" Remove trailing whitespace
autocmd FileType bash,c,coffee,css,html,java,javascript,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

" Auto-clean Fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Search by filename (not full path) by default
let g:ctrlp_by_filename = 1
set wildignore+=*/target/*,*.class,*.jar,*.log


" Map w!! to write file with sudo, when forgot to open with sudo.
cmap w!! w !sudo tee % >/dev/null

" More natural splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set tab label to current directory
"function! GuiTabLabel()
"  return substitute( getcwd(), '.\+\/', '', '' )
"endfunction
"set guitablabel=%{GuiTabLabel()}


" Automatically reload changes to .vimrc
if has('autocmd')
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
