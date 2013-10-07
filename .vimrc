" Don't load plugins if we aren't in Vim7
if version < 700
    set  noloadplugins
endif

set nocompatible                   " Don't be compatible with vi
filetype off

" Vim Plugin Manager - NeoBundle
if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" Build repos.
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'xolox/vim-session', {
      \ 'depends' : ['xolox/vim-misc', ]}
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Valloric/YouCompleteMe'

NeoBundleCheck

filetype plugin indent on

syntax on                          " Turn on syntax highlighting

" Enable syntax colors
if has("gui_running")
  colorscheme desert

  " no scrollbars
  set guioptions-=r
  set guioptions-=l
  set guioptions-=R
  set guioptions-=L
  " no toolbar
  set guioptions-=T
  " no menu bar
  set guioptions-=m
  set guifont=Menlo\ Regular\ for\ Powerline:h12
  "set fuoptions=maxvert,maxhorz
  "au GUIEnter * set fullscreen
  set mousemodel=popup             " Enable a popup menu on right click in GUI
endif

set background=dark                " Using a dark background

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

set nocp
set lazyredraw              " Don't repaint when scripts are running
set scrolloff=3             " Keep 3 lines below and above the cursor
set sidescrolloff=5
set ruler                   " Line numbers and column the cursor is on
set showcmd                 " Show (partial) command in status line.
set showmatch               " Show matching brackets.
set matchtime=2             " For .2 seconds
set ignorecase              " Do case insensitive matching
set smartcase               " Do smart case matching
set incsearch               " Incremental search
set hlsearch                " Highlight matches to the search
set autowrite               " Automatically save before commands like :next and :make
set mouse=a                 " Enable mouse usage (all modes) in terminals
set number                   " Show line numbering
set numberwidth=1            " Use 1 col + 1 space for numbers
set guitablabel=%N/\ &t\ %M  " Tab labels show filename without path(tail)
set ffs=unix,dos
set encoding=utf-8
set backspace=2              " Backspace over anything!
set formatoptions-=tc        " I can format for myself
set autoindent
set smartindent
set sw=4                     " sw 4 spaces (used on auto ident)
set ts=4                     " Tab stop of 4
set softtabstop=4            " 4 spaces as a tab for bs/del
set smarttab
"set expandtab
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.so,*.lo,.svn,.git,CVS,*.a,*.class,*.jpg,*.png,*.gif,*.edj,*.la,moc_*,qrc_*
set wildmenu                 " Autocomplete features in the status bar
set wildmode=list:longest,full
set nobackup
set paste
set textwidth=100
set nowrap
set dir=~/tmp
set laststatus=2             " Always show statusline, even if only 1 window
set pastetoggle=<F11>
set noswapfile
set history=100              " 100 lines of history
set showfulltag              " Show more information while completing tags
set foldmethod=syntax        " By default, use syntax to determine folds
set foldlevelstart=99        " All folds open by default
set completeopt-=preview
set shortmess+=a             " Use [+] [RO] [w] for modified, read-only, modified
set report=0                 " Notify me whenever any lines have changed
set confirm                  " Y-N-C prompt if closing with unsaved changes
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
set mousemodel=extend        " Enable search with Shift+click
set list
set listchars=tab:»·,trail:·,extends:…,nbsp:.
set cursorline
set splitright

"\n to turn off search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
"\l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>
" Tabs
" Open a new tab: Ctrl + t
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
" Close tab: Ctrl + c
:nmap <C-c> :tabclose<CR>
:imap <C-c> <Esc>:tabclose<CR>
" Go to next tab: Ctrl + right
:nmap <C-Right> :tabnext<CR>
:imap <C-Right> <Esc>:tabnext<CR>
" Go to previous tab: Ctrl + left
:nmap <C-Left> :tabprevious<CR>
:imap <C-Left> <ESC>:tabprevious<CR>
" You might use Ctrl + (PgUp+PgDn) also, if you are using one terminal's tab only

" Highlight chars that go over the 80-column limit
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength '\%81v.*'

"Highlight whitespaces
highlight WhitespaceEOL ctermbg=red ctermfg=white guibg=red guifg=white
match WhitespaceEOL /\s\+$/

"Vim-session
let g:session_autosave = 'no'

let s:uname = system("uname")
if s:uname != "Darwin\n"
  "Vim-powerline
  let g:Powerline_symbols='fancy'
  if match($TERM, "screen*") != -1 || match($TERM, "xterm*") != -1
      set term=xterm-256color
      set t_Co=256 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
  endif
endif

"Abbreviations
ab rev Reviewed-by:

"YouCompleteMe
nnoremap y :YcmForceCompileAndDiagnostics
nnoremap pg :YcmCompleter GoToDefinitionElseDeclaration
nnoremap pd :YcmCompleter GoToDefinition
nnoremap pc :YcmCompleter GoToDeclaration

"Hightlight autocompletion window - modifying colors
highlight Pmenu ctermbg=DarkGrey ctermfg=LightGrey
highlight PmenuSel ctermbg=DarkGreen ctermfg=White
