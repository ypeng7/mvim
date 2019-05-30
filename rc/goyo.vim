let g:limelight_default_coefficient = 0.7
nnoremap <leader>mf :<C-u>Limelight!!<CR>

let g:goyo_width = 95
let g:goyo_height = 85
let g:goyo_linenr = 0
"进入goyo模式后自动触发limelight,退出后则关闭
augroup Goyo_Config
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
augroup END
nnoremap <leader>mr :<C-u>Goyo<CR>
