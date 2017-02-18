" Don't load plugins if we aren't in Vim7
if version < 700
    set  noloadplugins
endif

call plug#begin('~/.vim/plugged')
"Editor
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'townk/vim-autoclose'
Plug 'gregsexton/matchtag'
Plug 'docunext/closetag.vim'
Plug 'Chiel92/vim-autoformat'

"Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"Color schemes
Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'
Plug 'fneu/breezy'
Plug 'crusoexia/vim-monokai'

"Git
Plug 'tpope/vim-fugitive'

"Syntax highlighting
Plug 'ap/vim-css-color'
Plug 'othree/yajs.vim'

"Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'othree/html5.vim'

"Syntax checking
Plug 'scrooloose/syntastic'

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

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
set termguicolors
colorscheme molokai

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
set tabstop=2 shiftwidth=2 expandtab
set smarttab
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.so,*.lo,.svn,.git,CVS,*.a,*.class,*.jpg,*.png,*.gif,*.edj,*.la,moc_*,qrc_*
set wildmenu                 " Autocomplete features in the status bar
set wildmode=list:longest,full
set nobackup
set textwidth=100
set nowrap
set dir=~/tmp
set laststatus=2             " Always show statusline, even if only 1 window
set pastetoggle=<f6>
set noswapfile
set history=100              " 100 lines of history
set showfulltag              " Show more information while completing tags
set foldmethod=syntax        " By default, use syntax to determine folds
set foldlevelstart=99        " All folds open by default
set completeopt-=preview
set shortmess+=a             " Use [+] [RO] [w] for modified, read-only, modified
set report=0                 " Notify me whenever any lines have changed
set confirm                  " Y-N-C prompt if closing with unsaved changes
set mousemodel=extend        " Enable search with Shift+click
set list
set listchars=tab:»·,trail:·,extends:…,nbsp:.
set cursorline
set splitright
set clipboard+=unnamedplus

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
:nmap . gt
":nmap <C-Right> :tabnext<CR>
":imap <C-Right> <Esc>:tabnext<CR>
" Go to previous tab: Ctrl + left
:nmap , gT
":nmap <C-Left> :tabprevious<CR>
":imap <C-Left> <ESC>:tabprevious<CR>
" You might use Ctrl + (PgUp+PgDn) also, if you are using one terminal's tab only

" Highlight chars that go over the 80-column limit
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength '\%81v.*'

"Highlight whitespaces
highlight WhitespaceEOL ctermbg=red ctermfg=white guibg=red guifg=white
match WhitespaceEOL /\s\+$/

"Vim-session
let g:session_autosave = 'no'

"Abbreviations
ab rev Reviewed-by:

"Hightlight autocompletion window - modifying colors
highlight Pmenu ctermbg=DarkGrey ctermfg=LightGrey
highlight PmenuSel ctermbg=DarkGreen ctermfg=White

"Enable 256 colors
set t_Co=256

"Enable CUDA syntax highlight
au BufNewFile,BufRead *.cu set ft=cu

"Enable QML syntax highlight
au BufNewFile,BufRead *.qml set ft=qml

"Airline Options
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#neomake#error_symbol='✖ :'
let g:airline#extensions#neomake#warning_symbol='⚠ :'
let g:airline_theme='luna'

if has("autocmd")
"Jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

"Trim whitespace onsave
  autocmd FileType c,cpp,java,php,html,javascript,css,python,sh autocmd BufWritePre <buffer> %s/\s\+$//e

endif

"Syntastic Options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['htmlhint']

"NERDTree Options
map <C-n> :NERDTreeToggle<CR>

"Molokai color scheme
let g:molokai_original = 1

"NerdCommenter Options
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"Deoplete Options
let g:deoplete#enable_at_startup = 1

"Close Tags Options
:let g:closetag_html_style = 1
