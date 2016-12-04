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
" Plugin 'pbrisbin/vim-syntax-shakespeare'

" purescript syntax hilighting
Plugin 'raichoo/purescript-vim'

" tmux compatible stuff
Plugin 'tmux-plugins/vim-tmux-focus-events'

" 'user/repository' format
Plugin 'VundleVim/Vundle.vim'

"vimproc
Plugin 'Shougo/vimproc.vim'

"ghcmod-wim
Plugin 'eagletmt/ghcmod-vim'

"nerd commenting plugin
Plugin 'scrooloose/nerdcommenter'

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

if has('nvim')
  " autocomplete
  Plugin 'Shougo/deoplete.nvim' 
  Plugin 'zchee/deoplete-jedi'
else
  " autocomplete if not nvim 
  Plugin 'Shougo/neocomplete.vim'
endif

" haskell autocomplete
Plugin 'eagletmt/neco-ghc'

" rainbow parens
Plugin 'luochen1990/rainbow'

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" lambda replacement
Plugin 'calebsmith/vim-lambdify'

" solarized colorscheme
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'Taverius/vim-colorscheme-manager'
"Plugin 'xolox/vim-misc' 
"Plugin 'xolox/vim-colorscheme-switcher' 
Plugin 'sickill/vim-monokai'

" autoformatting
Plugin 'Chiel92/vim-autoformat'

" ctrl p
Plugin 'ctrlpvim/ctrlp.vim'

" coffeescript plugin
Plugin 'kchmck/vim-coffee-script'

" tmux conf file highlighting
Plugin 'tmux-plugins/vim-tmux'

" tagbar plugin
Plugin 'majutsushi/tagbar'

call vundle#end()
" Now we can turn our filetype functionality back on
filetype plugin indent on

" disable haskell in syntastic
let g:syntastic_mode_map = { 'passive_filetypes': ['haskell'] }

" set theme
" set background=dark
colorscheme monokai 

" activate rainbow parens
let g:rainbow_active = 1 

" Nerdtree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" tagbar shortcut
nmap <F8> :TagbarToggle<CR>

" syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if has("nvim")
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#eneable_smart_case = 1
else
  " neocomplete
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
endif
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
let g:airline_theme='solarized'

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

let g:nerdtree_tabs_open_on_console_startup=1

let g:ctrlp_working_path_mode = 'a'

" have vim tabs only display file names
let g:airline#extensions#tabline#fnamemod = ':t'

"promptline settings

" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
        \'a' : [ promptline#slices#python_virtualenv(), promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch(), '$(git rev-parse --short HEAD 2>/dev/null)', promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

" available slices:
"
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host() - current hostname.  To hide the hostname unless connected via SSH, use promptline#slices#host({ 'only_if_ssh': 1 })
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
"
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" to disable powerline symbols
" `let g:promptline_powerline_symbols = 0`<Paste>

"coffeescript plugin settings
filetype plugin indent on

" press shift enter to insert a newline before cursor in normal mode
nmap <S-Enter> O<Esc>

set tags=./tags,tags
set exrc
set secure

let g:python2_host_prog = '/Users/brian/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/brian/.pyenv/versions/neovim3/bin/python'



