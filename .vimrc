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
Plug 'https://github.com/tpope/vim-abolish.git'
Plug 'bigfish/vim-nodelint'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
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

" search settings
set ignorecase
set smartcase
set incsearch

" autocompletion settings
set infercase

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

" Set tabstop, softtabstop and shiftwidth to the same value w/ :Stab
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" default tab spacing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

set foldcolumn=4
set hls
set history=200

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

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

nnoremap & :&&<CR>
xnoremap & :&&<CR>

:nnoremap <f5> :!ctags -R<CR>

set termguicolors " enable 24bit colors
set dictionary+=/usr/share/dict/words
