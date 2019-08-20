call plug#begin('~/.vim/plugged')

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " snipet
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " statusline
    Plug 'itchyny/lightline.vim'

    " tools
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/vim-easy-align'
    Plug 'iamcco/mathjax-support-for-mkdp'
    Plug 'iamcco/markdown-preview.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'itchyny/calendar.vim'
    Plug 'cinuor/vim-header'

call plug#end()

filetype plugin indent on
syntax enable

" ================================
"    Global configuration
" ===============================
set termguicolors
set t_Co=256
colorscheme monokai-soda

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
"hide buffers instead of closing them even if they contain unwritten changes
set hidden
set cursorline
set colorcolumn=81

set laststatus=2
"modifiedflag, charcount, filepercent, filepath
set statusline=%=%m\ %c\ %P\ %f\

set splitbelow
set splitright

set autoindent

set autowrite
set autochdir
set nobackup
set noswapfile
set nowritebackup
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312,chinese,latin-1
set history=1000
set linespace=0
set scrolljump=5
set scrolloff=3
set showmatch
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
" set spell spelllang=en_us
set autoread

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

nmap <silent> <F5> <Plug>MarkdownPreview
imap <silent> <F5> <Plug>MarkdownPreview
nmap <silent> <F6> <Plug>StopMarkdownPreview
imap <silent> <F6> <Plug>StopMarkdownPreview

" ================================
"    Plugins configuration
" ===============================
" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" coc-word {
    let g:coc_word_enabled = 0

    function! CocWordTrigger()
        if !exists("g:coc_word_enabled")
            let g:coc_word_enabled = 0
        endif
        if g:coc_word_enabled==0
            let g:coc_word_enabled = 1
            call coc#config('coc.source.word.enable', 1)
        else
            let g:coc_word_enabled = 0
            call coc#config('coc.source.word.enable', 0)
        endif
    endfunction

    function! CocWordStatus()
        return g:coc_word_enabled ? "10K" : ""
    endfunction

    nnoremap <silent> <leader>w :<C-u>call CocWordTrigger()<CR>
    " }

" " lightline {
    set laststatus=2
    let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
        \   'left':[    ['mode', 'paste'],
        \               ['readonly', 'filename', 'modified', 'cocstatus', 'cocword']],
        \   'right':[   ['lineinfo'],
        \               ['percent'],
        \               [ 'fileformat', 'fileencoding', 'filetype']]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status',
        \   'cocword': 'CocWordStatus'
        \ }
        \}
" }

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" Python Docstring
" nmap <silent> <C-d> <Plug>(pydocstring)
nmap <silent> <leader>pd <Plug>(pydocstring)


" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
for f in split(glob('~/.config/nvim/rc/ftplugin/*.vim'), '\n')
    exe 'source' f
endfor

" NerdTree {
    nnoremap <silent> <F2> :NERDTree<CR>
    let NERDTreeWinSize=18
" }

" vim-header {
 let g:header_auto_add_header = 0
 let g:header_field_timestamp_format = '%Y-%m-%d %H:%M:%S'
 let g:header_field_author = 'Fan Lizhou'
 let g:header_field_author_email = 'cokie@foxmail.com'
 nnoremap <silent> <F7> :AddHeader<CR>
" }

" coc-snippets {
    " Snippets
    let g:coc_snippet_next = '<c-j>'
    let g:coc_snippet_prev = '<c-k>'


    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    autocmd! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" }

" coc.nvim {
    " Define some functions that not in coc.nvim
    nnoremap <Plug>(coc-hover) :<C-u>call CocAction("doHover")<CR>

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gt <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gh <Plug>(coc-hover)

    " Remap keys for rename
    nmap <silent> <leader>rn <Plug>(coc-rename)

    " Remap keys for diagnostic
    nmap <silent> <leader>nw <Plug>(coc-diagnostic-next)
    nmap <silent> <leader>pw <Plug>(coc-diagnostic-prev)
    nmap <silent> <leader>ne <Plug>(coc-diagnostic-next-error)
    nmap <silent> <leader>pe <Plug>(coc-diagnostic-prev-error)

    " Remap keys for format
    nmap <silent> fm <Plug>(coc-format)
    vmap <silent> fm <Plug>(coc-format-selected)

    " Show all diagnostics
    nnoremap <silent> <leader>ld  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <leader>le  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <leader>lc  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <leader>lo  :<C-u>CocList outline<cr>
    " }
