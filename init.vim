" Plugin Management -----------------------------------------------------------
" -----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')"

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion' "Faster Movement
Plug 'rhysd/devdocs.vim' "Quick Doc Access
Plug 'kien/ctrlp.vim' "Fuzzy Browsing
Plug 'mileszs/ack.vim' "Ack Integration
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " Load NerdTree on Demand
Plug 'tpope/vim-fugitive' " Git support for airline
Plug 'Shougo/deoplete.nvim' " Autocomplete
Plug 'ervandew/supertab' " tab based autocomplete
Plug 'airblade/vim-gitgutter' " git status signs
Plug 'benekastah/neomake' " Async makeprg
Plug 'milkypostman/vim-togglelist' " Toggle Quickfix and Locationlist
Plug 'jiangmiao/auto-pairs' " auto close pairs

" Syntax Plugins
Plug 'tpope/vim-markdown'
Plug 'hail2u/vim-css3-syntax'
Plug 'rust-lang/rust.vim'
Plug 'groenewege/vim-less'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'cespare/vim-toml'

call plug#end()


" Plugin Configuration --------------------------------------------------------
" -----------------------------------------------------------------------------
let g:ackprg = 'ack -s -H --nogroup --nocolor --column' " Ack

" Nerd Tree
let NERDTreeIgnore = ['\.pyc$', '\.h\.gch$', '\.o$', '^node_modules$', '^bower_components$']
let NERDTreeShowBookmarks=1
let NERDTreeShowBookmarks=1
let g:clipbrdDefaultReg=1
set wildignore+=*.o,*.obj " ignore these filetypes

" Control P
let g:ctrlp_max_depth = 20
let g:ctrlp_max_files = 10000
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|public$\|build$\|node_modules$\|\.svn$|\.src$|__pycache__$',
    \ 'file': '\.git.*\|\.exe$\|\.so$\|\.o$\|\.ghc$',
    \ }

" Use deoplete with smartcase
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Use Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
"let g:SuperTabMappingForward = '<S-tab>'
"let g:SuperTabMappingBackward = '<tab>'

" Airline
let g:airline_theme = "durant"

" Disable default togglelist bindings
let g:toggle_list_no_mappings = "true"

" Git Gutter
let g:gitgutter_sign_column_always = 1
"let g:gitgutter_sign_added = "++"
"let g:gitgutter_sign_modified = "~~"
"let g:gitgutter_sign_removed = "--"
"let g:gitgutter_sign_removed_first_line = "^^"
"let g:gitgutter_sign_modified_removed = "mr"

" Setup Airline to use Powerline fonts
let g:airline_powerline_fonts = 1

" Automatically open error list after neomake build
let g:neomake_open_list = 2
let g:neomake_logfile=$HOME.'/.config/nvim/log/neomake.log'
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
" General Configuration -------------------------------------------------------
" -----------------------------------------------------------------------------

set updatetime=250

" Colorscheme
set background=dark
colorscheme symfony

" Line Numbers
set number

" Syntax and FT
syntax enable
filetype plugin on

" Clipboard
set clipboard=unnamedplus
let g:clipbrdDefaultReg = '+'

" Smart tabbing / autoindenting
set undolevels=1000 " More undo history please
set autoindent " Apply auto indenting if avaialble
set virtualedit=all " Allow to edit in-place anywhere, even on blank lines
set nostartofline " During movement, try to stay on the same column even on empty lines

" UI
set laststatus=2 " Statusline setup
set scrolloff=4 " Keep 4 lines top/bottom when scrolling
set hidden " ingore background buffers with changes
set fillchars="" " Don't show fill characters in V-split separators
set shortmess+=Iat " Skip intro message, abbreviate most other message and truncate if required

" Disable error bells and flashing
set noerrorbells
set visualbell

" No backups please, we got git after all
set nobackup
set nowb
set noswapfile

" Characters / Tabs / Spaces / Indentation
"set enc=utf-8 " Default encoding is UTF-8
set listchars=tab:▸\ ,eol:¬ " Show tab and eol chars
set smarttab " activate smarttabs
set shiftwidth=4 " when auto-indenting, indent by this much
set tabstop=4 " expand tabs to 4 spaces
set expandtab " turn tabkeypresses into spaces
set softtabstop=4 " treate tabkey as 4 spaces but respect hard hard tabs

set nowrap " No automatic wrapping
set equalalways " Automatically resize split windows to have the same aspect
set mouse=n " Allow mouse ONLY in normal mode (since you can scroll any window on gnome without focussing it)
set cc=80 " Yes. I like it that way.
set backspace=eol,start,indent " Make backspace jump over all charaters, can also be done via "set backspace=2"

