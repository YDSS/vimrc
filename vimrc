set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

"Plugin syntastic
Plugin 'scrooloose/syntastic'
" Plugin surround
Plugin 'tpope/vim-surround'
" Plugin nerdtree
Plugin 'scrooloose/nerdtree'
" Plugin vim-javascript
Plugin 'pangloss/vim-javascript'
" Emmet
Plugin 'mattn/emmet-vim'
" css
Plugin 'hail2u/vim-css3-syntax'
" less highlight
Plugin 'groenewege/vim-less'
" youcompleteme
Plugin 'Valloric/YouCompleteMe'
" tern, a javascript support snippet with YouCompleteMe
Plugin 'marijnh/tern_for_vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" ack, plugin for grep
Plugin 'mileszs/ack.vim'
" vim-airline, a plugin for status bar
Plugin 'bling/vim-airline'
" markdown plugin
Plugin 'tpope/vim-markdown'
" colorscheme
Plugin 'flazz/vim-colorschemes'
" React JSX highlight
Plugin 'mxw/vim-jsx'
" css3 highlight
Plugin 'JulesWang/css.vim' 
" scss highlight
Plugin 'cakebaker/scss-syntax.vim'
" jade
Plugin 'digitaltoad/vim-jade'
" PHP syntex highlight
Plugin 'StanAngeloff/php.vim'
" CtrlP
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" set background=light
set background=dark
" colorscheme onedark 
" colorscheme hybrid_reverse
colorscheme solarized
set t_Co=256 " switch 256color on

set fencs=utf-8,gb18030,gb2312,latin-1
set fenc=utf-8
set enc=utf-8

" basic
set history=50 " set how many command lines of history VM has to remember
" let mapleader = "\<Space>" " The default leader is '\', but many people prefer Space as it's in a standard location
let mapleader = "," " The default leader is '\', but many people prefer Space as it's in a standard location

" UI
set showcmd " show command you had enter
set nu " show line numbers
set wildmenu " visual autocomplete command menu
set showmatch " highlight matching [{()}]
set cursorline " highlight current line
set ruler " always show current position

" Space&Tab
set expandtab " transfer tabs to spaces
set ts=4 " (tabstop) number of per existed tab display
set sw=4 " (shiftwidth) number of per tab you enter
set sts=4 " (softtabstop) number of per tab when editing, like backspace
set smarttab " let you tab smart~

" indent
set backspace=indent,eol,start " backspace for dummies
set autoindent
" set cindent

" Content Operate
" simple bubble line
map <leader><Down> ddp 
map <leader><Up> ddkP
" Yank text to the OS X clipboard(needs arg, command "*yy will copy a line to
" clipboard)
noremap <leader>y "*y
noremap <leader>yy "*Y
" paste OS X clipboard to vim
noremap <leader>p "*p
" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" search
set hlsearch " highlight matchs
set incsearch " search as character are entered
set ignorecase smartcase " ignore upper case or lower case
" cancel hlsearch for this time
map <leader>n <Esc>:nohl<CR> 

" fold
" set foldmethod=marker
" set foldmarker={,}
" set foldlevel=10
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=syntax " make fold by file syntax

" NERDTree
" shortcut for open and close nerdtree
map <leader>d  <Esc>:NERDTreeToggle<CR> 
" shortcut for find position of current file in the tree
map <leader>f <Esc>:NERDTreeFind<CR> 
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeWinSize=45

"synastic, a syntax checker which support many languages
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" synastic conf
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 5 " set location list height 5 
" fecs in synastic conf
" 不建议首次打开文件时进行检查
let g:syntastic_check_on_open = 0
" `:wq`时不进行检查，注意这跟`:w`不一样
let g:syntastic_check_on_wq = 0
" 如果你想在写文件时不进行检查，需要配置`passive`模式
" 在`passive`模式下，只有手动调用了`:SyntasticCheck`才会触发检查
let g:syntastic_mode_map = {'mode': 'passive'} 
" 你可以配置一个快捷方式，用来快速检查当前文件
nmap <silent> <leader>c :SyntasticCheck<cr>
" js checker: eslint
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['fecs']
" let g:syntastic_javascript_fecs_args = "--reporter=baidu"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" let g:syntastic_debug = 1
" vim-airline conf
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline#extensions#tabline#enabled = 1 " open smarter tab

" CtrlP conf
let g:ctrlp_working_path_mode = 'ra' " set start directory to the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr_darcs
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'  
let g:ctrlp_cmd = 'CtrlP'

" Emmet conf
map <leader>z <Esc><C-y>,<CR> " set shortcut to ' z'

" ultiSnips conf for YCM conflict
let g:UltiSnipsExpandTrigger='<leader>t'
let g:UltiSnipsJumpForwardTrigger='<leader>b'
let g:UltiSnipsJumpBackwardTrigger='<leader>z'
