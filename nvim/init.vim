set nu rnu
colorscheme murphy
noremap k gj
noremap j gk
noremap <Down> gj
noremap <Up> gk
noremap <C-w> <Cmd>BufferClose!<CR>
noremap <C-t> <Cmd>BufferNext<CR>
noremap <C-p> <Cmd>BufferPrevious<CR>
noremap <C-o> <Cmd>NvimTreeOpen<CR>
noremap <C-c> <Cmd>NvimTreeClose<CR>
set clipboard=unnamed

set textwidth=0
set wrapmargin=0
set wrap
set linebreak

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-tree.lua' 
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Load some Lua specific custom stuff
lua require("init")
