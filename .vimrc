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
" * https://thoughtbot-images.s3.amazonaws.com/upcase/navigating-ruby-files-in-vim-install-instructions.pdf
"
" Special thanks to Nervengift for the ASCII art!



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

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/goyo.vim'
Plug 'blueyed/vim-diminactive'
" Session management
Plug 'tpope/vim-obsession', { 'on': 'Obsession' }
" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
" NerdTree
Plug 'scrooloose/nerdtree',         { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'jgdavey/tslime.vim'
Plug 'janko/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Linting
Plug 'w0rp/ale'
" Tab completion / Language Server
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"Plug 'takkii/Bignyanco'
" Ruby
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'
" fzf
Plug 'junegunn/fzf.vim'
" Ack & the silver searcher
Plug 'mileszs/ack.vim'
" LaTeX
Plug 'vim-latex/vim-latex', { 'for': ['latex', 'tex'] }

call plug#end()

"   ____                           _ 
"  / ___| ___ _ __   ___ _ __ __ _| |
" | |  _ / _ \ '_ \ / _ \ '__/ _` | |
" | |_| |  __/ | | |  __/ | | (_| | |
"  \____|\___|_| |_|\___|_|  \__,_|_|
" 
" General options               

set nocompatible
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
set relativenumber      " show line distances
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

" allow to easily edit crontab with crontab -e
autocmd filetype crontab setlocal nobackup nowritebackup

" Enable matchit
runtime macros/matchit.vim

" Quickly close quickfix window
nmap <C-x> :cclose<CR>


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

" Statusbar
set laststatus=2 " enable statusbar all the time

" Returns current Git branch
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%{StatuslineGit()} " current Git branch
set statusline+=\ %f               " current path
set statusline+=\ %m               " modified flag
set statusline+=%=
set statusline+=\%p%%              " percentage inside file
set statusline+=\ \ \ 
set statusline+=\ %3c\             " current column

" toggle background with F5
call togglebg#map("<F5>")

" Mark end of line
" https://github.com/vim/vim/blob/135059724f140ceac889c9f8136bd1bf5c41d49d/runtime/doc/options.txt#L1715-L1716
set colorcolumn=+1
highlight ColorColumn ctermbg=0

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

""" LanguageClient-neovim
" required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


""" ALE """
" For JavaScript files, use `eslint` and only `eslint`
let g:ale_linters = {
  \ 'CSS': ['prettier'],
  \ 'JSON': ['prettier'],
  \ 'Haml': ['haml-lint'],
  \ 'JavaScript': ['eslint'],
  \ 'Python': ['flake8', 'pylint'],
  \ 'Ruby': ['rubocop', 'rubocop_rails'],
  \ 'YAML': ['prettier'],
  \ }
let g:ale_fixers = {
  \ 'Python': ['autopep8'],
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

" Ignore temp files
:let g:NERDTreeIgnore=['__pycache__',]

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
set tags=./tags;/        " https://stackoverflow.com/a/741486

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

"" VIM-RUBY
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

""" VIM-RAILS
" https://github.com/tpope/vim-rails/
" Teach vim-rails about the new convention of request specs.
let g:rails_projections = {
      \ "app/controllers/*_controller.rb": {
      \   "test": [
      \     "spec/controllers/{}_controller_spec.rb",
      \     "spec/requests/{}_spec.rb"
      \   ],
      \ },
      \ "spec/requests/*_spec.rb": {
      \   "alternate": [
      \     "app/controllers/{}_controller.rb",
      \   ],
      \ }}

""" VIM-TEST
" https://github.com/janko/vim-test
" make test commands execute using tslime.vim
let test#strategy = "tslime"
let test#ruby#use_spring_binstub = 1
let test#python#runner = "pytest"

" In Alternate File, :TestNearest executes :TestLast
nmap <CR> :TestNearest<CR>
nmap <leader><CR> :TestFile<CR>
nmap <localleader>l :TestLast<CR>

""" VIM-Signify
" https://github.com/mhinz/vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
set signcolumn=yes

" Remove irritating background colors
hi DiffAdd    ctermbg=none ctermfg=2
hi DiffDelete ctermbg=none ctermfg=1
hi DiffChange ctermbg=none ctermfg=4

""" Vim Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=0

""" VIM-DimInactive
" https://github.com/blueyed/vim-diminactive
let g:diminactive_use_colorcolumn = 0   " changes background color
let g:diminactive_use_syntax = 1        " disables syntax highlighting
