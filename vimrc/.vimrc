"vundle
set shell=/bin/bash
set encoding=utf-8
set nocompatible
set backspace=indent,eol,start
let g:airline_powerline_fonts = 1
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the

" yesod template highlighting (shakespear)
Plugin 'pbrisbin/vim-syntax-shakespeare'

" 'user/repository' format
Plugin 'VundleVim/Vundle.vim'

"vimproc
Plugin 'Shougo/vimproc.vim'

"ghcmod-wim
Plugin 'eagletmt/ghcmod-vim'

"Rust
Plugin 'rust-lang/rust.vim'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" elm plugin
Plugin 'elmcast/elm-vim'

"status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" syntax checking
Plugin 'scrooloose/syntastic'

" git diffing
Plugin 'airblade/vim-gitgutter'

" git fugitive
Plugin 'tpope/vim-fugitive'

" replicate status line in prompt
Plugin 'edkolev/promptline.vim'

" replicate status line in tmux
Plugin 'edkolev/tmuxline.vim'

" autocomplete
Plugin 'Shougo/neocomplete.vim'

" haskell autocomplete
Plugin 'eagletmt/neco-ghc'

" rainbow parens
Plugin 'luochen1990/rainbow'

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" lambda replacement
Plugin 'calebsmith/vim-lambdify'

" solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" autoformatting
Plugin 'Chiel92/vim-autoformat'

" ctrl p
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
" Now we can turn our filetype functionality back on
filetype plugin indent on

" disable haskell in syntastic
let g:syntastic_mode_map = { 'passive_filetypes': ['haskell'] }

" set theme
set background=dark
colorscheme solarized

" activate rainbow parens
let g:rainbow_active = 1 

" Nerdtree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


" syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" vim utf8
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.


set autoread
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set lazyredraw
syntax enable
set number
set showcmd
set cursorline
set wildmenu
set mouse=a
set foldenable

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set modifiable

set ai
set si
set wrap

set laststatus=2

" under tmux, copy and paste
set clipboard=unnamed

"Open NERDTree if no files specified
autocmd BufEnter * lcd %:p:h
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"set airline theme on tabline
let g:airline#extensions#tabline#enabled = 1

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

let g:nerdtree_tabs_open_on_console_startup=1

let g:ctrlp_working_path_mode = 'ra'
