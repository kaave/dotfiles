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

