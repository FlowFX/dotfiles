" by flowfx
"
" Resources:
" * https://github.com/Nervengift/dotfiles/blob/master/.vimrc
" * https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" * http://dougblack.io/words/a-good-vimrc.html
" * http://www.fullstackpython.com/vim.html
" * http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" * http://color.smyck.org/
"
" Special thanks to Nervengift for the ASCII art!



"  ____  _             _           
" |  _ \| |_   _  __ _(_)_ __  ___ 
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/             
" Plugins using Vundle
" https://github.com/VundleVim/Vundle.vim
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""" PLUGINS
Plugin 'altercation/vim-colors-solarized'
" Tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" IDE
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'neomake/neomake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-endwise'
Plugin 'tmhedberg/SimpylFold'
" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" fzf
Plugin 'junegunn/fzf.vim'

" All Plugins must be added before the following line
call vundle#end()				" required
filetype plugin indent on		" required

"   ____                           _ 
"  / ___| ___ _ __   ___ _ __ __ _| |
" | |  _ / _ \ '_ \ / _ \ '__/ _` | |
" | |_| |  __/ | | |  __/ | | (_| | |
"  \____|\___|_| |_|\___|_|  \__,_|_|
" 
" General options               

set encoding=utf-8
let mapleader=","                  " define <leader> key to comma
set ruler                          " show current line and column

set list listchars=tab:›·,trail:·,nbsp:·

" Easy escaping
inoremap jj <ESC>

" Format code with F6
map <F6> mzgg=G`z

"set clipboard=unnamed              " access OS X system clipboard

""" SEARCH """
set ignorecase          " ignore case in searches
set smartcase           " respect case if search begins with a capital letter
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> " Vim will keep highlighted matches from searches until you either run a new one or manually stop highlighting the old search with :nohlsearch. I find myself running this all the time so I've mapped it to ,<space>.

set guifont=Inconsolata:h15			" set font in MacVim
set cursorline             " hightlight current line
set showmatch              " show the matching part of the pair for [] {} and ()
set number                 " show line numbers
set scrolloff=5         " don't scroll all the way to the bottom
set ttyfast

""" SPLIT LAYOUTS """
" specify different areas of the screen where the splits should occur 
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" CODE FOLDING """
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" See the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" make code look pretty
let python_highlight_all=1

" toggle background with F5
call togglebg#map("<F5>")

" allow to easily edit crontab with crontab -e
autocmd filetype crontab setlocal nobackup nowritebackup

""" TMUX """
" cf. https://github.com/christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-;> :TmuxNavigatePrevious<cr>

" eliminate delay on ESC to enter normal mode
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" automatically reload file when changed outside of vim
set autoread

""" NEOMAKE """
call neomake#configure#automake('nw', 1000)
let g:neomake_ruby_enabled_makers = ['rubocop', 'rubocop_rails']

"  _                _
" | |    ___   ___ | | __
" | |   / _ \ / _ \| |/ /
" | |__| (_) | (_) |   <
" |_____\___/ \___/|_|\_\
" 
" Colorscheme
syntax on
if has('nvim')
    colorscheme smyck " doesn't work under vim for whatever reason
else
    colorscheme solarized
endif

let g:airline_theme='seagull'




"   ____                      _      _   _
"  / ___|___  _ __ ___  _ __ | | ___| |_(_) ___  _ __
" | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \
" | |__| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
"  \____\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
"                      |_|
" Completion popup configuration

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone
" Allow smarter completion by infering the case
set infercase


"  ____  _             _                          __ _       
" |  _ \| |_   _  __ _(_)_ __     ___ ___  _ __  / _(_) __ _ 
" | |_) | | | | |/ _` | | '_ \   / __/ _ \| '_ \| |_| |/ _` |
" |  __/| | |_| | (_| | | | | | | (_| (_) | | | |  _| | (_| |
" |_|   |_|\__,_|\__, |_|_| |_|  \___\___/|_| |_|_| |_|\__, |
"                |___/                                 |___/ 
" Plugin-specific configuration options

" NerdTree
" https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9
map <C-n> :NERDTreeToggle<CR>    " toggle Nerdtree with CTRL-n
autocmd bufenter * 
    \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | 
    \ q | endif                  " automaticall close a tab if only NerdTree remains
let NERDTreeAutoDeleteBuffer = 1 " automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" FZF
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }
nnoremap <leader>f :FZF<CR>
