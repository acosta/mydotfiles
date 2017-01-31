call plug#begin('~/.local/share/nvim/plugged')
"Editor
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'townk/vim-autoclose'

"Color schemes
Plug 'tomasr/molokai'

"Git
Plug 'tpope/vim-fugitive'

"Syntax highlighting
Plug 'pangloss/vim-javascript'

"Autocomplete
Plug 'shougo/deoplete.nvim'
Plug 'othree/html5.vim'

"Syntax checking
Plug 'scrooloose/syntastic'

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set pastetoggle=<f6>
set noshowmode
set noswapfile
filetype plugin indent on
syntax on
colorscheme molokai
set background=dark
set number
set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0
set splitright
set clipboard=unnamedplus
set list
set listchars=tab:»·,trail:·,extends:…,nbsp:.
set ignorecase
set smartcase
set autoindent
set smartindent
set smarttab
set cursorline

"Enable 256 colors
set t_Co=256

"Highlight whitespaces
highlight WhitespaceEOL ctermbg=red ctermfg=white guibg=red guifg=white
match WhitespaceEOL /\s\+$/

"Hightlight autocompletion window - modifying colors
highlight Pmenu ctermbg=DarkGrey ctermfg=LightGrey
highlight PmenuSel ctermbg=DarkGreen ctermfg=White

"\n to turn off search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
"\l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>

"Tabs
"Open a new tab: Ctrl + t
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
"Close tab: Ctrl + c
:nmap <C-c> :tabclose<CR>
:imap <C-c> <Esc>:tabclose<CR>
"Go to next tab: Ctrl + right
:nmap . gt
":nmap <C-Right> :tabnext<CR>
":imap <C-Right> <Esc>:tabnext<CR>
"Go to previous tab: Ctrl + left
:nmap , gT
":nmap <C-Left> :tabprevious<CR>
":imap <C-Left> <ESC>:tabprevious<CR>
"You might use Ctrl + (PgUp+PgDn) also, if you are using one terminal's tab only

"Airline Options
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#neomake#error_symbol='✖ :'
let g:airline#extensions#neomake#warning_symbol='⚠ :'
let g:airline_theme='luna'

"Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

"Syntastic Options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_javascript_checkers = ['jshint']

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
