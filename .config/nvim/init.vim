" (NEO)VIM SETTINGS
"
set encoding=utf-8
set path+=**
set autochdir
set autoread
set backspace=indent,eol,start

" VISUALS
set cursorline " highlight the cursorline
set visualbell
set number " use numbers
set relativenumber " make them relative
let g:indentLine_conceallevel = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
set showmode 
set showcmd
set autoindent
set laststatus=2 statusline=%F

" FOLDING
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1

" filecreation
set nobackup
set noswapfile

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" editor settings
set clipboard=unnamedplus
set cmdheight=2
set incsearch  " search like modern browser
set showmatch  " show matching brackets
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)
set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4

" remap paste in visual
vnoremap <leader>p "_dP

set wrap " Wrap lines
set lbr " linebreak
set tw=500 " on 500 chars
set mouse=a "enable mouse mode (:

set rtp+=/usr/local/opt/fzf "use FZF in vim

" plugins, syntax, and colors
" vim-plug: https://github.com/junegunn/vim-plug
" install or clean plugins with: :PlugInstall and :PlugClean
" ---------------------------------------------------------------------------
" set the plugin path
"
" install vim-plug: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end()

syntax enable
set termguicolors
let g:dracula_italic = 0
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
" change background of cursorline
hi CursorLine guibg=#212121

" activate the bottom lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'background': 'dark'
      \ }


