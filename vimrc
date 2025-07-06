"============
" Plugins
"============

" TODO: Bring back Vundle or something newer if we find we need them.


"=============
" Behaviour
"=============

" Options.
set backspace=indent,eol,start
set history=1000            " remember more commands and search history
set noerrorbells            " don't beep
set pastetoggle=<F2>
set undolevels=1000
set wildmenu                " command line tab completion
set tags=tags;/             " look up directory tree for tags file
set backup                  " make backup files
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp    " directory to place swap files in
set mouse=a                 " Enable the mouse.
set wildignore=*.sw*,*.bak,*.pyc,*.class,*.mako.py,*.o,*.egg,*.a
set modelines=5

" clean up netrw config
let g:netrw_browse_split=0
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_list_hide='^\(\..\{-}\.sw.\|.\{-}\.pyc\)$' " FIXME: use wildignore??

" Reopen with sudo.
cmap w!! w !sudo tee % >/dev/null

" Disable the never used ex-mode.
map Q <Nop>

nnoremap ; :

" Don't open gnome help when trying to hit escape.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap j gj
nnoremap k gk

map - :Explore<cr>
set pastetoggle=<F2>

"================
" View
"================

colorscheme peachpuff
syntax on
set ruler
set number

"====================
" formatting
"====================
set expandtab
set smarttab
set autoindent
set shiftwidth=4
set softtabstop=4
set textwidth=79

" file type tab settings
if has("autocmd")
    autocmd FileType python set ts=4 sw=4 et
    autocmd FileType ruby,eruby   set ts=2 sw=2
    autocmd FileType c,cpp  set ts=4 sw=4 cindent
    autocmd FileType javascript  set ts=4 sw=4 cindent et
    autocmd FileType docbk,html,xhtml,xml,css set ts=2 sw=2
    autocmd FileType less set ts=2 sw=2
    autocmd FileType yaml set ts=2 sw=2
    autocmd FileType scss set ts=2 sw=2
    autocmd FileType haml set ts=2 sw=2
    autocmd FileType haml set ts=2 sw=2
    autocmd FileType make,go set noexpandtab ts=8 sw=8
endif
