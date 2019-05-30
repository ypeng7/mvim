" ================================
"    Global configuration
" ===============================
set history=1000

filetype plugin on
filetype indent on

set autoread

" Fast saving
nmap <leader>w :w!<cr>

"a better menu in command mode
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

set hidden

" make backspace behave properly in insert mode
" configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=h,l,<,>,[,],b,s,~

set hlsearch
set ignorecase
set incsearch
set smartcase

" Do not redraw while executing macros
set lazyredraw

" For regex turn magic on
set magic

" Show matching brackets when indicator is over them
set showmatch
" How many tenths of a second to blink
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
set termguicolors
set t_Co=256

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set termencoding=utf-8
" Use unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off
set nobackup
set noswapfile
set nowritebackup

" Text tab indent related
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set autoindent
set smartindent
set wrap
set wrapmargin=2
set linebreak
set breakindent
set noshiftround

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"more characters will be sent to the screen for redrawing
set ttyfast

"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout

" Highlight <>.
set matchpairs+=<:>
set noshowcmd

set splitbelow
set splitright

set colorcolumn=79
set nocursorline
set linespace=0
set scrolljump=5
set scrolloff=3
set showmatch
set autoindent
set smartindent
set completeopt+=preview
set completeopt+=menuone
set completeopt+=longest
set completeopt+=noinsert
set completeopt+=noselect
set shortmess+=c
set previewheight=5

" Show title.
set title
" Title length.
set titlelen=95

set noshowmode
set clipboard=unnamed,unnamedplus
set mouse=a
set mousehide

set number
set relativenumber


" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=100

" Title string.
let &g:titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\(%{fnamemodify(getcwd(), ':~')}\) - VIM"
" Disable tabline.
set showtabline=0

" Set statusline.
let &g:statusline="%{winnr('$')>1?'['.winnr().'/'.winnr('$')"
      \ . ".(winnr('#')==winnr()?'#':'').']':''}\ "
      \ . "%{(&previewwindow?'[preview] ':'').expand('%:t')}"
      \ . "\ %=%{(winnr('$')==1 || winnr('#')!=winnr()) ?
      \ '['.(&filetype!=''?&filetype.',':'')"
      \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
      \ . "%m%{printf('%'.(len(line('$'))+2).'d/%d',line('.'),line('$'))}"

" Turn down a long line appointed in 'breakat'
set linebreak
set showbreak=\
set breakat=\ \	;:,!?
" Wrap conditions.
if exists('+breakindent')
  set breakindent
  set wrap
else
  set nowrap
endif

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" ================================
"    Keymap configuration
" ===============================
let mapleader = "\<SPACE>"
let maplocalleader = ","

" Buffer
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

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

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
