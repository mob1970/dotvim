set nocompatible              " be iMproved, required
set tabstop=2
set shiftwidth=2
set number
set expandtab
filetype off                  " required

syntax on

autocmd BufWritePre *.rb :%s/\s\+$//e

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'craigemery/vim-autotag'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'astashov/vim-ruby-debugger'
Plugin 'vim-scripts/AutoComplPop'
"Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader="."

" Vim ruby debugger
"let g:ruby_debugger_progname = 'vim'
"let g:ruby_debugger_debug_mode = 1

" NERDTree
map <C-t> :NERDTreeToggle<CR>
"map <C-t> <plug>:NERDTreeTabsToggle<CR>
"let g:NERDTreeDirArrows=0

nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" MOVEMENT HACKS SECTION
" ======================

" Disabling row keys for using only h, j, k & l.
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Ctrl + hjkl instead of Ctrl-w + hjkl for window changing.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ctrl + r instead of Ctrl-w + r for windows rotation.
nnoremap <C-R> <C-W><C-R>
" Ctrl + x instead of Ctrl-w + x for windows exchange.
nnoremap <C-X> <C-W><C-X>

" RSPEC PLUGIN DEFINITIONS
" ========================

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%121v.\+/
"
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
