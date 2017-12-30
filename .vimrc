set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

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
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" put used plugins in here:
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'sickill/vim-monokai'

" stuff for vim-airline
let g:airline_powerline_fonts = 1

" stuff for ctrlp plugin
let g:ctrlp_map = '<c-p>'
let g:cltrp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" stuff for CurtineIncSw
map <F5> :call CurtineIncSw()<CR>

" stuff for vim-gls
autocmd! BufNewFile,BufRead *.vs,*.fs,*.gs set ft=glsl

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" This is for syntax highlighting
if !exists("g:syntax_on")
	syntax enable " https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript
endif

let mapleader=","

set shiftwidth=4
set tabstop=4

set number
set relativenumber

" for searching
set hlsearch
set incsearch " enable incremental search
set ic " defaults to ignore case
set smartcase " search will be case sensitive if search pattern contains upper case character
nnoremap <esc> :noh<return><esc> " clear highlight on pressing esc

"ignore files in the build folder
set wildignore+=*\\build\\*,*\\bin\\*,*\\build_win_clang\\* " for windows
set wildignore+=*/build/*,*/bin/*,*/build_win_clang/* " for linux

" line warp options
set breakindent " wrapped line appears in with the same indent
set breakindentopt=shift:4

set cursorline " highlight cursor's current line
set noswapfile
set noerrorbells
set belloff=all
set pastetoggle=<F3>

""""" for toggling comment

let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction


nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>
""""" end of toggling comment stuff

" vsplit " make vertical split as default. should be the last one in the file as some set will only be applied to one of the view instead




