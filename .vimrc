set nocompatible          " Be iMproved
filetype off

set encoding=utf-8        " One encoding to rule them all
set rnu                   " Relative line numbers rock
set number                " 'Hybrid' line number mode
set ignorecase            " Ignore case in search ...
set smartcase             "  unless upper case chars occur in search string
set showmatch             " Highlight matching [{()}]
set incsearch             " Search as characters are entered
set hlsearch              " Highlight search matches

" Tab width of 2 in scala, js/ts and html; 4 in everything else
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

if has('gui_running')
  set nomousehide
  set guioptions-=T
  set guioptions-=m
endif


" Move vertically by visual line
nnoremap j gj
nnoremap k gk

let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <leader>l :nohlsearch<CR>
nnoremap <Leader>o :Files<CR>
"nnoremap <C-p> :Files<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


" Remove trailing whitespace
autocmd FileType bash,c,css,html,java,javascript,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set .sbt filetype to scala
autocmd BufRead,BufNewFile *.sbt set filetype=scala

set wildignore+=*/target/*,*.class,*.jar,*.log,*.min.js,*.svg

" Map w!! to write file with sudo, when forgot to open with sudo.
cmap w!! w !sudo tee % >/dev/null

" More natural splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

