" trailing whitespace
syn match   JavaScriptError	display excludenl "\s\+$"
" mixed tabs and spaces
syn match   JavaScriptError	display " \+\t"
syn match   JavaScriptError	display "\t\+ "

set shiftwidth=4
set tabstop=4
set textwidth=80
set expandtab
set formatoptions-=c formatoptions-=o formatoptions-=r
