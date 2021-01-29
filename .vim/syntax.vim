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

