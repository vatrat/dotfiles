" Vim-plug Plugin Setup
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'sjl/gundo.vim'
Plug 'klen/python-mode'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-dispatch'
call plug#end()

" Vim Hackery
set nocompatible
set laststatus=2
set t_CO=256

" Vim Option Setup
set number
set relativenumber
set showcmd
set autoindent
set copyindent
set tabstop=4
set shiftround
set smartcase
set history=1000
set undolevels=1000
set pastetoggle=,p
set updatetime=250
set shiftwidth=4
set incsearch
set notimeout

" Vim Color Setup
let g:solarized_termcolors=256
syntax enable
set background=dark
hi Normal ctermbg=none
hi Linenr ctermbg=none

" Movement Between Vim Windows
nmap ,h <C-W>h| " Move focus left
nmap ,l <C-W>l| " Move focus right
nmap ,j <C-W>j| " Move focus down
nmap ,k <C-W>k| " Move focus up
nmap ,H <C-W>H| " Move window left
nmap ,L <C-W>L| " Move window right
nmap ,J <C-W>J| " Move window down
nmap ,K <C-W>K| " Move window up

" Vim Window Size Changes
" All Windows
nmap ,= <C-W>=| " Make all windows equal-ish/symmetrical in size
" Current Window
nmap ,- <C-W>-| " Shrink vertically; horizontally; takes optional count
nmap ,+ <C-W>+| " Expand vertically; takes optional count
nmap ,_ <C-W>_| " Expand vertically as much as possible
nmap ,> <C-W><| " Shrink horizontally; takes optional count
nmap ,< <C-W>>| " Expand horizontally; takes optional count
nmap ,\| <C-W>\|| " Expand horizontally as much as possible
" Note: In the above command, "\|" is equivalent to '|', so type ",|" to use.

" Other Vim Window Movements
nmap ,w <C-W>w
nmap ,W <C-W>W
nmap ,t <C-W>t
nmap ,b <C-W>b
nmap ,p <C-W>p
nmap ,P <C-W>P
nmap ,r <C-W>r
nmap ,R <C-W>R
nmap ,x <C-W>x| " Exchange current window with next; takes optional count
nmap ,o <C-W>o

" Movement Between Vim Buffers
nmap ,fn :bnext<cr>
nmap ,fp :bprev<cr>

" Vim Command Shortcuts
nmap <silent> ,cv :vs ~/.vimrc<cr>| " Open vimrc in vsplit
nmap <silent> ,cx :vs ~/.xmonad/xmonad.hs<cr>| " Open xmonad.hs in vsplit
nmap <silent> ,q :source ~/.vimrc<cr>| " Re-load vimrc
nmap <silent> ,s :w<cr>| " Normal save
nmap  ,S :w !sudo tee % | " Force save with sudo
nmap <silent> ,x :q<cr>| " Normal quit
nmap <silent> ,X :q!<cr>| " Force quit
set pastetoggle=,:| " Toggle paste mode
nmap <silent> ,nh :new<cr>| " New file in split
nmap <silent> ,nv :vne<cr>| " New file in vsplit

" Vim-plug Command Mappings
nmap <silent> ,i :PlugInstall<cr>| " Run vim-plug installer
" Re-load vimrc, then run vim-plug installer
nmap <silent> ,I :source ~/.vimrc<cr> <bar> :PlugInstall<cr>

" Sidebar Toggle Mappings
nmap <silent> ,; :TagbarToggle<cr>| " Show/hide GUI tag list
nmap <silent> ,u :GundoToggle<cr>| " Show/hide GUI undo menu

" Emmet-vim Mappings
nmap <silent> ,, <C-y>,

" Fugitive Git Commands Setup
nnoremap ,ga :Git add %:p<CR><CR>
nnoremap ,gs :Gstatus<CR>
nnoremap ,gc :Gcommit -v -q<CR>
nnoremap ,gC :Git add %:p<CR><CR> <bar> :Gcommit -v -q<CR>
nnoremap ,gt :Gcommit -v -q %:p<CR>
nnoremap ,gd :Gdiff<CR>
nnoremap ,ge :Gedit<CR>
nnoremap ,gr :Gread<CR>
nnoremap ,gw :Gwrite<CR><CR>
nnoremap ,gL :silent! Glog<CR>:bot copen<CR>
nnoremap ,gg :Ggrep<Space>
nnoremap ,gm :Gmove<Space>
nnoremap ,gB :Git branch<Space>
nnoremap ,gb :Gblame<cr>
nnoremap ,gi :Gbrowse<cr>
nnoremap ,go :Git checkout<Space>
nnoremap ,gp :Gpush<CR>
nnoremap ,gl :Gpull<CR>

" Disable Arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" smooth_scroll Setup
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Airline Symbol Setup
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Syntastic Airline Setup
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Syntastic Setup
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
