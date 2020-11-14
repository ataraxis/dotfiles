set nocompatible          " Be iMproved
filetype off

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'leafgarland/typescript-vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'mileszs/ack.vim'

" Color schemes
Plug 'vim-scripts/BusyBee'
Plug 'vim-scripts/darkburn'
Plug 'vim-scripts/darktango.vim'
Plug 'vim-scripts/jellybeans.vim'
Plug 'vim-scripts/twilight'
Plug 'vim-scripts/Zmrok'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'cocopon/iceberg.vim'
Plug 'croaker/mustang-vim'
Plug 'gregsexton/Muon'
Plug 'whatyouhide/vim-gotham'
Plug 'fcpg/vim-fahrenheit'

" Initialize plugin system
call plug#end()


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

nnoremap <Leader>w :w<CR>
nnoremap <leader>l :nohlsearch<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <C-p> :Files<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"inoremap <C-Space> <C-x><C-o>


" Enable fancy symbols in Powerline
set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 10
"set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 11
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" Remove trailing whitespace
autocmd FileType bash,c,css,html,java,javascript,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

" Auto-clean Fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

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


" Set tab label to current directory
"function! GuiTabLabel()
"  return substitute( getcwd(), '.\+\/', '', '' )
"endfunction
"set guitablabel=%{GuiTabLabel()}


" Automatically reload changes to .vimrc
if has('autocmd')
  autocmd bufwritepost .vimrc source $MYVIMRC
endif


let s:fontsize = 11
let s:font="Bitstream Vera Sans Mono for Powerline"
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  call rpcnotify(1, 'Gui', 'Font', s:font . ' ' . s:fontsize)
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a


""""""""""""""""
" Coc settings "
""""""""""""""""

" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <Leader>k <Plug>(coc-diagnostic-prev)
nmap <Leader>j <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>r  :<C-u>CocListResume<CR>
