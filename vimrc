set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-abolish'
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
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'shmup/vim-sql-syntax'
Plug 'tpope/gem-ctags'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
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
Plug 'evanleck/vim-svelte'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

" Config
let mapleader=","
let g:mapleader=","
let NERDTreeQuitOnOpen = 1
let g:syntastic_svelte_checkers = ['javascript/eslint', 'html/htmlhint']
let g:svelte_preprocessor_tags = [
      \ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' }
      \ ]
let g:svelte_preprocessors = ['ts', 'typescript']
let g:indentLine_color_term = 239
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_color_tty_dark = 1
let g:easytags_async = 1
" let g:prettier#config#parser = 'babylon'
" let g:prettier#exec_cmd_async = 1
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_require_pragma = 0
" let g:prettier#autoformat_config_files = ['.prettierrc']
let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
        \      "test": [
          \        "spec/requests/{}_spec.rb",
          \        "spec/controllers/{}_controller_spec.rb",
          \        "test/controllers/{}_controller_test.rb"
          \      ],
          \      "alternate": [
            \        "spec/requests/{}_spec.rb",
            \        "spec/controllers/{}_controller_spec.rb",
            \        "test/controllers/{}_controller_test.rb"
            \      ],
            \   },
            \   "spec/requests/*_spec.rb": {
              \      "command": "request",
              \      "alternate": "app/controllers/{}_controller.rb",
              \      "template": "require 'rails_helper'\n\n" .
              \        "RSpec.describe '{}' do\nend",
              \   },
              \ }
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

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

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
nnoremap <C-p> :Files<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

au BufWrite *.py :call DeleteTrailingWS()
au BufWrite *.rb :call DeleteTrailingWS()
au BufWrite *.js :call DeleteTrailingWS()
au BufWrite *.coffee :call DeleteTrailingWS()
au BufRead,BufNewFile *.html.erb set filetype=eruby.html
au BufRead,BufNewFile *.html.arb set filetype=ruby
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile Podfile set filetype=ruby
au BufRead,BufNewFile Fastfile set filetype=ruby
au BufRead,BufNewFile Matchfile set filetype=ruby
au BufRead,BufNewFile Snapfile set filetype=ruby
au BufRead,BufNewFile Gymfile set filetype=ruby
au BufRead,BufNewFile Deliverfile set filetype=ruby
au BufRead,BufNewFile Appfile set filetype=ruby

au Filetype html setlocal ts=2 sts=2 sw=2
au Filetype liquid setlocal ts=2 sts=2 sw=2
au Filetype ruby setlocal ts=2 sts=2 sw=2
au Filetype eruby setlocal ts=2 sts=2 sw=2
au Filetype javascript setlocal ts=2 sts=2 sw=2
au Filetype gitcommit setlocal wrap linebreak nolist spell textwidth=72

au! User GoyoEnter Limelight
au! User GoyoLeave Limelight!

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
