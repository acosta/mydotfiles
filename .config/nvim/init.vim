call plug#begin('~/.local/share/nvim/plugged')
"Editor
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'townk/vim-autoclose'
Plug 'gregsexton/matchtag'
Plug 'docunext/closetag.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'yggdroot/indentline'
Plug 'vim-scripts/a.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'TaDaa/vimade'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter'

"Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/DoxygenToolkit.vim'

"Color schemes
Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'
Plug 'fneu/breezy'
Plug 'crusoexia/vim-monokai'
Plug 'ayu-theme/ayu-vim'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Syntax highlighting
Plug 'ap/vim-css-color'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'othree/html5.vim'

"Syntax checking
Plug 'scrooloose/syntastic'
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

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
syntax enable
"colorscheme molokai
let ayucolor="mirage"
colorscheme ayu
set background=dark
set number
set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0
set splitright
set clipboard+=unnamedplus
set list
set listchars=tab:»·,trail:·,extends:…,nbsp:.
set ignorecase
set smartcase
set autoindent
set smartindent
set smarttab
set cursorline
set mouse=a
set mousemodel=extend
set updatetime=250
set splitbelow

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

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

"Buffers
:map <[b> :bprevious<CR>
:map <]b> :bnext<CR>
:map <C-w> :bdelete<CR>

"Airline Options
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = "\u33c7"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#buffer_idx_mode = 1
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
let g:syntastic_cpp_cppcheck_args = "--enable=all --std=c++11 --language=c++"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args='--max-line-length=120'

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
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif   "automatically close the method preview window
let g:deoplete#sources#jedi#show_docstring = 1

"Close Tags Options
let g:closetag_html_style = 1

"indentLine Options
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 0
map <C-i> :IndentLinesToggle<CR>

"Emmet Options
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"EditorConfig Options
let g:EditorConfig_verbose=1

"Vim-Session Options
set sessionoptions-=buffers   "Don't save hidden and unloaded buffers in sessions.
let g:session_directory = "~/.vim/sessions"
let g:session_autosave = "no"
let g:session_autoload = "no"

"Change the type of separator line (vertical line)
set fillchars+=vert:│

"Prettier Options
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 100
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#parser = 'flow'
map <C-f> :PrettierAsync<CR>

" isort Options
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

" Moving lines using Ctrl+j (down) or Ctrl+k (up)
" The mappings work in normal, insert and visual modes
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Autoformat Options
noremap <F3> :Autoformat<CR>
let g:clang_format#code_style = 'WebKit'
let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#enable_fallback_style = 0
let g:clang_format#auto_format = 1
let g:clang_format#code_style = 'webkit'

let g:snipMate = { 'snippet_version' : 1 }

lua require('acosta.telescope')
lua require('acosta.treesitter')
