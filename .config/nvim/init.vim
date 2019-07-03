" .config/nvim/init.vim by FlowFX
"
"
"
"  ____  _             _           
" |  _ \| |_   _  __ _(_)_ __  ___ 
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/             
" Plugins using vim-plug
" https://github.com/junegunn/vim-plug

" Automatic installation of vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle')

" sensible.vim
Plug 'tpope/vim-sensible'

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" .editorconfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

"   ____                           _ 
"  / ___| ___ _ __   ___ _ __ __ _| |
" | |  _ / _ \ '_ \ / _ \ '__/ _` | |
" | |_| |  __/ | | |  __/ | | (_| | |
"  \____|\___|_| |_|\___|_|  \__,_|_|
" 
" General options               

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Easy escaping
inoremap jj <ESC>

" Source: lucasfcosta/dotfiles/blob/master/.config/nvim/init.vim
set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary
set cursorline              " Find the current line quickly.


"  ____  _             _                          __ _       
" |  _ \| |_   _  __ _(_)_ __     ___ ___  _ __  / _(_) __ _ 
" | |_) | | | | |/ _` | | '_ \   / __/ _ \| '_ \| |_| |/ _` |
" |  __/| | |_| | (_| | | | | | | (_| (_) | | | |  _| | (_| |
" |_|   |_|\__,_|\__, |_|_| |_|  \___\___/|_| |_|_| |_|\__, |
"                |___/                                 |___/ 
" Plugin-specific configuration options

""" TMUX NAVIGATOR
" https://github.com/christoomey/vim-tmux-navigator#custom-key-bindings
" tmux pane-aware custom key bindings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-;> :TmuxNavigatePrevious<cr>

""" NERDTREE
" Toggle NERDTree with Ctrl-n
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
