"---------------------------------------------------------------------------
" machine type define
"---------------------------------------------------------------------------
let s:is_iterm = exists('$ITERM_PROFILE')
let s:is_tmux = exists('$TMUX')
let s:is_win = has("win32") || has("win64")
let s:is_mac = has("mac")
let s:is_unix = has("unix")
let s:is_linux = has("Linux")

let s:noplugin = 0

"---------------------------------------------------------------------------
" set vim dir
"---------------------------------------------------------------------------
if s:is_win
    :let $VIMFILE_DIR = 'vimfiles'
else
    :let $VIMFILE_DIR = '.vim'
endif

source ~/$VIMFILE_DIR/core.vim
source ~/$VIMFILE_DIR/looks.vim
source ~/$VIMFILE_DIR/search.vim
source ~/$VIMFILE_DIR/charset.vim
source ~/$VIMFILE_DIR/alias.vim
source ~/$VIMFILE_DIR/syntax.vim

" tmux
if s:is_iterm
    if s:is_tmux
        source ~/$VIMFILE_DIR/tmux.vim
    endif
endif

source ~/$VIMFILE_DIR/dein.vim

" append syntax, filetypes
syntax on
filetype plugin indent on

