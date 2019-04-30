" sh ./installer.sh ~/.cache/dein

if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')
  " Asynchronous Lint Engine
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'Yggdroot/LeaderF', {'branch': 'master', 'do': './install.sh'}
  Plug 'Yggdroot/LeaderF-marks', {'branch': 'master'}

  Plug 'Yggdroot/indentLine'

  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'lighttiger2505/deoplete-vim-lsp'
  Plug 'Shougo/neco-vim', { 'for': 'vim' }
  Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'Quramy/tsuquyomi', {'for': 'typescript' }
  Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
  Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
  Plug 'Shougo/neco-syntax'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'jiangmiao/auto-pairs'
  Plug 'machakann/vim-highlightedyank'
  " Plug 'terryma/vim-multiple-cursors'
  Plug 'mg979/vim-visual-multi'
  Plug 'sbdchd/neoformat'

  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'iamcco/markdown-preview.vim'

  Plug 'Shougo/echodoc.vim'

  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'heavenshell/vim-pydocstring'


  Plug 'itchyny/lightline.vim'
  Plug 'maximbaz/lightline-ale'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/seoul256.vim'
  Plug 'nightsense/cosmic_latte'
  Plug 'nikitavoloboev/vim-monokai-night'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'nanotech/jellybeans.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'ayu-theme/ayu-vim'

call plug#end()

filetype plugin indent on
syntax enable

" ================================
"    Global configuration
" ===============================
set termguicolors
set t_Co=256

set autowrite
set autochdir
set nobackup
set noswapfile
set nowritebackup
set colorcolumn=80
set nocursorline
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312,chinese,latin-1
set hidden
set history=1000
set linespace=0
set scrolljump=5
set scrolloff=3
set showmatch
set autoindent
set completeopt+=preview
set completeopt+=menuone
set completeopt+=longest
set completeopt+=noinsert
set completeopt+=noselect
set shortmess+=c
set previewheight=5
set noshowmode
set cmdheight=2
set noruler
set noshowcmd
set clipboard=unnamed,unnamedplus
set mouse=a
set mousehide

set hlsearch
set ignorecase
set incsearch
set smartcase
set showmatch

set expandtab
set shiftwidth=0
set softtabstop=4
set tabstop=4

set wrap
set linebreak
set breakindent
set noshiftround

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" ================================
"    Keymap configuration
" ===============================
let mapleader = "\<SPACE>"
let maplocalleader = ","

" ALE
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)

" Buffer
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bd :bdelete<CR>

"Find and replace
" map <leader>fr :%s///g<left><left>
" map <leader>frl :s///g<left><left>
" map <silent><leader><space> :let @/=''<cr>

" Move up/down editor lines
nnoremap <silent> j gj
nnoremap <silent> k gk

"Better Focus
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

nmap <leader>gy :Goyo<CR>
nmap ngy :Goyo!<CR>

nmap <silent> <F5> <Plug>MarkdownPreview
imap <silent> <F5> <Plug>MarkdownPreview
nmap <silent> <F6> <Plug>StopMarkdownPreview
imap <silent> <F6> <Plug>StopMarkdownPreview

" ================================
"    Plugins configuration
" ===============================
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['eslint'],
    \   'python': ['autopep8'],
    \}

let g:ale_linters = {
    \ 'python': ['/usr/local/bin/flake8', ],
    \ 'sh': ['language_server'],
    \ 'go': ['golint', 'go vet', 'go build'],
    \}
let g:ale_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '😃'
highlight ALEErrorSign guifg=red ctermfg=red
highlight ALEWarningSign guifg=grey ctermfg=grey
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:move_key_modifier = 'N'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1


" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
          \ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
          \ 'less': { 'left': '/*', 'right': '*/' }
      \ }

let g:NERDAltDelims_javascript = 1
let g:NERDDefaultNesting = 1



" Color theme

" Switch
let g:lightline = {}
if strftime('%H') >= 7 && strftime('%H') < 15
  " colorscheme cosmic_latte
  " set background=light

  let ayucolor="light"  " for light version of theme
  colorscheme ayu

  let g:lightline = { 'colorscheme': 'cosmic_latte_light' }
