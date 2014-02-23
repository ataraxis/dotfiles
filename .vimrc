

call pathogen#infect()
syntax on
filetype plugin indent on


set nocompatible          " Who cares about VI compatability
set laststatus=2          " Always show the statusline
set encoding=utf-8        " Necessary to show Unicode glyphs
set rnu                   " Relative line numbers rock
set number                " 'Hybrid' line number mode
set tabstop=2
set softtabstop=2
set expandtab
set incsearch             " Incremental search
set ignorecase            " Ignore case in search ...
set smartcase             "  unless upper case chars occur in search string
set bs=indent,eol,start

set t_Co=256
set background=dark
colorscheme desert


" Enable fancy symbols in Powerline
set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h14
set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 11
let g:Powerline_symbols = 'fancy'

" Auto-clean Fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete


" Map w!! to write file with sudo, when forgot to open with sudo.
cmap w!! w !sudo tee % >/dev/null

" More natural splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
