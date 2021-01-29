let s:dein_dir = expand('~/$VIMFILE_DIR/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " utility
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#add('kien/ctrlp.vim.git')
    call dein#add('scrooloose/syntastic.git')
    call dein#add('Shougo/neocomplete')
    " call dein#add('Shougo/neosnippet')
    " call dein#add('Shougo/neosnippet-snippets')
    " call dein#add('honza/vim-snippets')
    call dein#add('itchyny/lightline.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('Townk/vim-autoclose')
    call dein#add('thinca/vim-quickrun')
    call dein#add('terryma/vim-multiple-cursors')
    " call dein#add('Shougo/unite.vim.git')
    " call dein#add('h1mesuke/unite-outline.git')
    call dein#add('szw/vim-tags')
    call dein#add('majutsushi/tagbar.git')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('osyo-manga/vim-over')
    call dein#add('AndrewRadev/switch.vim')
    call dein#add('tyru/caw.vim')
    call dein#add('severin-lemaignan/vim-minimap')
    call dein#add('tpope/vim-surround')
    call dein#add('AndrewRadev/splitjoin.vim')

    " git
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-rhubarb')

    " color scheme
    " call dein#add('tomasr/molokai.git')
    call dein#add('altercation/vim-colors-solarized')

    " html, css, sass
    call dein#add('mattn/emmet-vim')
    " call dein#add('othree/html5.vim')
    call dein#add('digitaltoad/vim-jade')
    call dein#add('nikvdp/ejs-syntax')
    call dein#add('slim-template/vim-slim')
    call dein#add('lumiliet/vim-twig')
    call dein#add('yosssi/vim-ace')
    call dein#add('gorodinskiy/vim-coloresque')
    call dein#add('hail2u/vim-css3-syntax')
    call dein#add('cakebaker/scss-syntax.vim')
    call dein#add('lilydjwg/colorizer')

    " JavaScript, altJS
    call dein#add('othree/yajs.vim')
    call dein#add('othree/es.next.syntax.vim')
    call dein#add('heavenshell/vim-jsdoc.git')
    call dein#add('othree/javascript-libraries-syntax.vim')
    call dein#add('kchmck/vim-coffee-script')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('clausreinke/typescript-tools.vim')
    call dein#add('flowtype/vim-flow')
    call dein#add('mxw/vim-jsx')
    " Ruby
    call dein#add('tpope/vim-rails.git')
    call dein#add('tpope/vim-bundler.git')
    call dein#add('tpope/vim-endwise')
    call dein#add('vim-scripts/ruby-matchit')
    call dein#add('Keithbsmiley/rspec.vim')
    call dein#add('thoughtbot/vim-rspec')
    call dein#add('osyo-manga/vim-monster')
    call dein#add('tpope/vim-dispatch')
    call dein#add('thinca/vim-ref')
    " Python
    " call dein#add('davidhalter/jedi-vim')
    " call dein#add('andviro/flake8-vim')
    " call dein#add('hynek/vim-python-pep8-indent')
    " call dein#add('jmcantrell/vim-virtualenv')
    " Go
    call dein#add('google/vim-ft-go')
    call dein#add('vim-jp/vim-go-extra')
    " Swift
    call dein#add('keith/swift.vim')
    " markdown
    call dein#add('plasticboy/vim-markdown')
    call dein#add('kannokanno/previm')
    call dein#add('tyru/open-browser.vim')
    " other syntax
    call dein#add('derekwyatt/vim-scala')
    call dein#add('elixir-lang/vim-elixir')
    call dein#add('elzr/vim-json')
    call dein#add('cespare/vim-toml')
    call dein#add('vim-scripts/aspnetcs.git')
    call dein#add('evanmiller/nginx-vim-syntax')
    call dein#add("ekalinin/Dockerfile.vim")
    call dein#add("adamclerk/vim-razor")
    call dein#add('chase/vim-ansible-yaml')
    call dein#add('timcharper/textile.vim')
    call dein#add('Keithbsmiley/tmux.vim')

    call dein#end()
    call dein#save_state()

    if dein#check_install()
        call dein#install()
    endif
endif

" ----------------------------------------------
" plugin settings
" ----------------------------------------------
" 色指定
set background=dark

" カラースキーム
let scheme = 'solarized'
augroup guicolorscheme
    autocmd!
    execute 'autocmd VimEnter * nested colorscheme' scheme
augroup END
" ステータスバーの見た目
let g:lightline = { 'colorscheme': 'solarized' }

" tagbar
let g:tagbar_type_javascript = { 'ctagsbin': 'jsctags' }

" markdown
" auto closeing disabled
let g:vim_markdown_folding_disabled=1

" vim-quickrun
let g:quickrun_config = {}
" mac only markdown -> marked
" if has("mac")
"     let g:quickrun_config.markdown = {
"                 \ 'outputter' : 'null',
"                 \ 'command'   : 'open',
"                 \ 'cmdopt'    : '-a',
"                 \ 'args'      : '"Marked 2"',
"                 \ 'exec'      : '%c %o %a %s',
"                 \ }
" endif

" Javascript系のライブラリのシンタックスを追加
" 依存→ 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore,chai,react'

" tern
"let bundle = neobundle#get('neocomplete.vim')
"function! bundle.hooks.on_post_source(bundle)
"    " いろいろな設定…

"    let g:neocomplete#sources#omni#functions.typescript = 'tern#Complete'
"    let g:neocomplete#sources#omni#input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?'

"    " いろいろな設定…
"endfunction
"unlet bundle

" NERDTree
" open on vim started (exclude when it open with filename)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && !has('gui_running') | NERDTree | endif
" open hidden files
let NERDTreeShowHidden = 1
" set indicators
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "!",
    \ "Renamed"   : "-",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "x",
    \ "Dirty"     : "X",
    \ "Clean"     : "$",
    \ "Unknown"   : "?"
    \ }
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
" extension, fg, bg, guifg, guibg
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx',    'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
" ignore
let NERDTreeIgnore=['\.DS_Store$']

