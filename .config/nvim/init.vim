" .config/nvim/init.vim by FlowFX
"
" TODO:
" - [ ] YouCompleteMe or Deoplete or anything for tab completion
" - [x] ctags support
" - [ ] ag/ack/grep hotkeys
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
Plug 'tmux-plugins/vim-tmux-focus-events'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" .editorconfig
Plug 'editorconfig/editorconfig-vim'

" Async linting engine
Plug 'w0rp/ale'

" Async FuzzyFind
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Ack & the silver searcher
Plug 'mileszs/ack.vim'

" Automatic generation of ctags
Plug 'ludovicchabant/vim-gutentags'

" vim-signify
Plug 'mhinz/vim-signify'

" code comments
Plug 'tpope/vim-commentary'

" tpope awesomeness
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" custom text objects
Plug 'kana/vim-textobj-user'

" Ruby
Plug 'tpope/vim-endwise',              { 'for': ['ruby', 'eruby', 'haml'] }
Plug 'tpope/vim-rails',                { 'for': ['ruby', 'eruby', 'haml'] }
Plug 'vim-ruby/vim-ruby',              { 'for': ['ruby', 'eruby', 'haml'] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'eruby', 'haml'] }

" vim-test and tslime
Plug 'jgdavey/tslime.vim'
Plug 'janko/vim-test'

call plug#end()

"   ____                           _
"  / ___| ___ _ __   ___ _ __ __ _| |
" | |  _ / _ \ '_ \ / _ \ '__/ _` | |
" | |_| |  __/ | | |  __/ | | (_| | |
"  \____|\___|_| |_|\___|_|  \__,_|_|
"
" General options

" Sensible search
set ignorecase          " ignore case in searches
set smartcase           " respect case if search begins with a capital letter
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" define <leader> key to <space>
nnoremap <SPACE> <Nop>
let mapleader=" "

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Easy escaping
inoremap jj <ESC>

" Source: lucasfcosta/dotfiles/blob/master/.config/nvim/init.vim
set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary
set cursorline              " Find the current line quickly.

set ruler                   " show current line and column
set number                  " show current line number within relative number
set relativenumber
map <C-y> +y
nnoremap <C-p> +P
vnoremap <C-p> +P
" dont use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just dont
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" copy and paste to/from vIM and the clipboard
nnoremap <C-y> +y
vnoremap <C-y> +y
nnoremap <C-p> +P
vnoremap <C-p> +P

" access system clipboard
set clipboard=unnamed

" swapfiles location
set backupdir=/tmp//
set directory=/tmp//

" tabs are evil
set expandtab
set shiftwidth=2
set tabstop=2

" Be smart when using tabs ;)
" :help smarttab
set smarttab

" Copy the indentation from the previous line when starting a new line
set autoindent

" Smart indent
" Automatically inserts one extra level of indentation in some cases, and works for C-like files
set smartindent

" Omnicomplete lookup locations
" .,w,b,u,t,i are defaults
" i is removed by vim-sensible
" kspell searches the dictionary, but only if spell checking is enabled
set complete+=kspell

" In the viminfo state file, store file marks and unlimited register contents.
" Search, command line and input history size are defined via 'history'. Also,
" put the viminfo file in ~/.config/nvim/, not directly in the home directory.
set viminfo='100,h,f1,n~/.config/nvim/viminfo
set history=100

" eliminate delay on ESC to enter normal mode
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" Spell check and line wrap just for git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

""" Sources
source ~/.config/nvim/abbreviations.vim

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

" toggle invisible characters
set invlist
set list
set listchars=tab:›·,trail:·,nbsp:·

"   ____                      _      _   _
"  / ___|___  _ __ ___  _ __ | | ___| |_(_) ___  _ __
" | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \
" | |__| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
"  \____\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
"                      |_|
" Completion popup configuration



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
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠ '

" fixer configurations (doubles as linter configuration)
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

""" FZF
" Better FZF https://statico.github.io/vim3.html
nmap <C-p> :Files<CR>
nmap ; :Buffers<CR>

" make FZF respect gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

""" Ack & ag (The Silver Searcher) """
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack1
nnoremap <Leader>a :Ack!<Space>

""" VIM-Signify
" https://github.com/mhinz/vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
set signcolumn=yes

" Remove irritating background colors
hi DiffAdd    ctermbg=none ctermfg=2
hi DiffDelete ctermbg=none ctermfg=1
hi DiffChange ctermbg=none ctermfg=4

""" VIM-TEST
" https://github.com/janko/vim-test
" make test commands execute using tslime.vim
let test#strategy = "tslime"
let test#ruby#use_spring_binstub = 1
let test#python#runner = "pytest"

" In Alternate File, :TestNearest executes :TestLast
nmap <CR>         :TestNearest<CR>
nmap <leader><CR> :TestFile<CR>
nmap <leader>l    :TestLast<CR>
