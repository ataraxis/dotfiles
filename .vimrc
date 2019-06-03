set nocompatible          " Be iMproved
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
"Plug 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'derekwyatt/vim-scala'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'mileszs/ack.vim'
"Plug 'ensime/ensime-vim'

" Color schemes
Plugin 'vim-scripts/BusyBee'
Plugin 'vim-scripts/darkburn'
Plugin 'vim-scripts/darktango.vim'
Plugin 'vim-scripts/jellybeans.vim'
Plugin 'vim-scripts/twilight'
Plugin 'vim-scripts/Zmrok'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'cocopon/iceberg.vim'
Plugin 'croaker/mustang-vim'
Plugin 'gregsexton/Muon'
Plugin 'whatyouhide/vim-gotham'
Plugin 'fcpg/vim-fahrenheit'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


set encoding=utf-8        " One encoding to rule them all
set rnu                   " Relative line numbers rock
set number                " 'Hybrid' line number mode
set ignorecase            " Ignore case in search ...
set smartcase             "  unless upper case chars occur in search string
set showmatch             " Highlight matching [{()}]
set incsearch             " Search as characters are entered
set hlsearch              " Highlight search matches

" Tab width of 2 in scala, js and coffee; 4 in everything else
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType javascript,typescript,scala,html setlocal sw=2 sts=2 ts=2 et

" Store swap files out of the way of git/sbt
silent !mkdir $HOME/.vim/swap > /dev/null 2>&1
set directory=$HOME/.vim/swap//

set t_Co=256
set background=dark
colorscheme jellybeans

if has('gui_running')
  set nomousehide
  set guioptions-=T
  set guioptions-=m
endif


" Move vertically by visual line
nnoremap j gj
nnoremap k gk

let mapleader = "\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>l :nohlsearch<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

inoremap <C-Space> <C-x><C-o>


" Enable fancy symbols in Powerline
set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 10
"set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 11
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" Remove trailing whitespace
autocmd FileType bash,c,coffee,css,html,java,javascript,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

" Auto-clean Fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Search by filename (not full path) by default
let g:ctrlp_by_filename = 1
set wildignore+=*/target/*,*.class,*.jar,*.log,*.min.js,*.svg
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" The Silver Searcher
let g:ackprg = 'ag --vimgrep'

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
