if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | nested source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
  Plug 'Yggdroot/LeaderF', {'branch': 'master', 'do': './install.sh'}
  Plug 'Yggdroot/LeaderF-marks', {'branch': 'master'}

  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'ryanolsonx/vim-lsp-typescript'
  Plug 'lighttiger2505/deoplete-vim-lsp'
  Plug 'Shougo/neco-vim', { 'for': 'vim' }
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'Quramy/tsuquyomi', {'for': 'typescript' }
  Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
  Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
  Plug 'Shougo/neco-syntax'
  Plug 'ryanolsonx/vim-lsp-javascript'
  Plug 'mattn/emmet-vim'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'jiangmiao/auto-pairs'
  Plug 'machakann/vim-highlightedyank'
  Plug 'mg979/vim-visual-multi'
  Plug 'sbdchd/neoformat'
  Plug 'Yggdroot/indentLine'

  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'iamcco/markdown-preview.vim'

  Plug 'Shougo/echodoc.vim'

  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'heavenshell/vim-pydocstring'


  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  Plug 'NLKNguyen/papercolor-theme'

call plug#end()

filetype plugin indent on
syntax enable

" ================================
"    Global configuration
" ===============================
set termguicolors
set t_Co=256
"more characters will be sent to the screen for redrawing
set ttyfast

"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50

"make backspace behave properly in insert mode
set backspace=indent,eol,start
set noshowcmd
"a better menu in command mode
set wildmenu
set wildmode=longest:full,full

set splitbelow
set splitright

set autowrite
set autochdir
set nobackup
set noswapfile
set nowritebackup
set colorcolumn=81
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
set wrapmargin=2
set linebreak
set breakindent
set noshiftround
set number
set relativenumber
set laststatus=2
" set spell spelllang=en_us
set autoread

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" ================================
"    Keymap configuration
" ===============================
let mapleader = "\<SPACE>"
let maplocalleader = ","

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
let g:lightline = {}
colorscheme PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' }
if strftime('%H') >= 7 && strftime('%H') < 16
  set background=light

else
  set background=dark
endif


" VIM-LSP
if executable('pyls')
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




if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go call s:configure_lsp()
endif

" if executable('go-langserver')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'go-langserver',
"         \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
"         \ 'whitelist': ['go'],
"         \ })
"     autocmd FileType go call s:configure_lsp()
" endif

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

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif



if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_hint = {'text': '$'}

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
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#file#force_completion_length=2

call deoplete#custom#option('smart_case', v:true)

imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction


" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


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

call deoplete#custom#var('tabnine', {
\ 'line_limit': 500,
\ 'max_num_results': 20,
\ })

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
let g:indentLine_char = '¦'
let g:indentLine_first_char = '┆'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" netrw
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'

"toggle netrw on the left side of the editor
nnoremap <leader>n :Lexplore<CR>

function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;()]*')
  let s:uri = shellescape(s:uri, 1)
  echom s:uri
  if s:uri != ""
    silent exec "!open '".s:uri."'"
    :redraw!
  else
    echo "No URI found in line."
  endif
endfunction

nnoremap <leader>oc :call HandleURL()<CR>¬

