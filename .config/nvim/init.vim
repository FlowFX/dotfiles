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

" Async linting engine
Plug 'w0rp/ale'

" Async FuzzyFind
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" vim.signify
Plug 'mhinz/vim-signify'

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

set ruler                   " show current line and column
set relativenumber

"  _                _
" | |    ___   ___ | | __
" | |   / _ \ / _ \| |/ /
" | |__| (_) | (_) |   <
" |_____\___/ \___/|_|\_\
"
" Colorscheme
if has('nvim')
  colorscheme smyck " doesn't work under vim for whatever reason
endif

" Statusbar
set laststatus=2 " enable statusbar all the time

" Mark end of line
" https://github.com/vim/vim/blob/135059724f140ceac889c9f8136bd1bf5c41d49d/runtime/doc/options.txt#L1715-L1716
set colorcolumn=+1
highlight ColorColumn ctermbg=0

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

""" ALE
" fix files on save
let g:ale_fix_on_save = 1

" use emojis for errors and warnings
let g:ale_sign_error = '✗\ '
let g:ale_sign_warning = '⚠\ '

" fixer configurations (doubles as linter configuration)
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'ruby': ['rubocop'],
\   'typescript': ['prettier'],
\}

""" FZF
" Better FZF https://statico.github.io/vim3.html
nmap <C-p> :Files<CR>
nmap ; :Buffers<CR>

" make FZF respect gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif


""" VIM-Signify
" https://github.com/mhinz/vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
set signcolumn=yes
