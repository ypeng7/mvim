function! Help_vim_visual_multi()
    echo '<F1>          help'
    echo "\n"
    echo 'word 匹配'
    echo 'visual mode选中文本，<leader>]  开始匹配'
    echo ']             匹配下一个'
    echo '[             匹配上一个'
    echo '}             跳转到下一个选中'
    echo '{             跳转到上一个选中'
    echo '<C-f>         跳转到最后一个选中'
    echo '<C-b>         跳转到第一个选中'
    echo 'q             删除当前选中'
    echo 'Q             删除选中区域'
    echo '选中完成后，按i或a进入插入模式，也可以返回普通模式'
    echo '普通模式下h, j, k, l来整体挪移光标'
    echo '<Space>       切换Extend模式'
    echo '<Esc>         退出'
    echo "\n"
    echo 'position 选中'
    echo 'normal mode中，<Tab>选中当前位置'
    echo '普通模式下h, j, k, l来整体挪移光标'
    echo '<Tab>         extend mode'
    echo ']             跳转到下一个选中'
    echo '[             跳转到上一个选中'
    echo '}             跳转到下一个选中'
    echo '{             跳转到上一个选中'
    echo '<C-f>         跳转到最后一个选中'
    echo '<C-b>         跳转到第一个选中'
    echo 'q             删除当前选中'
    echo 'Q             删除选中区域'
    echo '选中完成后，按i或a进入插入模式，也可以返回普通模式'
    echo '普通模式下h, j, k, l来整体挪移光标'
    echo '<Space>       切换Extend模式'
    echo '<Esc>         退出'
    echo "\n"
    echo 'visual mode 选中'
    echo 'visual mode选中后，<Tab>添加光标'
    echo '或者在visual mode选中后，按g/搜索，将会匹配所有搜索结果并进入Extend mode'
    echo '选中完成后，按i或a进入插入模式，也可以返回普通模式'
    echo '普通模式下h, j, k, l来整体挪移光标'
    echo '<Space>       切换Extend模式'
    echo '<Esc>         退出'
    echo "\n"
    echo 'Extend 模式'
    echo '相当于visual模式'
    echo 'h, j, k, l来选中区域'
    echo '<Space>       切换Extend模式'
    echo '<Esc>         退出'
endfunction
"}}}
" https://github.com/mg979/vim-visual-multi/wiki
function! Init_visual_multi()
    vmap <leader>] <C-n>
    let g:VM_maps = {}
    let g:VM_maps['Switch Mode']                 = '<Space>'
    let g:VM_maps['Add Cursor At Pos']           = '<Tab>'
    let g:VM_maps['Visual Cursors']              = '<Tab>'
    let g:VM_maps['Add Cursor Up']               = '<M-z>``````addup'
    let g:VM_maps['Add Cursor Down']             = '<M-z>``````adddown'
    let g:VM_maps['I Arrow ge']                  = '<M-z>``````addup'
    let g:VM_maps['I Arrow e']                   = '<M-z>``````adddown'
    let g:VM_maps['Select e']                    = '<M-z>``````addright'
    let g:VM_maps['Select ge']                   = '<M-z>``````addleft'
    let g:VM_maps['I Arrow w']                   = '<M-z>``````addright'
    let g:VM_maps['I Arrow b']                   = '<M-z>``````addleft'
endfunction
call Init_visual_multi()
