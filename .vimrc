set guifont=menlo:h13
set bsdir=buffer
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
syntax on
set number
set hlsearch
set history=200
set tabstop=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cindent shiftwidth=2
set autoindent shiftwidth=2
filetype plugin indent on
map <C-S> <C-C>:w<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set nocompatible               " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tomtom/tcomment_vim'
Bundle 'altercation/vim-colors-solarized'
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


execute pathogen#infect()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:Powerline_symbols = 'fancy'
nnoremap <silent> <leader><space> :noh<CR>
if has("gui_running")
	set guifont=menlo:h13
  colorscheme desert
endif

" Activate after saving.
iunmenu File.Save
imenu <silent> File.Save <Esc>:w<CR>

" Inserting empty lines using [enter] when in normal mode.
" map <S-Enter> O<Esc>
" map <CR> o<Esc>k

" Insert spaces using space bar when in normal mode.
nnoremap <space> i<space><esc>

" Remove search highlighting with <leader><space>
"
nnoremap <silent> <leader><space> :noh<CR>

" Saving
" Stripping Whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" Split window resizing
nnoremap <silent> <Leader>= :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>

" up and down lines
nnoremap <S-Down> :m .+1<CR>
nnoremap <S-Up> :m .-2<CR>

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

" window swap
function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
map <silent> <leader>pw :call DoWindowSwap()<CR>
