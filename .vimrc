" https://shapeshed.com/vim-packages/#removing-a-package
set encoding=utf8
colorscheme codedark

syntax on

set cursorline " highlight the cursorline
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" editor settings
set number " use numbers
set relativenumber " make them relative
let g:indentLine_conceallevel = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

set cmdheight=2
set incsearch  " search like modern browser
set showmatch  " show matching brackets

set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)
set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4
set ai "Auto indent
set si "Smart indent

" remap paste in visual
vnoremap <leader>p "_dP

set wrap "Wrap lines
set lbr " linebreak
set tw=500 " on 500 chars
set mouse=a "enable mouse mode (:

set rtp+=/usr/local/opt/fzf "use FZF in vim

" use :find <something> to find items
filetype plugin on
set path+=**
set wildmenu

" ++ plugins ++
" set the plugin path
set packpath+=~/.vim/pack/


" NERDTree settings 
" map ctrl + n to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" close NERDTree if it is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" prettify the menu
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" set the nerdtree hsplit to darkgrey for a clean divider
highlight VertSplit ctermbg=DarkGrey

" gitGutter
" clear the color settings and use the provided ones
let g:gitgutter_override_sign_column_highlight = 0
" colors settings
highlight SignColumn guibg=DarkGreen
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

let g:airline_theme="distinguished" " airline colorscheme
let g:airline_powerline_fonts = 1
let g:indentLine_setColors = 0 " dont use stock indentlines colors
