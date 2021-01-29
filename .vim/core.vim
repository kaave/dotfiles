" kill vi compatible
set nocompatible
" 256 color depth
set t_Co=256
" line number
set number
" kill backup
set nobackup
set nowritebackup
" kill undo file
set noundofile
" kill swapfile
set noswapfile
" indent on
set autoindent
" smart indent off
"set smartindent
"< > でインデントするときにshiftwidthにあわせる
set shiftround
"左右のカーソル移動で行間移動可能にする
set whichwrap=h,l,b,s,<,>,[,]
"矩形選択で行末以降も選択可能に
set virtualedit=block
nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed
" modeline(開いたファイルに書いてあるvim設定)を有効にする
set modeline
" ctrl+a/x の加算/減算処理を10進数固定で扱う
set nrformats=
" エディタからのファイル選択補完を有効に
set wildmode=longest:full
set matchpairs& matchpairs+=<:>
" remove right spaces or tabs before file save
function! RTrim()
    let s:cursor = getpos(".")
    %s/[ \t]\+$//e
    call setpos(".", s:cursor)
endfunction
autocmd BufWritePre *.php call RTrim()       " PHP
autocmd BufWritePre *.rb call RTrim()        " Ruby
autocmd BufWritePre *.ex call RTrim()        " Elixir
autocmd BufWritePre *.exs call RTrim()       " Elixir
autocmd BufWritePre *.js call RTrim()        " JavaScript
autocmd BufWritePre *.jsx call RTrim()       " JSX
autocmd BufWritePre *.coffee call RTrim()    " CoffeeScript
autocmd BufWritePre *.ts call RTrim()        " TypeScript
autocmd BufWritePre *.tsx call RTrim()       " TypeScript React

autocmd BufWritePre *.css call RTrim()       " CSS
autocmd BufWritePre *.scss call RTrim()      " SCSS
autocmd BufWritePre *.sass call RTrim()      " SASS

autocmd BufWritePre *.html call RTrim()      " html
autocmd BufWritePre *.twig call RTrim()      " Twig
autocmd BufWritePre *.ejs call RTrim()       " Effective JavaScript
autocmd BufWritePre *.erb call RTrim()       " Effective Ruby
autocmd BufWritePre *.eex call RTrim()       " Effective Elixir
autocmd BufWritePre *.jade call RTrim()      " pug(jade)
autocmd BufWritePre *.pug call RTrim()       " pug(jade)
autocmd BufWritePre *.slim call RTrim()      " SLIM

autocmd BufWritePre *.json call RTrim()      " JSON
autocmd BufWritePre *.cson call RTrim()      " CSON
autocmd BufWritePre *.xml call RTrim()       " JSON
autocmd BufWritePre *.yml call RTrim()       " JSON

autocmd BufWritePre *.sql call RTrim()       " sql script

autocmd BufWritePre *.bat call RTrim()       " Windows bat file
autocmd BufWritePre *.cmd call RTrim()       " Windows cmd file
autocmd BufWritePre *.sh call RTrim()        " Shell script
autocmd BufWritePre *.bash call RTrim()      " Bash script
autocmd BufWritePre *.zsh call RTrim()       " zsh script
" autocmd BufWritePre *.vim call RTrim()       " vim script

autocmd BufWritePre .vimrc call RTrim()      " vim setting file
autocmd BufWritePre .gvimrc call RTrim()     " vim setting file(GUI)
autocmd BufWritePre .gitignore call RTrim()  " git ignore
autocmd BufWritePre Gemfile call RTrim()     " Gemfile
autocmd BufWritePre Procfile call RTrim()    " Procfile
autocmd BufWritePre Dockerfile call RTrim()  " Dockerfile
autocmd BufWritePre Vagrantfile call RTrim() " Vagrantfile

" autosave cursor position
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" ビープ音を消す
set visualbell t_vb=
set noerrorbells
" LinuxならBackSpace
if exists('$TMUX')
    " ctrl+v, ctrl+hと入れる
    noremap ^? ^H
    noremap! ^? ^H
endif
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" 閉じタグを/まで入力された時点で閉じる
augroup MyXML
    autocmd!
    " autocmd Filetype xml,html,ejs,eruby,eelixir inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype xml,html,eruby,eelixir inoremap <buffer> </ </<C-x><C-o>
augroup END
" インサートモードから抜ける際にnopasteモードにする
autocmd InsertLeave * set nopaste

