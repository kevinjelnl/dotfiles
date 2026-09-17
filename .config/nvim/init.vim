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
set scrolloff=6
set sidescrolloff=8
if exists('+inccommand')
      set inccommand=nosplit
endif
set undofile
if has('nvim')
      let &undodir = stdpath('state') . '/undo'
      call mkdir(&undodir, 'p')
endif
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
set laststatus=3 statusline=%F

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
" Escape clears the current search highlight without deleting search history.
nnoremap <silent> <Esc> :nohlsearch<CR>
inoremap <silent> <Esc> <Esc>:nohlsearch<CR>
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
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

lua << EOF
local ok, nvim_tree = pcall(require, 'nvim-tree')
if ok then
      local function nvim_tree_on_attach(bufnr)
            local api = require('nvim-tree.api')
            api.map.on_attach.default(bufnr)
            local opts = {
                  buffer = bufnr,
                  noremap = true,
                  silent = true,
                  nowait = true,
            }
            vim.keymap.set('n', '<S-CR>', api.node.open.vertical, vim.tbl_extend('force', opts, {
                  desc = 'nvim-tree: open in vertical split',
            }))
            vim.keymap.set('n', 'v', api.node.open.vertical, vim.tbl_extend('force', opts, {
                  desc = 'nvim-tree: open in vertical split',
            }))
            vim.keymap.set('n', 's', api.node.open.horizontal, vim.tbl_extend('force', opts, {
                  desc = 'nvim-tree: open in horizontal split',
            }))
            vim.keymap.set('n', '<C-w>v', api.node.open.vertical, vim.tbl_extend('force', opts, {
                  desc = 'nvim-tree: open in vertical split',
            }))
            vim.keymap.set('n', '<C-w>s', api.node.open.horizontal, vim.tbl_extend('force', opts, {
                  desc = 'nvim-tree: open in horizontal split',
            }))
      end

      nvim_tree.setup({
            on_attach = nvim_tree_on_attach,
            sort = { sorter = 'case_sensitive' },
            view = {
                  width = 32,
                  side = 'left',
                  preserve_window_proportions = true,
            },
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
local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
if gitsigns_ok then
      gitsigns.setup({
            signs = {
                  add = { text = '▎' },
                  change = { text = '▎' },
                  delete = { text = '▁' },
                  topdelete = { text = '▔' },
                  changedelete = { text = '▎' },
            },
            on_attach = function(bufnr)
                  local function opts(desc)
                        return { buffer = bufnr, desc = 'gitsigns: ' .. desc, noremap = true, silent = true }
                  end
                  vim.keymap.set('n', ']h', gitsigns.next_hunk, opts('next hunk'))
                  vim.keymap.set('n', '[h', gitsigns.prev_hunk, opts('previous hunk'))
                  vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, opts('preview hunk'))
                  vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, opts('stage hunk'))
                  vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, opts('reset hunk'))
            end,
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
" Quick file-tree controls without the leader key.
nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> <F2> :NvimTreeToggle<CR>
nnoremap <silent> <C-f> :NvimTreeFindFile<CR>
nnoremap <silent> <F3> :NvimTreeFindFile<CR>

" Move between editor panes without reaching for the mouse.
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Open a compact terminal below the current editor.
nnoremap <silent> <C-\\> :botright split<CR>:resize 12<CR>:terminal<CR>
tnoremap <silent> <Esc><Esc> <C-\\><C-n>

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

" Treat :q in the file tree as quitting Neovim, not closing only the tree.
augroup nvim_tree_quit
      autocmd!
      autocmd FileType NvimTree cnoreabbrev <expr> <buffer> q getcmdtype() ==# ':' && getcmdline() ==# 'q' ? 'qa' : 'q'
      autocmd FileType NvimTree nnoremap <silent> <buffer> q :qa<CR>
augroup END

syntax enable
set termguicolors
let g:gruvbox_italic = 0
let g:gruvbox_contrast_dark = 'medium'
set background=dark
silent! colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
" Kevinjel/tmux-inspired orange UI accents.
hi Normal guifg=#ebdbb2 guibg=NONE
hi CursorLine guibg=#212121
hi CursorLineNr guifg=#d79921 gui=bold
hi LineNr guifg=#665c54
hi WinSeparator guifg=#d65d0e guibg=NONE ctermfg=166 ctermbg=NONE
hi VertSplit guifg=#d65d0e guibg=NONE ctermfg=166 ctermbg=NONE
hi StatusLine guifg=#1d2021 guibg=#d65d0e gui=bold
hi StatusLineNC guifg=#d65d0e guibg=#3c3836
hi Search guifg=#1d2021 guibg=#d79921 gui=bold
hi IncSearch guifg=#1d2021 guibg=#fe8019 gui=bold
hi Visual guibg=#504945
hi Directory guifg=#83a598 gui=bold
hi Pmenu guifg=#ebdbb2 guibg=#3c3836
hi PmenuSel guifg=#1d2021 guibg=#d79921 gui=bold
set fillchars+=vert:│,horiz:─,horizup:─,horizdown:─,vertleft:│,vertright:│,verthoriz:┼

" activate the bottom lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'background': 'dark'
      \ }