else
  " colorscheme monokai-night
  " colorscheme jellybeans
  " colorscheme nord
  " let ayucolor="mirage" " for mirage version of theme
  let ayucolor="dark"   " for dark version of theme
  colorscheme ayu
  " set background=dark
  " let g:lightline = { 'colorscheme': 'cosmic_latte_dark' }
  " let g:lightline = { 'colorscheme': 'monokai-night' }
  let g:lightline = { 'colorscheme': 'nord' }
  let g:nord_uniform_status_lines = 1
  let g:nord_comment_brightness = 12
endif

" Lightline
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"


" VIM-LSP
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {
        \   'pydocstyle': {'enabled': v:false},
        \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
        \ })
    autocmd FileType python call s:configure_lsp()
endif


function! s:configure_lsp() abort
    setlocal omnifunc=lsp#complete
    nnoremap <buffer> gd :<C-u>LspDefinition<CR>
    nnoremap <buffer> gh :<C-u>LspHover<CR>
    nnoremap <buffer> gt :<C-u>LspTypeDefinition<CR>
    nnoremap <buffer> gr :<C-u>LspReferences<CR>
    nnoremap <buffer> grn :<C-u>LspRename<CR>

    nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
    nnoremap <buffer> gws :<C-u>LspWorkspaceSymbol<CR>

    nnoremap <buffer> gf :<C-u>LspDocumentFormat<CR>
    vnoremap <buffer> grf :LspDocumentRangeFormat<CR>
    nnoremap <buffer> gi :<C-u>LspImplementation<CR>
endfunction


let g:lsp_diagnostics_enabled = 1

" if executable('dotnet')
    " au User lsp_setup call lsp#register_server({
        " \ 'name': 'mspyls',
        " \ 'cmd': {server_info->['dotnet', 'exec', '/Users/yuepeng/common/python-language-server/output/bin/Release/Microsoft.Python.LanguageServer.dll']},
        " \ 'whitelist': ['python']
        " \ })
" endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go call s:configure_lsp()
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
    autocmd FileType typescript call s:configure_lsp()
endif

if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif

" if executable('clangd')
"     augroup lsp_clangd
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"                     \ 'name': 'clangd',
"                     \ 'cmd': {server_info->['clangd']},
"                     \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"                     \ })
"         autocmd FileType c setlocal omnifunc=lsp#complete
"         autocmd FileType cpp setlocal omnifunc=lsp#complete
"         autocmd FileType objc setlocal omnifunc=lsp#complete
"         autocmd FileType objcpp setlocal omnifunc=lsp#complete
"     augroup end
" endif

if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif


" Tab navigation in the popupmenu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Deoplete
" deoplete + neosnippet + autopairs changes
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"


" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" deoplete-jedi
let g:deoplete#sources#jedi#statement_length = 30
let g:deoplete#sources#jedi#short_types = 1
let g:deoplete#sources#jedi#show_docstring = 1

call deoplete#custom#option({
	\ 'auto_refresh_delay': 10,
	\ 'camel_case': v:true,
	\ 'skip_multibyte': v:true,
	\ 'prev_completion_mode': 'filter',
	\ 'min_pattern_length': 1,
	\ 'max_list': 10000,
	\ 'skip_chars': ['(', ')', '<', '>'],
	\ })

let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})
call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'


" echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'


" neoformat
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']


" NerdTree
" autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <leader>n :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }


" Python Docstring
" nmap <silent> <C-d> <Plug>(pydocstring)
nmap <silent> <leader>pd <Plug>(pydocstring)


" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
for f in split(glob('~/.config/nvim/rc/ftplugin/*.vim'), '\n')
    exe 'source' f
endfor

" VM
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
let g:VM_maps["Select l"]           = '<S-Right>'       " start selecting left
let g:VM_maps["Select h"]           = '<S-Left>'        " start selecting right

let g:VM_clear_buffer_hl = 0

fun! VM_Start()
  HighlightedyankOff
endfun

fun! VM_Exit()
  HighlightedyankOn
endfun


" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
