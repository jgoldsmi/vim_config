filetype off
let g:pathogen_disabled = ["pathogen"]
call pathogen#infect()
call pathogen#helptags()

set nocp
syntax on
filetype plugin indent on
set backup backupdir=~/.vim/backup
set directory=~/.vim/tmp
set omnifunc=syntaxcomplete#Complete
set relativenumber
set autoread
set background=dark
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
colorscheme solarized
call togglebg#map("<F5>") "Uses <F5> to switch b/w light and dark
set listchars=eol:¬,tab:»=,trail:·,extends:»,precedes:« list
set wildmenu wildmode=list:longest

" neocomplcache
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Recommended key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" syntastic options
let g:syntastic_enable_signs=1

" Restore file position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ack options
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" completion settings
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" C settings
au FileType c setl cin ts=4 sts=4 sw=4 fo=crql

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

" Custom functions
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

" Custom mappings
nnoremap ; :
nmap <F7> :TagbarToggle<CR>
" Don't use the arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
noremap! <Up> <nop>
noremap! <Down> <nop>
noremap! <Left> <nop>
noremap! <Right> <nop>
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
" Move between buffers
map <silent> <C-left>  :bp<CR>
map <silent> <C-right> :bn<CR>
" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
