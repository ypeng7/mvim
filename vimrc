if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'Yggdroot/LeaderF', {'branch': 'master', 'do': './install.sh'}
  Plug 'Yggdroot/LeaderF-marks', {'branch': 'master'}

  Plug 'maralla/completor.vim'
  Plug 'maralla/completor-neosnippet'
  Plug 'kyouryuukunn/completor-necovim'


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

" completor
let g:completor_gocode_binary = '$HOME/go/bin/gocode'
let g:completor_complete_options = 'menuone,noselect,preview'
let g:completor_go_guru_binary = 'guru'
let g:completor_go_gofmt_binary = 'goimports'
autocmd BufWritePost *.go :call completor#do('format')

let g:completor_filetype_map = {}
" Enable lsp for go by using gopls
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls'}
" Enable lsp for c by using clangd
let g:completor_filetype_map.c = {'ft': 'lsp', 'cmd': 'clangd'}
let g:completor_filetype_map.python = {'ft': 'lsp', 'cmd': 'pyls'}
noremap <silent> <leader>gd :call completor#do('definition')<CR>
noremap <silent> <leader>gc :call completor#do('doc')<CR>
noremap <silent> <leader>gf :call completor#do('format')<CR>
noremap <silent> <leader>gh :call completor#do('hover')<CR>

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
let g:indentLine_char = '¦'
let g:indentLine_first_char = '┆'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}


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


function! OpenUrlUnderCursor()
    let path="/Applications/Safari.app"
    execute "normal BvEy"
    let url=matchstr(@0, '[a-z]*:\/\/[^ >,;]*')
    if url != ""
        silent exec "!open -a ".path." '".url."'" | redraw!
        echo "opened ".url
    else
        echo "No URL under cursor."
    endif
endfunction
nmap <leader>os :call OpenUrlUnderCursor()<CR>

" nnoremap <F3>s :exe ':silent !open /Applications/Safari.app %'<CR>

autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
let g:go_list_type = "quickfix"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
