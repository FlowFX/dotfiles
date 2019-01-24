" by flowfx
"
" Resources:
" * https://github.com/Nervengift/dotfiles/blob/master/.vimrc
" * https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" * http://dougblack.io/words/a-good-vimrc.html
" * http://www.fullstackpython.com/vim.html
" * http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" * http://color.smyck.org/
" * https://github.com/scy/dotfiles/tree/master/.vim
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

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""" PLUGINS
Plugin 'altercation/vim-colors-solarized'
" Session management
Plugin 'tpope/vim-obsession'
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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Konfekt/FastFold'
Plugin 'qpkorr/vim-bufkill'
" Snippets
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
" Linting
Plugin 'w0rp/ale'
" Tab completion
Plugin 'Shougo/deoplete.nvim'
" Ruby
" https://thoughtbot-images.s3.amazonaws.com/upcase/navigating-ruby-files-in-vim-install-instructions.pdf
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" fzf
Plugin 'junegunn/fzf.vim'
" Ack & the silver searcher
Plugin 'mileszs/ack.vim'

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
let maplocalleader = "\\"          " define <localleader> key to backslash
set ruler                          " show current line and column

set list listchars=tab:›·,trail:·,nbsp:·

" Easy escaping
inoremap jj <ESC>

" Format code with F6
map <F6> mzgg=G`z

" tabs are evil
:set tabstop=2 shiftwidth=2 expandtab

" In the viminfo state file, store file marks and unlimited register contents.
" Search, command line and input history size are defined via 'history'.
" Also, put the viminfo file in ~/.vim, not directly in the home directory.
set viminfo='100,h,f1,n~/.vim/viminfo
set history=100

" Don't litter .swp files all over the place, put them in ~/.vim/swp instead,
" but fall back to "same directory" if that's not possible for some reason.
set directory=~/.vim/swp,.

""" SEARCH """
set ignorecase          " ignore case in searches
set smartcase           " respect case if search begins with a capital letter
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> " Vim will keep highlighted matches from searches until you either run a new one or manually stop highlighting the old search with :nohlsearch. I find myself running this all the time so I've mapped it to ,<space>.

set cursorline          " hightlight current line
set showmatch           " show the matching part of the pair for [] {} and ()
set number              " show line numbers
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

" Configure FastFold
" https://github.com/Konfekt/FastFold
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

" Enable folding with the spacebar
nnoremap <space> za

" allow to easily edit crontab with crontab -e
autocmd filetype crontab setlocal nobackup nowritebackup

" Enable matchit
runtime macros/matchit.vim


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

let g:airline_theme='solarized_flood'

" toggle background with F5
call togglebg#map("<F5>")

" Mark end of line
highlight ColorColumn ctermbg=8
autocmd FileType python,ruby let &colorcolumn=&textwidth

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
"
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

""" DEOPLETE """
let g:deoplete#enable_at_startup = 1
" Use tab to complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""" ALE """
" For JavaScript files, use `eslint` and only `eslint`
let g:ale_linters = {
  \ 'CSS': ['prettier'],
  \ 'JSON': ['prettier'],
  \ 'Haml': ['haml-lint'],
  \ 'JavaScript': ['eslint'],
  \ 'Python': ['flake8'],
  \ 'Ruby': ['rubocop', 'rubocop_rails'],
  \ 'YAML': ['prettier'],
  \ }
" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

nnoremap <leader>e :silent !eslint --fix %<CR>    " run eslint on this file
nnoremap <leader>r :silent !rubocop --auto-correct %<CR>    " run rubocop on this file

map <leader>l :ALEToggle<CR>    " toggle ALE with ,l

""" NERDTREE """
" https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9
map <C-n> :NERDTreeToggle<CR>    " toggle Nerdtree with CTRL-n
autocmd bufenter * 
    \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | 
    \ q | endif                  " automaticall close a tab if only NerdTree remains
let NERDTreeAutoDeleteBuffer = 1 " automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""" FZF """
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }

" Better FZF https://statico.github.io/vim3.html
nmap ; :Buffers<CR>
nmap <Leader>t :Tags<CR>
nmap <C-p> :Files<CR>

""" CTags """
set tags=./tags;/                                         " https://stackoverflow.com/a/741486

"" UltiSnips
"let g:UltiSnipsEditSplit=vertical" " Let :UltiSnipsEdit split the window


""" Ack & ag (The Silver Searcher) """
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack1
nnoremap <Leader>a :Ack!<Space>

""" Sources
source ~/.vim/abbreviations.vim
