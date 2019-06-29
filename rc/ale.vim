let g:ALE_MODE = 1  " 0则只在保存文件时检查，1则只在normal模式下检查，2则异步检查
" 普通模式下<leader>lk和<leader>lj分别跳转到上一个、下一个错误
" :ALEDetail  查看详细错误信息
"}}}
let g:ale_linters = {
            \       'c': ['cppcheck', 'flawfinder'],
            \       'cpp': ['cppcheck', 'flawfinder'],
            \       'css': ['stylelint'],
            \       'html': ['tidy'],
            \       'json': [],
            \       'markdown': ['languagetool'],
            \       'python': ['autopep8', 'flake8', 'mypy', 'pydocstyle'],
            \       'rust': ['cargo'],
            \       'sh': ['shellcheck'],
            \       'text': ['languagetool'],
            \       'vim': ['vint'],
            \       'go': ['gopls'],
            \}
"查看上一个错误
nnoremap <silent> [a :ALEPrevious<CR>
"查看下一个错误
nnoremap <silent> ]a :ALENext<CR>
"自定义error和warning图标
let g:ale_sign_error = "\uf65b"
let g:ale_sign_warning = "\uf421"
"防止java在中文系统上警告和提示乱码
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 光标移动到错误的地方时立即显示错误
let g:ale_echo_delay = 0
" virtual text
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_delay = 10
let g:ale_virtualtext_prefix = '▸'
" highlight ALEVirtualTextError ctermfg=Gray guifg=#8d6e6e
" highlight ALEVirtualTextWarning ctermfg=Gray guifg=#8d816e
highlight ALEVirtualTextError ctermfg=Gray guifg=#888888
highlight ALEVirtualTextWarning ctermfg=Gray guifg=#888888
highlight ALEVirtualTextInfo ctermfg=Gray guifg=#888888
highlight link ALEVirtualTextStyleError ALEVirtualTextError
highlight link ALEVirtualTextStyleWarning ALEVirtualTextWarning
" ale-mode
if g:ALE_MODE == 0
    let g:ale_lint_on_text_changed = 'never'
elseif g:ALE_MODE == 1
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1
elseif g:ALE_MODE == 2
    let g:ale_lint_on_text_changed = 'always'
    let g:ale_lint_delay=100
endif