" Search and Highlighting
set wrapscan " Automatically search from the top if nothing is found
set magic
set showmatch " Show matches
set hlsearch " Highlight search
set incsearch " Apply search pattern on each keystroke
set ignorecase  " Ignore casing by default
set smartcase " Require casing in case any upper case character is in the pattern

" Folding
set nofoldenable "dont fold by default
set foldmethod=indent "fold based on indent
set foldnestmax=1 "deepest fold is 10 levels
set foldlevel=1 "this is just what i use

" All other options
set lazyredraw " Don't redraw while in macros

" Command line completion options
set wildmenu " Enable auto complete
"set wildmode=list:longest,full "show all, select longest first

" Spelling dict file
set spellfile=~/.config/nvim/dict.add


" Mappings --------------------------------------------------------------------
" -----------------------------------------------------------------------------

" ESC is aweful to hit, Shift+3 (paragraph) is way more convinient on a GER layout
noremap! <silent> § <ESC>
vnoremap <silent> § <ESC>
snoremap <silent> § <ESC>
tnoremap <silent> § <C-\><C-n>

" Remap sharp S to insert opening and closing braces with indent and cursor
" placed between them
inoremap ß {<CR>}<ESC>ko

" Inserting blank lines is useful too
nnoremap <silent> <c-o> o<ESC>k

" Make ü a shortcut for :
nnoremap ü :

" Command T and syntastic Error list
nmap <silent> <C-o> :CtrlPBuffer<CR>
nnoremap <silent> <C-e> :call ToggleLocationList()<CR>

" Speedier movements
nnoremap <silent> <S-k> 3k
vnoremap <silent> <S-k> 3k
nnoremap <silent> <S-j> 3j
vnoremap <silent> <S-j> 3j

" I always manage to hit these at random, so fix / ignore it
nnoremap <silent> + <nop>
command! W w
command! E e

" Quicker selects
nmap Ü viB
nmap Ä vi]

" Remap umlauts for fast insertion of common characters
imap ö [
imap ä {
inoremap Ö -><ESC>a

inoremap <C-X><C-F> <C-O>:lcd %:p:h<CR><C-X><C-F>

" Don't loose selection when indenting or outdenting
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
" use nmap otherwise insert mode with snipmate breaks on n / N / *
" it also centers the window on the search when using either n or N
nmap N Nzz
nmap n nzz
nmap * *N

" F Key Mappings
nnoremap <silent> <F4> :nohl<CR>
nnoremap <silent> <F4> :nohl<CR>
nnoremap <silent> <F5> :GundoToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :so ~/.config/nvim/init.vim<CR>

" Automatically highlight the cursorline when changing windows / buffers
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWinEnter * setlocal cursorline
autocmd BufWinLeave * setlocal nocursorline

" Get rid of the window command prefix making navigation a lot faster
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Allow navigation from terminal in insert mode
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Strip trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()

" Leader key stuff
let mapleader = ","

" ,f ,w etc
"let g:EasyMotion_leader_key = '<Leader>'
map <Leader> <Plug>(easymotion-prefix)

" Close buffer fully
nmap <silent> <Leader>bd :bd!<CR>

"map q <Nop>
nmap <silent> <Leader>q <C-w>c<CR>
nmap <silent> <Leader>m '
nmap <silent> <Leader>q @
nmap <silent> <Leader>s :nohl<CR>

" Join via <leader> J (since J already got remapped for faster navigation)
vmap <silent> <Leader>J :join<CR>

" DevDocs
nmap Z <Plug>(devdocs-under-cursor)


" Macros ----------------------------------------------------------------------
" -----------------------------------------------------------------------------

" JS Related
fun! RunNoirTestFile()
    execute "! grunt env:mock noir:mock:".expand('%:p')
endfun

fun! RunNoirTestLine()
    execute "! grunt env:mock noir:mock:".expand('%:p').":".line(".")
endfun

nmap <silent> <Leader>i :call InfoJS()<CR>
nmap <silent> <Leader>rf :call RunNoirTestFile()<CR>
nmap <silent> <Leader>rl :call RunNoirTestLine()<CR>
nmap <Leader>m :make<CR>


" Filetype related settings ---------------------------------------------------
" -----------------------------------------------------------------------------
autocmd Filetype jade setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
"autocmd! BufWritePost *.rs NeomakeProject cargo

