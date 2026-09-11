" (NEO)VIM SETTINGS
"
set encoding=utf-8
set path+=**
set autochdir
set autoread
set backspace=indent,eol,start
set hidden
set splitright
set splitbelow
set signcolumn=yes
set updatetime=250
set timeoutlen=500
set completeopt=menuone,noinsert,noselect
set title
let mapleader = " "

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
nnoremap <silent> <Leader>L :match none<CR>

" editor settings
if has('mac') || executable('xclip') || executable('xsel') || has('win32')
      set clipboard=unnamedplus
endif
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

" plugins, syntax, and colors
" vim-plug: https://github.com/junegunn/vim-plug
" install or clean plugins with: :PlugInstall and :PlugClean
" ---------------------------------------------------------------------------
" set the plugin path
call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'github/copilot.vim'
Plug 'dense-analysis/ale'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua', { 'tag': 'compat-nvim-0.9' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
call plug#end()

lua << EOF
local ok, nvim_tree = pcall(require, 'nvim-tree')
if ok then
      nvim_tree.setup({
            sort = { sorter = 'case_sensitive' },
            view = { width = 32, side = 'left', preserve_window_proportions = true },
            renderer = { group_empty = true, highlight_git = true },
            filters = { dotfiles = false },
            actions = { open_file = { quit_on_open = false } },
      })
end
EOF

lua << EOF
local telescope_ok, telescope = pcall(require, 'telescope')
if telescope_ok then
      telescope.setup({
            defaults = {
                  layout_strategy = 'horizontal',
                  layout_config = { preview_width = 0.55 },
                  sorting_strategy = 'ascending',
            },
      })
end
EOF

lua << EOF
function _G.open_glow(path)
      local previous_tab = vim.api.nvim_get_current_tabpage()
      vim.cmd('tabnew')
      local glow_tab = vim.api.nvim_get_current_tabpage()
      vim.fn.termopen({ 'glow', '-p', path }, {
            on_exit = function()
                  vim.schedule(function()
                        if vim.api.nvim_tabpage_is_valid(glow_tab) then
                              vim.api.nvim_set_current_tabpage(glow_tab)
                              vim.cmd('tabclose!')
                        end
                        if vim.api.nvim_tabpage_is_valid(previous_tab) then
                              vim.api.nvim_set_current_tabpage(previous_tab)
                        end
                  end)
            end,
      })
      vim.cmd('startinsert')
end
EOF

nnoremap <silent> <leader>e :NvimTreeToggle<CR>
nnoremap <silent> <leader>f :NvimTreeFindFile<CR>

nnoremap <silent> <leader>ff :Telescope find_files<CR>
nnoremap <silent> <leader>fb :Telescope buffers<CR>
nnoremap <silent> <leader>fg :Telescope live_grep<CR>
nnoremap <silent> <leader>an :ALENext<CR>
nnoremap <silent> <leader>ap :ALEPrevious<CR>
nnoremap <silent> <leader>ad :ALEDetail<CR>
nnoremap <silent> <leader>af :ALEFix<CR>
command! -bar Glow if executable('glow') | call v:lua.open_glow(expand('%:p')) | else | echoerr 'Glow is not installed; check that it is on PATH.' | endif
command! Keybindings execute 'edit ' . fnameescape(expand('~/.config/nvim/keybindings.md'))
nnoremap <silent> <leader>? :Keybindings<CR>
nnoremap <silent> <leader>mv :Glow<CR>

let g:ale_completion_enabled = 0
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'
let g:ale_virtualtext_cursor = 1
let g:ale_linters = {
      \ 'python': ['ruff'],
      \ 'javascript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'typescriptreact': ['eslint'],
      \ 'html': ['htmlhint'],
      \ 'css': ['stylelint'],
      \ 'sh': ['shellcheck'],
      \ 'yaml': ['yamllint'],
      \ }
let g:ale_fixers = {
      \ 'python': ['ruff_format'],
      \ 'javascript': ['prettier'],
      \ 'javascriptreact': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier'],
      \ 'html': ['prettier'],
      \ 'css': ['prettier'],
      \ 'json': ['prettier'],
      \ 'yaml': ['prettier'],
      \ }

let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-]> copilot#Dismiss()
imap <silent><script><expr> <M-]> copilot#Next()
imap <silent><script><expr> <M-[> copilot#Previous()

augroup nvim_tree_startup
      autocmd!
      autocmd VimEnter * if argc() == 0 | NvimTreeOpen | wincmd p | endif
augroup END

syntax enable
set termguicolors
let g:gruvbox_italic = 0
let g:gruvbox_contrast_dark = 'medium'
set background=dark
silent! colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
" change background of cursorline
hi CursorLine guibg=#212121

" activate the bottom lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'background': 'dark'
      \ }


