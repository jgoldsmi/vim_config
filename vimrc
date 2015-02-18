filetype off
set nocp

"==============================================================================
" Plug Setup
"==============================================================================

" Load vim-plug for first time
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.vim/plugged")

"==============================================================================
" Plug Listings
"==============================================================================

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Languages
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'weiss/textgenshi.vim'
Plug 'sophacles/vim-bundle-mako'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'jakar/vim-json', { 'for': 'json' }
Plug 'smerrill/vcl-vim-plugin'
Plug 'chrisbra/csv.vim'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'dag/vim-fish'
Plug 'groenewege/vim-less'

" Programming
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'mhinz/vim-signify'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'

" Editing
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'mihaifm/bufstop', { 'on': 'BufstopFast' }
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Text objects
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire' " ae, ie
Plug 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
Plug 'kana/vim-textobj-line' " al, il
Plug 'kana/vim-textobj-indent' " ai, ii, aI, iI
Plug 'lucapette/vim-textobj-underscore' " a_, i_

" Display
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'tyru/current-func-info.vim'
Plug 'fakeclip'
Plug 'ivyl/vim-bling'
Plug 'sjl/vitality.vim'
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

syntax on
filetype plugin indent on

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
set formatoptions+=j
set smartcase
set notildeop
set laststatus=2
set nostartofline
set history=10000
set backspace=eol,indent,start
set mouse=a
set shortmess+=I
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
set background=dark
let g:rehash256 = 1
colorscheme molokai
set listchars=eol:¬,tab:→\ ,trail:·,extends:»,precedes:«
set list
set cursorline
set completeopt=menuone,longest,preview
set title
set wildmenu
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* "VCS directories
set wildignore+=*.pyc
set wildignore+=*.so,*.swp,*.pdf,*.dmg,*DS_Store*
au BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
            \     exe "normal! g`\"" |
            \ endif

if has("persistent_undo")
    set undodir=~/.vim/tmp undofile
endif

highlight ColorColumn ctermbg=gray
call matchadd('ColorColumn', '\%81v', 100)

"==============================================================================
" Match it!
"==============================================================================
runtime macros/matchit.vim

"==============================================================================
" Airline settings
"==============================================================================
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1

"==============================================================================
" YouCompleteMe options
"==============================================================================
let g:ycm_filetype_blacklist = {
            \ 'unite' : 1,
            \ 'markdown' : 1,
            \ 'text' : 1,
            \}
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0
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
" vim-easymotion options
"==============================================================================
let g:EasyMotion_smartcase = 1

"==============================================================================
" C settings
"==============================================================================
au FileType c setl cin ts=4 sts=4 sw=4

"==============================================================================
" Perl settings
"==============================================================================
let perl_include_pod = 1
au FileType perl setl et sts=4 ts=4 sw=4
let g:syntastic_perl_perlcritic_thres = 3
let perl_sync_dist = 300

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
au FileType java setl cin ts=4 sw=4 sts=4

"==============================================================================
" Python settings
"==============================================================================
au FileType python setl sta ts=4 sw=4 sts=4
let python_highlight_all = 1
au BufRead,BufNewFile *.mako  set ft=mako
au BufRead,BufNewFile *.psp set ft=python
au BufRead,BufNewFile *.html,*.tpl set ft=htmldjango
let g:pymode_folding             = 0
let g:pymode_lint                = 0
let g:pymode_rope                = 1
let g:pymode_rope_completion     = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_trim_whitespaces    = 0

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

"
"==============================================================================
" Javascript settings
"==============================================================================
au FileType javascript setl et sw=4 ts=4 sts=4
let g:syntastic_javascript_checkers = ['jshint', 'jslint']

"==============================================================================
" Shell settings
"==============================================================================
au FileType sh setl et sw=4 ts=4 sts=4
let g:is_bash = 1

"==============================================================================
" Ruby settings
"==============================================================================
au FileType ruby setl et sw=2 ts=2 sts=2

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
" CtrlP Settings
"==============================================================================
let g:ctrlp_map = '<leader>pp'
let g:ctrlp_match_window = 'min:1,max:25,results:50'
let g:ctrlp_extensions = ['buffertag', 'tag', 'undo', 'funky']
let g:ctrlp_open_multiple_files = '1ij'
let g:ctrlp_clear_cache_on_exit = 0

"==============================================================================
" Custom functions
"==============================================================================

" Autoreload vimrc if we edit it
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"==============================================================================
" Custom mappings
"==============================================================================

" Use space as leader everywhere
let mapleader = " "
let g:mapleader = " "
let maplocalleader = " "
let g:maplocalleader = " "

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"==============================================================================
" Normal Mode Mappings
"==============================================================================
nnoremap <bar> :vsplit<CR>
nnoremap <leader><tab> <C-^>
nnoremap <leader>a =ip
nnoremap <leader>b :BufstopFast<CR>
nnoremap <leader>d :lclose<CR>:bd<CR>
nnoremap <leader>e :Errors<CR>
" Fugitive bindings
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gg :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
" EasyMotion bindings
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap s <Plug>(easymotion-s2)

nnoremap <leader>o :only<CR>
" CtrlP Bindings
nnoremap <leader>pb :CtrlPBuffer<CR>
nnoremap <leader>pm :CtrlPMRU<CR>
nnoremap <leader>pt :CtrlPBufTag<CR>
nnoremap <leader>pu :CtrlPUndo<CR>
nnoremap <leader>pf :CtrlPFunky<CR>
nnoremap <leader>sp :split<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>w <C-w>w
noremap <silent> <C-l> :nohls<CR><C-l>

"Ag binding
nnoremap <leader>/ :Ag<space>
"==============================================================================
" Visual Mode Mappings
"==============================================================================

"  In visual mode when you press * or # to search for the current selection
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" Keep selection selected when indenting
vnoremap > >gv
vnoremap < <gv

" Local overrides for work etc
try
    source ~/.vimrc-local
catch
endtry
