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
" NeoBundle Listings
"==============================================================================

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'thinca/vim-unite-history'

" Languages
NeoBundle 'klen/python-mode'
NeoBundle 'weiss/textgenshi.vim'
NeoBundle 'sophacles/vim-bundle-mako'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'puppetlabs/puppet-syntax-vim'
NeoBundle 'othree/xml.vim'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'elzr/vim-json'

" Programming
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'

" Editing
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mbbill/undotree'

" Text objects
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'lucapette/vim-textobj-underscore' " a_, i_

" Display
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/powerline', {'rev': 'develop', 'rtp': 'powerline/bindings/vim'}
NeoBundle 'tyru/current-func-info.vim'
NeoBundle 'fakeclip'

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
set history=10000
set backspace=eol,indent,start
set mouse=a
set noshowmode
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
set completeopt=menuone,longest,preview
set wildmenu
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* "VCS directories
set wildignore+=*.pyc
set wildignore+=*.so,*.swp,*.pdf,*.dmg,*DS_Store*
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if has("persistent_undo")
    set undodir=~/.vim/tmp undofile
endif

"==============================================================================
" Match it!
"==============================================================================
runtime macros/matchit.vim

"==============================================================================
" YouCompleteMe options
"==============================================================================
let g:ycm_filetype_blacklist = {
            \ 'unite' : 1,
            \ 'markdown' : 1,
            \ 'text' : 1,
            \}

"==============================================================================
" syntastic options
"==============================================================================
let g:syntastic_enable_signs=1

"==============================================================================
" ack options
"==============================================================================
if executable("ack-grep")
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

"==============================================================================
" C settings
"==============================================================================
au FileType c setl cin ts=4 sts=4 sw=4 fo=crql

"==============================================================================
" Perl settings
"==============================================================================
let perl_include_pod = 1
au FileType perl setl et sts=4 ts=4 sw=4

"==============================================================================
" Erlang settings
"==============================================================================
let g:erlangHighlightBIFs = 1
let g:erlangCompleteFile="~/.vim/bundle/vimerl/autoload/erlang_complete.erl"
let g:erlangCheckFile="~/.vim/bundle/vimerl/compiler/erlang_check.erl"
let g:erlangCompletionGrep="zgrep"
let g:erlangManSuffix="erl\.gz"

"==============================================================================
" Java settings
"==============================================================================
au FileType java setl cin ts=4 sw=4 sts=4 fo=crql

"==============================================================================
" Python settings
"==============================================================================
au FileType python setl sta ts=4 sw=4 sts=4 fo=crql
let python_highlight_all = 1
au BufRead,BufNewFile *.mako  set ft=mako
au BufRead,BufNewFile *.html set ft=htmldjango
let g:pymode_folding = 0
let g:pymode_lint_ignore = "E501"
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

"==============================================================================
" PHP settings
"==============================================================================
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

"==============================================================================
" Shell settings
"==============================================================================
au FileType sh setl et sw=4 ts=4 sts=4 ai si
let g:is_bash = 1

"==============================================================================
" Ruby settings
"==============================================================================
au FileType ruby setl et sw=2 ts=2 sts=2 ai si

"==============================================================================
" Markdown settings
"==============================================================================
au FileType markdown setl et spell tw=80

"==============================================================================
" Puppet settings
"==============================================================================
au FileType puppet setl et sw=2 ts=2 sts=2

"==============================================================================
" Expand region settings
"==============================================================================
call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })

"==============================================================================
" Unite Settings
"==============================================================================
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('files', 'smartcase', 1)
let g:unite_source_history_yank_enable = 1
let g:unite_update_time = 200
let g:unite_source_file_mru_limit = 1000

" Prefer the_silver_searcher, but fallback to ack-grep
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--noheading --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--noheading --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--noheading --nocolor'
    let g:unite_source_grep_recursive_opt = ''
endif

" Make quickmatch easier for colemak
let g:unite_quick_match_table =
      \ {
      \     'a' : 0, 'r' : 1, 's' : 2, 't' : 3, 'd' : 4, 'h' : 5, 'n' : 6, 'e' : 7, 'i' : 8, 'o' : 9,
      \     'q' : 10, 'w' : 11, 'f' : 12, 'p' : 13, 'g' : 14, 'j' : 15, 'l' : 16, 'u' : 17, 'y' : 18, ';' : 19,
      \     '1' : 20, '2' : 21, '3' : 22, '4' : 23, '5' : 24, '6' : 25, '7' : 26, '8' : 27, '9' : 28, '0' : 29,
      \ }

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

" Autoreload vimrc if we edit it
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"==============================================================================
" Custom mappings
"==============================================================================

" Use comma as leader everywhere
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"==============================================================================
" Normal Mode Mappings
"==============================================================================
nnoremap _ :split<CR>
nnoremap <bar> :vsplit<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :Errors<CR>
" Fugitive bindings
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gg :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>

map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
nnoremap <leader>o :only<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>w <C-w>w

"==============================================================================
" Visual Mode Mappings
"==============================================================================

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
" Keep selection selected when indenting
vnoremap > >gv
vnoremap < <gv

"==============================================================================
" Unite Mappings
"==============================================================================
nnoremap [unite] <Nop> " Everything unite starts with space
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files -start-insert buffer file_mru bookmark file_rec/async<CR>
" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>
" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>
" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>
" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>
" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>
" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files -start-insert file_rec/async file/new<CR>
" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep -start-insert grep:.<CR>
" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help -start-insert help<CR>
" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>
" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>
" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find -start-insert find:.<CR>
" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands -start-insert command<CR>
" Quick buffers
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=buffers -quick-match buffer<CR>
" Quick commands
nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history history/command command<CR>

" Local overrides for work etc
try
    source ~/.vimrc-local
catch
endtry
