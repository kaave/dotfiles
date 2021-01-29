" 行間設定
set lsp=6

"escでハイライトをオフ ターミナルからVimをあげるとおかしくなるのでこっちに避難
nnoremap <silent> <ESC> <ESC>:noh<CR>

" OS別に設定
if has("win32") || has("win64")
  " フォント設定
  set guifont=Ricty\ Discord:h12
  "ウィンドウサイズ
  set columns=180
  set lines=54

  " タブ化
  " 合わせて起動オプションに
  " --remote-tab-silent
  " を追加すること
  set showtabline=2

  " ツールバーのアイコン群を常に非表示
  set guioptions-=T

  " メニューの文字化けをなおす
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim

  " このへんで背景色を指定し直す
  set background=dark

  "半透明化
  "autocmd FocusGained * set transparency=240
  "autocmd FocusLost * set transparency=220
elseif has("mac")
  " フォント設定
  set guifont=Ricty\ Discord:h18
  "ウィンドウサイズ
  set columns=180
  set lines=50
  "半透明化
  "autocmd FocusGained * set transparency=5
  "autocmd FocusLost * set transparency=20

  " コマンドモードに戻る際にIMEを外す Windowsはなぜかこれなくても有効
  set imdisable
else
  " hide GUI icons
  set guioptions-=T
  " font settings
  set guifont=Ricty\ Discord\ 14
  set columns=140
  set lines=40
endif

