set nu rnu
colorscheme murphy
noremap k gj
noremap j gk
noremap <Down> gj
noremap <Up> gk

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

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
