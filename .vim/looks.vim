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

