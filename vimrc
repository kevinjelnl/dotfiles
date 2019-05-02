" => set packpath
set packpath+=~/.vim/pack/

" set the colors
syntax on
set guifont=*

set background=dark " for the dark version
" set background=light " for the light version
colorscheme one
let g:airline_theme='one'



" => NERDtree settings
" open on startup
autocmd vimenter * NERDTree
" use ctrl+n to toggle the treeview 
map <C-n> :NERDTreeToggle<CR>
" prettify
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" => vim UI 
set number
set relativenumber
set ruler
set cmdheight=2
" search like modern browser
set incsearch 
" show matching brackets
set showmatch 


" => Text, tab and indent related

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set mouse=a

set background=dark

