function Help_LeaderF()
    echo '<Tab>                     切换到普通模式'
    echo '<C-c> <Esc>               退出'
    echo '<C-r>                     在Fuzzy和Regex模式间切换'
    echo '<C-f>                     在FullPath和NameOnly模式间切换'
    echo '<C-v>                     从剪切板粘贴'
    echo '<C-u>                     清空输入框'
    echo '<CR> <C-X> <C-]> <A-t>    在当前窗口、新的水平窗口、新的竖直窗口、新的tab中打开'
    echo '<F5>                      刷新缓存'
    echo '<C-s>                     选择多个文件'
    echo '<C-a>                     选择所有文件'
    echo '<C-l>                     清空选择'
    echo '<C-p>                     预览'
    echo '<S-left>                  光标移到最左端'
    echo '<S-right>                 光标移到最右端'
    echo '.                         切换搜索隐藏文件的变量(normal mode)'
    echo '?                         呼出帮助窗口(normal mode)'
    echo "\n"
    echo 'Commands'
    echo '-i, --ignore-case'
    echo '-s, --case-sensitive'
    echo '--no-ignore'
    echo '--no-ignore-parent'
    echo '-t <TYPE>..., --type <TYPE>...'
    echo '-T <TYPE>..., --type-not <TYPE>...'
endfunction

let gs#username='yuepeng'
let g:Lf_DefaultMode = 'Fuzzy' " NameOnly FullPath Fuzzy Regex   :h g:Lf_DefaultMode
let g:Lf_WorkingDirectoryMode = 'ac'  " g:Lf_WorkingDirectoryMode
let g:Lf_RootMarkers = ['.git', '.hg', '.svn']
let g:Lf_ShowHidden = 0  " search hidden files
let g:Lf_FollowLinks = 1  " expand symbol link
let g:Lf_RecurseSubmodules = 1  " show git submodules
let g:Lf_DefaultExternalTool = 'ag'  " 'rg', 'pt', 'ag', 'find'
let g:Lf_StlColorscheme = 'one'  " $HOME/.cache/vim/plugins/LeaderF/autoload/leaderf/colorscheme
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_WindowPosition = 'bottom'  " top bottom left right
let g:Lf_WindowHeight = 0.4
let g:Lf_CursorBlink = 1
let g:Lf_CacheDirectory = expand('~/.cache/vim/')
let g:Lf_NeedCacheTime = 0.5

let g:Lf_PreviewCode = 1  " preview code when navigating the tags
let g:Lf_PreviewResult = {
    \ 'File': 1,
    \ 'Buffer': 1,
    \ 'Mru': 1,
    \ 'Tag': 0,
    \ 'BufTag': 1,
    \ 'Function': 1,
    \ 'Line': 1,
    \ 'Colorscheme': 0
    \}
