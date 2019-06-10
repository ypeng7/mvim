let g:ExcludeIndentFileType_Universal = [ 'startify', 'nerdtree', 'codi', 'help', 'man' ]
let g:ExcludeIndentFileType_Special = [ 'markdown', 'json' ]
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char = '┊' 
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileTypeExclude = g:ExcludeIndentFileType_Universal + g:ExcludeIndentFileType_Special
" let g:indentLine_setColors = 0  " disable overwrite with grey by default, use colorscheme instead
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#616161'
