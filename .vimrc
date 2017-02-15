" My personal vim configuration files. Again.
"
" Resources:
" * https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" * http://dougblack.io/words/a-good-vimrc.html
" * http://www.fullstackpython.com/vim.html
" * http://stevelosh.com/blog/2010/09/coming-home-to-vim/


set nocompatible				" required
filetype off					" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all plugins here
Plugin 'tmhedberg/SimpylFold'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'wchargin/vim-latexsuite'
Plugin 'freitass/todo.txt-vim'
"Plugin 'vim-scripts/todo-txt.vim'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'			" won't compile for me right now
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'jnurmine/Zenburn'
"Plugin 'scrooloose/nerdtree'				" proper file tree
"Plugin 'jistr/vim-nerdtree-tabs'			" nerdtree and tabs
"Plugin 'kien/ctrlp.vim'						" super searching
"Plugin 'tpope/vim-fugitive'					" Git integration
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}		" status bar
"Plugin 'christoomey/vim-tmux-navigator'


" All Plugins must be added before the following line
call vundle#end()				" required
filetype plugin indent on		" required


""" General settings """
set encoding=utf-8
let mapleader=","                  " define <leader> key to comma

set tabstop=4
set softtabstop=4
set shiftwidth=4                   " when using the >> or << commands, shift lines by 4 spaces
set list listchars=tab:›·,trail:·,nbsp:·

" Easy escaping
inoremap jj <ESC>

"set clipboard=unnamed              " access OS X system clipboard

""" SEARCH
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
syntax on

""" select colorscheme
if has('gui_running')
	set background=light
	colorscheme solarized
else
	"color koehler
	"colorscheme Zenburn
endif

" toggle background with F5
call togglebg#map("<F5>")

""" NERDTree
"let NERDTreeIgnore=['\.pyc$', '\~$']		" ignore files in NERDTree
"map <leader>n :NERDTreeToggle<CR>   " open and close NERDtree with Ctrl-N


autocmd FileType python set
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=119
	\ expandtab
	\ autoindent
	\ fileformat=unix

autocmd FileType html,scss,sass,css,js,php,yml set
	\ tabstop=2
	\ softtabstop=2
	\ shiftwidth=2
	\ expandtab

" allow to easily edit crontab with crontab -e
autocmd filetype crontab setlocal nobackup nowritebackup


" tmux related configuration
" cf. https://github.com/christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-;> :TmuxNavigatePrevious<cr>
