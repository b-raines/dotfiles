set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
" Plugin 'tpope/gem-ctags'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
" Plugin 'xolox/vim-misc'
Plugin 'rking/ag.vim'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
" Plugin 'ervandew/supertab'
Plugin 'mkitt/tabline.vim'
Plugin 'Yggdroot/indentLine'
" Plugin 'gioele/vim-autoswap'
Plugin 'keith/swift.vim'
Plugin 'mxw/vim-jsx'
Plugin 'shmup/vim-sql-syntax'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Config
let mapleader=","
let g:mapleader=","
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_reuse_window = 'nerdtree'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let NERDTreeQuitOnOpen = 1
let g:indentLine_color_term = 239
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_color_tty_dark = 1
let g:easytags_async = 1
ca Ag Ag!
set synmaxcol=320
set wildignore+=*/vendor/*,*/tmp/*,*/public/*,*/certs/*,*.so,*.swp,*.zip
set expandtab
set hidden
set hlsearch
set ignorecase
set number
set omnifunc=syntaxcomplete#Complete
set shiftwidth=2
set showmatch
set smartcase
set splitbelow
set splitright
set tabstop=2
set textwidth=0
set undofile
set undodir=~/.vim/undodir
set viminfo^=%
set wrap linebreak nolist
set wrapmargin=0
set relativenumber
syntax enable

" Color scheme
colorscheme desert
let g:colors_name="desert"
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" Mappings
map <C-n> :NERDTreeFind<CR>
map <C-m> :NERDTreeToggle<CR>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
au BufRead,BufNewFile Podfile set filetype=ruby
au BufRead,BufNewFile Fastfile set filetype=ruby

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype liquid setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype gitcommit setlocal wrap linebreak nolist spell textwidth=72

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
