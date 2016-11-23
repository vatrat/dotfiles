"Plugin Setup
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

"Hackery
set nocompatible
set laststatus=2
set t_CO=256

"Option Setup
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

"Color Setup
let g:solarized_termcolors=256
syntax enable
set background=dark
hi Normal ctermbg=none
hi Linenr ctermbg=none

"Movement Between Windows
nmap ,h <C-W>h
nmap ,l <C-W>l
nmap ,j <C-W>j
nmap ,k <C-W>k
nmap ,H <C-W>H
nmap ,L <C-W>L
nmap ,J <C-W>J
nmap ,K <C-W>K

"Window Size Changes
nmap ,= <C-W>=
nmap ,- <C-W>-
nmap ,+ <C-W>+
nmap ,_ <C-W>_
nmap ,, <C-W>>
nmap ,. <C-W><

"Other Window Movements
nmap ,w <C-W>w
nmap ,W <C-W>W
nmap ,t <C-W>t
nmap ,b <C-W>b
nmap ,p <C-W>p
nmap ,P <C-W>P
nmap ,r <C-W>r
nmap ,R <C-W>R
nmap ,x <C-W>x
nmap ,o <C-W>o

" Movement Between Buffers
nmap ,fn :bnext<cr>
nmap ,fp :bprev<cr>

" Command Shortcuts
nmap <silent> ,cv :vs ~/.vimrc<cr>
nmap <silent> ,cx :vs ~/.xmonad/xmonad.hs<cr>
nmap <silent> ,q :source ~/.vimrc<cr>
nmap <silent> ,s :w<cr>
nmap  ,S :w !sudo tee % >/dev/null
nmap <silent> ,i :PlugInstall<cr>
nmap <silent> ,I :source ~/.vimrc<cr> <bar> :PlugInstall<cr>
nmap <silent> ,x :q<cr>
nmap <silent> ,X :q!<cr>
nmap <silent> ,; :TagbarToggle<cr>
nmap <silent> ,u :GundoToggle<cr>
set pastetoggle=,:
nmap <silent> ,nh :new<cr>
nmap <silent> ,nv :vne<cr>

" Git Commands Setup (Fugitive Plugin)
nnoremap ,ga :Git add %:p<CR><CR>
nnoremap ,gs :Gstatus<CR>
nnoremap ,gc :Gcommit -v -q<CR>
nnoremap ,gt :Gcommit -v -q %:p<CR>
nnoremap ,gd :Gdiff<CR>
nnoremap ,ge :Gedit<CR>
nnoremap ,gr :Gread<CR>
nnoremap ,gw :Gwrite<CR><CR>
nnoremap ,gl :silent! Glog<CR>:bot copen<CR>
nnoremap ,gP :Ggrep<Space>
nnoremap ,gm :Gmove<Space>
nnoremap ,gB :Git branch<Space>
nnoremap ,gb :Gblame<cr>
nnoremap ,gi :Gbrowse<cr>
nnoremap ,go :Git checkout<Space>
nnoremap ,gp :Dispatch! git push<CR>
nnoremap ,gL :Dispatch! git pull<CR>

"Disable Arrow Keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Smooth Scrolling Setup
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"Airline Font Setup
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
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

" Syntastic Setup
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