" neocomplete.vim
" use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '¥*ku¥*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '¥h¥w*'
let g:neocomplete#sources#omni#input_patterns = {
            \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
            \}

" indent_guides
" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1
hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=236
au FileType coffee,ruby,javascript,python,json,aspnetcs,vim IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

" json
" "を見た目上消す
let g:vim_json_syntax_conceal = 0

" syntastic
if has("win32") || has("win64")
    let g:syntastic_mode_map = {
        \ 'mode': 'passive',
        \ 'active_filetypes': ['javascript', 'coffee', 'typescript'],
        \ 'passive_filetypes': []
        \ }
else
    let g:syntastic_mode_map = {
        \ 'mode': 'passive',
        \ 'active_filetypes': ['javascript', 'coffee', 'typescript', 'ruby', 'php', 'scss', 'swift'],
        \ 'passive_filetypes': []
        \ }
end
let g:syntastic_check_on_open=1
let g:syntastic_check_on_save=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=6
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'
" ファイルタイプ毎のチェックツール指定
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_coffeescript_checkers = ['coffeelint']
let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_elixir_checkers = ['elixir']
" let g:syntastic_enable_elixir_checker = 1
let g:syntastic_php_checkers = ['phpcs', 'phpmd']
let g:syntastic_php_phpcs_args="--standard=psr2"
let g:syntastic_php_phpmd_post_args='codesize,design,unusedcode,naming'
let g:syntastic_scss_checkers = ['stylelint']
let g:syntastic_scss_stylelint_args = "--config ~/.stylelintrc"
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

"===========================================================
" alias (plugins)
"===========================================================
" F9: NERDTree
nnoremap <F9> :NERDTreeToggle<CR>
" F8: Tagbar
nnoremap <F8> :TagbarToggle<CR>
" F2: Preview
" CoffeeScript
autocmd FileType coffee nnoremap <F2> :CoffeeCompile vert<CR>
" textile, Markdown
autocmd FileType textile,markdown nnoremap <F2> :PrevimOpen<CR>
if has("mac")
    " markdown
    autocmd FileType markdown nnoremap <F2> :QuickRun<CR>
endif
" ctrl-@: quickrun
nnoremap <silent> <C-@> :QuickRun<CR>
" ctrl-c: comment out
nmap <C-c> <Plug>(caw:hatpos:toggle)
vmap <C-c> <Plug>(caw:hatpos:toggle)

