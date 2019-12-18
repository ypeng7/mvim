" File              : vimrc
" Author            : Yue Peng <yuepaang@gmail.com>
" Date              : 2019-10-24 14:36:30
" Last Modified Date: 2019-12-18 10:10:03
" Last Modified By  : Yue Peng <yuepaang@gmail.com>

" Environment {{{
  set encoding=utf-8 nobomb " utf-8 without BOM
  scriptencoding utf-8
  set fileformats=unix,mac,dos
  set timeoutlen=5000
  set ttimeout
  set ttimeoutlen=10
  set ttyfast
  set mouse=a
  set updatetime=500
  syntax enable
  filetype on
  filetype plugin on
  filetype indent on
  set autoread
  set undofile
  set undodir=~/.vim/tmp/undo
  set undolevels=1000
  set undoreload=10000
  set nocompatible
  set clipboard=unnamed
  set binary
  set noeol
  set shortmess+=c
" }}}

" Editing {{{
    set autoindent
    set shiftround
    set backspace=indent,eol,start " allow backspace in insert mode
    set whichwrap=b,~,<,>,[,],h,l
    set nojoinspaces
    set splitright
    set splitbelow
    set smarttab
    set expandtab
    set completeopt-=preview
    set completeopt+=longest,menuone,noselect
    set wildignore+=.DS_Store,Icon\?,*.dmg,*.git,*.pyc,*.o,*.obj,*.so,*.swp,*.zip
    set wildmenu
    set wildignorecase
" }}}

call plug#begin('~/.vim/plugged')

    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

    Plug 'Shougo/echodoc.vim'

    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'
    " snipet
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " statusline
    Plug 'itchyny/lightline.vim'

    " tools
    Plug 'scrooloose/nerdcommenter'
    Plug 'junegunn/vim-easy-align'
    Plug 'mg979/vim-visual-multi'
    Plug 'itchyny/calendar.vim'
    Plug 'cinuor/vim-header'
    Plug 'junegunn/seoul256.vim'

call plug#end()

filetype plugin indent on
syntax enable

" ================================
"    Global configuration
" ===============================
set termguicolors
set t_Co=256
set background=dark
colo seoul256
let g:seoul256_background=234
" syntax on

" set number
" set nocompatible
set tabstop=4
set signcolumn=yes
set noshowmode
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
set colorcolumn=80
set cmdheight=2
" set foldenable
" set foldmethod=syntax
" set foldcolumn=0
" setlocal foldlevel=1
" set foldlevelstart=99
" "make backspace behave properly in insert mode
set backspace=indent,eol,start

set hidden
set nobackup noswapfile nowritebackup
set wrapscan ignorecase smartcase incsearch hlsearch magic

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"remove current line highlight in unfocused window
au VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * set cul
au WinLeave,FocusLost,CmdwinLeave * set nocul
"
"remove trailing whitespace on save
autocmd! BufWritePre * :%s/\s\+$//e

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

:nnoremap <F2> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
:inoremap <F2> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" ================================
"    Plugins configuration
" ===============================
" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" " lightline {
    set laststatus=2
    let g:lightline = {
        \ 'colorscheme': 'seoul256',
        \ 'active': {
        \   'left':[    ['mode', 'paste'],
        \               ['readonly', 'filename', 'modified']],
        \   'right':[   ['lineinfo'],
        \               ['percent'],
        \               [ 'fileformat', 'fileencoding', 'filetype']]
        \ },
        \ 'component_function': {
        \ }
        \}
" }


" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
for f in split(glob('~/.config/nvim/rc/ftplugin/*.vim'), '\n')
    exe 'source' f
endfor

" vim-header {
    let g:header_auto_add_header = 0
    let g:header_field_timestamp_format = '%Y-%m-%d %H:%M:%S'
    let g:header_field_author = 'Yue Peng'
    let g:header_field_author_email = 'yuepaang@gmail.com'
    nnoremap <silent> <F7> :AddHeader<CR>
" }

" deoplete {
    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

" }

" LanguageClient {
    set hidden

    let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'python': ['/usr/local/bin/pyls'],
        \ 'c': ['/usr/local/bin/ccls'],
        \ 'cpp': ['/usr/local/bin/ccls'],
        \ 'objc': ['/usr/local/bin/ccls'],
        \ }

    function SetLSPShortcuts()
        nnoremap <leader>gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <leader>gr :call LanguageClient#textDocument_rename()<CR>
        nnoremap <leader>gf :call LanguageClient#textDocument_formatting()<CR>
        nnoremap <leader>gt :call LanguageClient#textDocument_typeDefinition()<CR>
        nnoremap <leader>gx :call LanguageClient#textDocument_references()<CR>
        nnoremap <leader>ga :call LanguageClient_workspace_applyEdit()<CR>
        nnoremap <leader>gc :call LanguageClient#textDocument_completion()<CR>
        nnoremap <leader>gh :call LanguageClient#textDocument_hover()<CR>
        nnoremap <leader>gs :call LanguageClient_textDocument_documentSymbol()<CR>
        nnoremap <leader>gm :call LanguageClient_contextMenu()<CR>
    endfunction()

    augroup LSP
        autocmd!
        autocmd FileType cpp,c,rust,python,go call SetLSPShortcuts()
    augroup END
"

"echodoc {
    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'signature'
" }
