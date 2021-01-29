" pip install neovim
" pip3 install neovim
" gem install neovim
" :CheckHealth

let s:is_iterm = exists('$ITERM_PROFILE')
let s:is_tmux = exists('$TMUX')
let s:is_vimr = has('gui_vimr')

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

" 全角記号の見た目が崩れる場合があるので対応
set ambiwidth=double
"タブで半角スペース入れる
set expandtab
"タブは半角4文字
set tabstop=4
"インデントもtabstopに合わせる
set shiftwidth=4
"拡張子によってはタブ幅を2文字に変更
au BufNewFile,BufRead *.rb,*.yml,*.erb,*.coffee,*.jade,*.ts,*.tsx,*.js,*.jsx,*.lint,Podfile,Gemfile,Guardfile,*.slim,*.jbuilder set tabstop=2 shiftwidth=2
"対応括弧強調
set showmatch
"検索結果強調
set hlsearch
"常にカーソル行より10行余裕持って表示()
set scrolloff=10
"検索とかでジャンプした際にジャンプ前のカーソル位置を維持
set nostartofline
"タブや行末などを可視化
set list
" タブとか改行を示す文字列 eol(改行)は背景色違いのスペースにする。
set listchars=tab:^\ ,extends:<,trail:-,eol:\ 
" 一応ステータスバーの幅を指定
set laststatus=2
" カーソルの見た目をコマンドモードはブロックでインサートモードは棒に
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"/を勝手にESCAPE
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
" 改行コードの解釈優先順位
set fileformats=unix,mac,dos
" 内部の解釈の文字コード 設定ファイルもこのコードで！
set encoding=utf-8
" 内部の改行コード
set fileformat=unix

" ノーマルモードで Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" Spaceで1ページ移動 Shift + Spaceで戻る
nnoremap <SPACE>   <PageDown>
nnoremap <S-SPACE> <PageUp>
" 日付 YYYY/MM/DD
inoremap <F6> <ESC>i<C-R>=strftime("%Y/%m/%d")<CR>
" 日時 HH:mm
inoremap <F7> <ESC>i<C-R>=strftime("%H:%M")<CR>

" JSON
au BufRead,BufNewFile *.json set filetype=json
" Scala
au BufRead,BufNewFile *.scala set ft=scala syntax=scala
" aspx, ascx
au BufRead,BufNewFile *.as[cp]x set filetype=aspnetcs
au BufRead,BufNewFile *.ashx set filetype=cs
" javascript
au BufRead,BufNewFile *.msx set filetype=javascript
" typescript
au BufRead,BufNewFile *.ts set filetype=typescript
" coffeescript, cson
au BufRead,BufNewFile,BufReadPre *.coffee,*.cson set filetype=coffee
" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
" textile
au BufRead,BufNewFile *.textile set filetype=textile
" 抜けてるRuby系
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile Podfile set filetype=ruby
" OSごとで有効にする設定
if has("Linux")
    " nginx.conf
    au BufRead,BufNewFile /etc/nginx/* set ft=nginx
    " php-fpm conf
    au BufRead,BufNewFile /etc/php5/fpm/* set syntax=dosini
    au BufRead,BufNewFile /etc/php*.conf set syntax=dosini
endif

if s:is_iterm
    if s:is_tmux
        " カーソルを通常■、インサート時_
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    endif
endif

" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_repo_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールのものがあったらインストール
if dein#check_install()
  call dein#install()
endif

if s:is_vimr
  set termguicolors
  set background=dark
  colorscheme pablo
endif

" append syntax, filetypes
syntax on
filetype plugin indent on

