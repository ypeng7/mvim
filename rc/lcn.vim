function! Help_Language_Client_neovim()
    echo '<leader>gd        definition'
    echo '<leader>gt        typeDefinition'
    echo '<leader>gI        implementation'
    echo '<leader>gr        references'
    echo '<leader>gR        rename'
    echo '<leader>ga        codeAction'
    echo '<leader>gf        formatting'
endfunction

" Server Register
let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls'],
    \ 'cpp': ['ccls'],
    \ 'objc': ['ccls'],
    \ 'objcpp': ['ccls'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'yaml': ['yaml-language-server'],
    \ 'go': ['gopls']
    \ }

augroup LanguageClientAu
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=auto
    autocmd User LanguageClientStopped setlocal signcolumn=auto
    autocmd CursorHold call LanguageClient#textDocument_hover()
    autocmd CursorHold call LanguageClient#textDocument_documentHighlight()
    autocmd CursorMoved call LanguageClient#textDocument_clearDocumentHighlight()
augroup END

let g:LanguageClient_hasSnippetSupport = 1
" AutoStart
let g:LanguageClient_autoStart = 1
" hoverPreview: Never Auto Always
let g:LanguageClient_hoverPreview = 'Always'

" Completion
set omnifunc=LanguageClient#complete
" Formatting
set formatexpr=LanguageClient_textDocument_rangeFormatting()
" Mappings
nnoremap <silent> <leader>gd :<C-u>call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>gt :<C-u>call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <silent> <leader>gI :<C-u>call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> <leader>gr :<C-u>call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>gR :<C-u>call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>ga :<C-u>call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <leader>gf :<C-u>call LanguageClient#textDocument_formatting()<CR>
vnoremap <silent> <leader>gf :<C-u>call LanguageClient#textDocument_rangeFormatting()<CR>

let g:LanguageClient_diagnosticsDisplay = {
    \ 1: {
    \ 'name': 'Error',
    \ 'texthl': 'ALEError',
    \ 'signText': "\uf65b",
    \ 'signTexthl': 'ALEErrorSign',
    \ },
    \ 2: {
    \ 'name': 'Warning',
    \ 'texthl': 'ALEWarning',
    \ 'signText': "\uf421",
    \ 'signTexthl': 'ALEWarningSign',
    \ },
    \ 3: {
    \ 'name': 'Information',
    \ 'texthl': 'ALEInfo',
    \ 'signText': "\uf7fb",
    \ 'signTexthl': 'ALEInfoSign',
    \ },
    \ 4: {
    \ 'name': 'Hint',
    \ 'texthl': 'ALEInfo',
    \ 'signText': "\uf68a",
    \ 'signTexthl': 'ALEInfoSign',
    \ },
    \ }
