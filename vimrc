filetype off
set nocp

"==============================================================================
" NeoBundle Setup
"==============================================================================

" Get neobundle from github if not installed
let g:bundle_dir = "~/.vim/bundle/neobundle.vim"
if !isdirectory("~/.vim/bundle/vundle")
    call system("git clone git://github.com/Shougo/neobundle.vim " . g:bundle_dir)
endif

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand("~/.vim/bundle"))

NeoBundleFetch 'Shougo/neobundle.vim'

"==============================================================================
" NeoBundle Listing
"==============================================================================

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'klen/python-mode'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tyru/current-func-info.vim'
NeoBundle 'othree/xml.vim'
NeoBundle 'sophacles/vim-bundle-mako'
NeoBundle 'elzr/vim-json'
NeoBundle 'fakeclip'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'weiss/textgenshi.vim'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'vim-ruby/vim-ruby'

syntax on
filetype plugin indent on

NeoBundleCheck

"==============================================================================
" Builtin Settings
"==============================================================================
set backup backupdir=~/.vim/backup
set directory=~/.vim/tmp
set omnifunc=syntaxcomplete#Complete
set number
set autoread
set expandtab smarttab
set shiftwidth=4 tabstop=8 softtabstop=4
set shiftround
set hidden
set incsearch
set hlsearch
set ignorecase
set magic
set ruler
set smartcase
set tildeop
set gdefault
set laststatus=2
set nostartofline
set backspace=eol,indent,start
set mouse=a
set showmode
set showmatch matchtime=5
set showcmd
set autoindent smartindent
set printoptions=number:y,paper:letter
set tags=./tags;
set scrolloff=5
set wrap
set vb t_vb=
set t_Co=256
set background=light
colorscheme solarized
call togglebg#map("<F5>") "Uses <F5> to switch b/w light and dark
set listchars=eol:¬,tab:»=,trail:·,extends:»,precedes:« list
set cursorline
set wildmenu
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* "VCS directories
set wildignore+=*.pyc

"YankStack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" syntastic options
let g:syntastic_enable_signs=1

" Restore file position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ack options
if executable("ack-grep")
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" completion settings
set completeopt=menuone,longest,preview

" C settings
au FileType c setl cin ts=4 sts=4 sw=4 fo=crql

" Perl settings
let perl_include_pod = 1
au FileType perl setl et sts=4 ts=4 sw=4

" Erlang settings
let g:erlangHighlightBIFs = 1
let g:erlangCompleteFile="~/.vim/bundle/vimerl/autoload/erlang_complete.erl"
let g:erlangCheckFile="~/.vim/bundle/vimerl/compiler/erlang_check.erl"
let g:erlangCompletionGrep="zgrep"
let g:erlangManSuffix="erl\.gz"

" Java settings
au FileType java setl cin ts=4 sw=4 sts=4 fo=crql

" Python settings
au FileType python setl sta ts=4 sw=4 sts=4 fo=crql
let python_highlight_all = 1
au BufRead,BufNewFile *.mako  set ft=mako
au BufRead,BufNewFile *.html set ft=htmldjango
let g:pymode_folding = 0
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Genshi settings
augroup filetypedetect
    autocmd BufNewFile,BufRead *.genshi setfiletype textgenshi
augroup END

" PHP settings
au FileType php setl et sw=2 ts=2 sts=2 ai si isk-=$
au BufRead,BufNewFile *.module  set ft=php
au BufRead,BufNewFile *.install set ft=php
au BufRead,BufNewFile *.inc     set ft=php
let g:PHP_vintage_case_default_indent = 1 "This matches Drupal style
let php_sql_query                     = 1 "Hilight sql in strings
let php_htmlInString                  = 1 "Hilight html in strings
let php_baselib                       = 1 "Hilight baselib functions
let php_parent_error_close            = 1
let php_parent_error_open             = 1

" Shell settings
au FileType sh setl et sw=4 ts=4 sts=4 ai si
let g:is_bash = 1

" Ruby settings
au FileType ruby setl et sw=2 ts=2 sts=2 ai si

" Markdown settings
au FileType markdown setl et spell tw=80

" CtrlP settings
let g:ctrlp_max_height = 30
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_new_file = 'r'

"==============================================================================
" Custom functions
"==============================================================================
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" EasyMotion options: remap leading to avoid conflicts
let EasyMotion_leader_key = ','

" Autoreload vimrc if we edit it
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"==============================================================================
" Custom mappings
"==============================================================================
nnoremap ; :
nmap <leader>t :TagbarToggle<CR>
" Extra tag helpers
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
" Smart way to move b/w windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
" Keep selection selected when indenting
vnoremap > >gv
vnoremap < <gv

" Local overrides for work etc
try
    source ~/.vimrc-local
catch
endtry
