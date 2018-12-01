" vim-plug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug section
call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/powerline/powerline.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/easymotion/vim-easymotion.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/nelstrom/vim-visual-star-search.git'
call plug#end()

" run powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set number
syntax enable 
set background=dark
colorscheme cobalt2
set nocompatible
filetype plugin on
set path+=**
set wildmenu
filetype plugin indent on
set hidden

" case sensitivity
set ignorecase
set smartcase

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

set softtabstop=3
set shiftwidth=3
set noexpandtab

set foldcolumn=4
set hls
set history=200

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

let mapleader=','
noremap \ ,
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

noremap <Up> ddkP
noremap <Down> ddp
noremap <Left> <Nop>
noremap <Right> <Nop>

