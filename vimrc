set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'gioele/vim-autoswap'
Plug 'hail2u/vim-css3-syntax'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'keith/swift.vim'
Plug 'mkitt/tabline.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'prettier/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'shmup/vim-sql-syntax'
Plug 'tpope/gem-ctags'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'
Plug 'xolox/vim-misc'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentLine'

call plug#end()

" Config
let mapleader=","
let g:mapleader=","
let NERDTreeQuitOnOpen = 1
let g:indentLine_color_term = 239
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_color_tty_dark = 1
let g:easytags_async = 1
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
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
map <leader>gb :Gblame<cr>
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
au BufRead,BufNewFile Matchfile set filetype=ruby
au BufRead,BufNewFile Snapfile set filetype=ruby
au BufRead,BufNewFile Gymfile set filetype=ruby
au BufRead,BufNewFile Deliverfile set filetype=ruby
au BufRead,BufNewFile Appfile set filetype=ruby

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
