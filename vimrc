set nocompatible              " be iMproved, required
set tabstop=2
set shiftwidth=2
set number
set expandtab

" set clipboard=unnamed

filetype off                  " required

syntax on
" colorscheme codeschool
colorscheme railscasts
"set background=dark
"colorscheme gruvbox

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
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/buffet.vim'
Plugin 'munen/find_yaml_key'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'vim-syntastic/syntastic'
Plugin 'ngmy/vim-rubocop'


call vundle#end()            " required
filetype plugin indent on    " required

let mapleader="."

" Vim ruby debugger
"let g:ruby_debugger_progname = 'vim'
"let g:ruby_debugger_debug_mode = 1

" Ctags
set tags=./tags;

" NERDTree
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
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

" Mapping for Ctrl-]
nnoremap <C-D> <C-]>

" Ctrl + r instead of Ctrl-w + r for windows rotation.
nnoremap <C-R> <C-W><C-R>
" Ctrl + x instead of Ctrl-w + x for windows exchange.
nnoremap <C-X> <C-W><C-X>

" Some remaps to insert a blank line before and after
" without entering in insert mode (almost)
nmap <S-Enter> O<Esc> "it doesn't work

nmap <CR> o<Esc>

" RSPEC PLUGIN DEFINITIONS
" ========================

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Map for buffers explorer
map <F2> :Bufferlist<CR>

" Map to find keys in translations yml
ca fk FindYamlKey

"let @po="orequire 'pry' ; binding.pry"
"let @pO="Orequire 'pry' ; binding.pry"

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%121v.\+/
"
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" CtrlP configuration
set grepprg=ag\ --nogroup\ --nocolor
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.sass-cache$|\.hg$\|\.svn$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ 
  \ }

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

let g:syntastic_ignore_files = ['\.ui', '\.erb', '\.css', '\.scss']
