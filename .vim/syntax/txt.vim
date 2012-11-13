" Vim syntax file
" Filename: txt.vim
" Language: plain text :)
" Maintainer: Aurelio Marinho Jargas
" URL: http://aurelio.net/doc/vim/txt.vim
" Instalacao: Colocar no final do seu ~/.vimrc:
"   au BufNewFile,BufRead *.txt source ~/rota/para/txt.vim
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn clear
syn case ignore

highlight MinhasNotas ctermbg=Yellow ctermfg=red guibg=Yellow guifg=red
match MinhasNotas /Nota:/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MISC:
syn keyword txtTodo    TODO FIXME XXX contained
syn match   txtComment '^#.*$' contains=txtTodo
syn match   txtNumber  '\<\d\+\([,.]\d\+\)\{,1}\>'
"syn match   txtNumber  '^=\+[^=].*=\+$'
syn match   txtPercent '\<\d\+\([,.]\d\+\)\{,1}%'
"syn match   txtBlank   '\s\+$'
syn match   txtBar     '^\s*[_=-]\{20,}\s*$'
syn match   txtSpecial '[][(){}®]'
syn match   txtSpecial '\<\(US\|R\)\$'

" Comments are enclosed within // //
" matched in a single line only
syn region txtComment start=+//+  end=+//+ oneline contains=txtTodo
syn keyword txtTodo contained TODO FIXME
syn region txtKey start=/`/ skip=/\\\\\|\\`/ end=/`/ oneline
syn match txtItalic / _[^_ 	]\+_/ms=s+2,me=e-1
syn match txtBold / \*[^* 	]*\*/ms=s+2,me=e-1

" Highlighting section(=) and subsection(-)
syn match txtSection /.*\(\n=\{3,60\}\([^=]\|\n\|\s\)\)\@=/ contains=@Section
syn match txtSection /.*\(\n\s\+=\{3,60\}\([^=]\|\n\|\s\)\)\@=/ contains=@Section
syn match txtSubsection /.*\(\n-\{3,60\}\([^-]\|\n\|\s\)\)\@=/ contains=@Section
syn match txtSubsection /.*\(\n\s\+-\{3,60\}\([^-]\|\n\|\s\)\)\@=/ contains=@Section

syn cluster Section contains=txtBold,txtItalic
highlight link txtSection Type
highlight link txtSubsection Preproc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"URL EMAIL:
syn match txtEmail '\<[A-Za-z0-9_.-]\+@\([A-Za-z0-9_-]\+\.\)\+[A-Za-z]\{2,4}\>\(?[A-Za-z0-9%&=+.,@*_-]\+\)\='
syn match txtUrl   '\<\(\(https\=\|ftp\|news\|telnet\|gopher\|wais\)://\([A-Za-z0-9._-]\+\(:[^ @]*\)\=@\)\=\|\(www[23]\=\.\|ftp\.\)\)[A-Za-z0-9%._/~:,=$@-]\+\>/*\(?[A-Za-z0-9/%&=+.,@*_-]\+\)\=\(#[A-Za-z0-9%._-]\+\)\='
syn match txtEmailMsg '^\s*\(From\|De\|To\|Para\|Date\|Data\|Assunto\|Subject\):.*'
syn match txtEmailQuote '^\(>\($\| \)\)\+'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"LIST:
syn match txtList    '^ *[-+*.] [^ ]'me=e-1
syn match txtList    '^ *[0-9]\+) '
syn match txtDefList '^ *[^:]\{6,\}:'hs=e contains=ALL

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"FONT BEAUTIFIERS:
syn match   txtUnderline  '_[^_[:blank:]].\{-}_'hs=s+1,he=e-1
syn match   txtBold       '\*[^*[:blank:]].\{-}\*'hs=s+1,he=e-1
syn match   txtMonospace  "`[^`]\+`"hs=s+1,he=e-1
" max: two lines
syn match   txtParentesis "([^)]\+\(\n\)\=[^)]*)" contains=txtUrl,txtEmail
syn match   txtQuotes     '"[^"]\+\(\n\)\=[^"]*"'hs=s+1,he=e-1
syn match   txtH1         "=[^=].*="hs=s+1,he=e-1
syn match   txtH2         "==[^=].*=="hs=s+2,he=e-2
syn match   txtH3         "===[^=].*==="hs=s+3,he=e-3
" max: two words
syn match   txtQuotes     "'\w\+ \?\w\+'"hs=s+1,he=e-1

" Sentences starting with - or * are bullets
syn match txtBullet /^\s*- /
syn match txtBullet /^\s*\* /
syn match txtBullet /^\s*+ /
syn match txtTitleBody  /\(__Title__:\)\@<=.*$/
syn match txtAuthorBody  /\(__Author__:\)\@<=.*$/
syn match txtTitle  /__Title__:/
syn match txtAuthor  /__Author__:/
syn match txtTitle  /__Titulo__:/
syn match txtAuthor  /__Autor__:/
syn match txtTitleBody  /\(__Titulo__:\)\@<=.*$/
syn match txtAuthorBody  /\(__Autor__:\)\@<=.*$/
syn match txtTitle  /\(Titulo:\)/
syn match txtAuthor  /\(Autor:\)/
syn match txtTitleBody  /\(Titulo:\)\@<=.*$/
syn match txtAuthorBody  /\(Autor:\)\@<=.*$/
"
syn match txtFilename  /\(Filename:\)/
syn match txtURL  /\(URL:\)/
syn match txtFilenameBody  /\(Filename:\)\@<=.*$/
syn match txtURLBody  /\(URL:\)\@<=.*$/
"
syn match txtArquivo  /\(Arquivo:\)/
syn match txtCreated  /\(Criado:\)/
syn match txtArquivoBody  /\(Arquivo:\)\@<=.*$/
syn match txtCreatedBody  /\(Criado:\)\@<=.*$/
"
syn match txtSite  /\(site:\)/
syn match txtLastChange  /\(Last Change:\)/
syn match txtSiteBody  /\(site:\)\@<=.*$/
syn match txtLastChangeBody  /\(Last Change:\)\@<=.*$/
" Highlight page breaks (characterized by 61 or more = or -)
syn match txtBreak /^=\{51,\}/
syn match txtBreak /\s\+=\{51,\}/
syn match txtBreak /^-\{51,\}/
syn match txtBreak /\s\+-\{51,\}/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color definitions (specific)
hi txtBar         term=bold        cterm=bold        gui=bold
hi txtBold        term=bold        cterm=bold        gui=bold
hi txtItalic      term=italic      cterm=italic      gui=italic
hi txtUnderline   term=underline   cterm=underline   gui=underline
"
" color definitions (using Vim defaults)
hi def link txtArquivo Conditional
hi def link txtCreated Conditional
hi def link txtArquivoBody Function
hi def link txtCreatedBody Function
hi def link txtSite Conditional
hi def link txtLastChange Conditional
hi def link txtSiteBody Function
hi def link txtLastChangeBody Function
hi def link txtFilename Conditional
hi def link txtURL Conditional
hi def link txtFilenameBody Function
hi def link txtURLBody Function
hi def link txtBreak Comment
hi def link txtBullet Function
hi def link txtTitle Conditional
hi def link txtAuthor Conditional
hi def link txtTitulo Conditional
hi def link txtAutor Conditional
hi def link txtTitleBody Function
hi def link txtAuthorBody Function
hi link txtComment      Comment
hi link txtQuotes       String
hi link txtH1           Conditional
hi link txtH2           Conditional
hi link txtH3           Conditional
hi link txtBlank        Error
hi link txtNumber       Number
hi link txtPercent      Number
hi link txtTodo         Todo
hi link txtEmail        PreProc
hi link txtUrl          PreProc
hi link txtList         Statement
hi link txtDefList      Statement
hi link txtMonospace    Special
hi link txtSpecial      Statement
hi link txtParentesis   Comment
hi link txtEmailMsg     Structure
hi link txtEmailQuote   Structure
hi def link txtComment Comment
hi def link txtTodo Todo
hi def link txtKey SpecialChar
hi  txtItalic gui=italic term=italic cterm=italic
hi  txtBold gui=bold term=bold cterm=bold
"
let b:current_syntax = 'txt'
" vim:tw=0:et
