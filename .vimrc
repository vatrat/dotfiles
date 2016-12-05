"- Vatrat's .vimrc

"- Install vim-plug if not installed
if empty(glob("~/.vim/autoload/plug.vim"))
    if empty(glob("~/.vim"))
        execute '!mkdir ~/.vim'
        execute '!mkdir ~/.vim/autoload'
    elseif empty(glob("~/.vim/autoload"))
        execute '!mkdir ~/.vim/autoload'
    endif
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"- Vim-plug Plugin Setup
call plug#begin('~/.vim/plugged')
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'godlygeek/tabular'
Plug 'hlissner/vim-multiedit'
Plug 'kien/ctrlp.vim'
Plug 'klen/python-mode'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'metakirby5/codi.vim'
Plug 'reedes/vim-wordy'
Plug 'rosenfeld/conque-term'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sickill/vim-monokai'
Plug 'dikiaap/minimalist'
Plug 'KeitaNakamura/neodark.vim'
Plug 'w0ng/vim-hybrid'
call plug#end()

"- Vim Hackery
set nocompatible
set laststatus=2
set clipboard=unnamedplus
set diffopt+=vertical| " Make Fugitive's :Gsdiff behave
set updatetime=250| " Make gitgutter update regularly
set ttimeoutlen=0| " Fix esc key delay 
set hidden

"- Vim Option Setup
" Line number
set number
set relativenumber
" On-screen cues
set showcmd
set noshowmode| " Use Airline instead
" Indentation
set autoindent
set copyindent
set shiftround
" Search Setup
set smartcase
set incsearch
" Tab setup (tab=4spaces)
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
" Turn off bells and screen flashing
set noerrorbells
set visualbell
set t_vb=
" History and Undo Setup
set undolevels=1000
set history=1000


"- Movement Between Vim Windows
nmap ,h <C-W>h| " Move focus left
nmap ,l <C-W>l| " Move focus right
nmap ,j <C-W>j| " Move focus down
nmap ,k <C-W>k| " Move focus up
nmap ,H <C-W>H| " Move window left
nmap ,L <C-W>L| " Move window right
nmap ,J <C-W>J| " Move window down
nmap ,K <C-W>K| " Move window up

"- Vim Window Size Changes
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

"- Other Vim Window Movements
nmap ,r <C-W>r
nmap ,R <C-W>R
nmap ,x <C-W>x| " Exchange current window with next; takes optional count
nmap ,o <C-W>o

"- Movement Between Vim Buffers
nmap ,fn :bnext<cr>
nmap ,fp :bprev<cr>
nmap ,fd :bdelete<cr>

"- Vim Command Shortcuts
" Config shortcuts
nmap <silent> ,cv :vs ~/.vimrc<cr>| " Open .vimrc in vsplit
nmap <silent> ,q :source ~/.vimrc<cr>| " Re-load .vimrc
nmap <silent> ,cx :vs ~/.xmonad/xmonad.hs<cr>| " Open xmonad.hs in vsplit
nmap <silent> ,ct :vs ~/.tmux.conf<cr>| " Open .tmux.conf in vsplit
nmap <silent> ,cb :vs ~/.bashrc<cr>| " Open .bashrc in vsplit
" Save
nmap <silent> ,s :w<cr>| " Normal save
nmap  ,S :w !sudo tee %<cr>| " Force save with sudo
" Quit
nmap <silent> ,x :q<cr>| " Normal quit
nmap <silent> ,X :q!<cr>| " Force quit
set pastetoggle=,:| " Toggle paste mode
" Open File
nmap ,e :e | " Edit specific file
nmap <silent> ,nh :new<cr>| " New file in split
nmap <silent> ,nv :vne<cr>| " New file in vsplit


"- Vim-plug Command Mappings
nmap <silent> ,i :PlugInstall<cr>| " Run vim-plug installer
" Re-load vimrc, then run vim-plug installer
nmap <silent> ,I :source ~/.vimrc<cr> <bar> :PlugInstall<cr>

"- Sidebar Toggle Mappings
nmap <silent> ,; :TagbarToggle<cr>| " Show/hide GUI tag list
nmap <silent> ,u :GundoToggle<cr>| " Show/hide GUI undo menu

" Conque Term Mappings
nmap <silent> .h. :ConqueTermSplit bash<cr><cr>| " New file in split
nmap <silent> .v. :ConqueTermVSplit bash<cr><cr>| " New file in vsplit
nmap <silent> .. :ConqueTerm bash<cr><cr>| " Open bash in current window
nmap <silent> .r :ConqueTerm bash<cr>| " Open bash in current window

"- Emmet-vim Mappings
nmap <silent> -- <C-y>,
nmap <silent> -d <C-y>d
nmap <silent> -D <C-y>D
nmap <silent> -n <C-y>n
nmap <silent> -N <C-y>N
nmap <silent> -m <C-y>m
nmap <silent> -k <C-y>k
nmap <silent> -j <C-y>j

"- NERDTree Mappings
nmap <silent> ,' :NERDTree<cr> 

"- Fugitive Git Command Mappings
nnoremap ,ga :Git add %:p<CR><CR>
nnoremap ,gs :Gstatus<CR>
nnoremap ,gc :Gcommit -v -q<CR>
nnoremap ,gC :Git add %:p<CR><CR> <bar> :Gcommit -v -q<CR>
nnoremap ,gt :Gcommit -v -q %:p<CR>
nnoremap ,gd :Gdiff<CR>
nnoremap ,gvd :Gsdiff<CR>
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

"- Wordy Command Mappings
" (Nothing here for now)

"- Disable Arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"- Smooth Scroll Setup
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"- Vim Color Setup
syntax on
let g:neodark#use_256color = 1
set background=dark
colorscheme neodark
" hi Normal ctermbg=none
" hi Linenr ctermbg=none
" hi VertSplit cterm=none ctermfg=014 ctermbg=003

"- Airline Symbol Setup
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'

 " Tmuxline Setup
let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '>',
      \ 'right' : '',
      \ 'right_alt' : '<',
      \ 'space' : ' '}

"- Syntastic Airline Setup
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

"- Syntastic Setup
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 '

"- NERDTree Setup
let g:NERDTreeWinPos = "right"

"- Vim-Obsession Setup
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

"- Modes
" Word Processor Mode
func! WordProcessorMode() 
    setlocal formatoptions=1 
    setlocal noexpandtab 
        setlocal spell spelllang=en_us 
    " set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
    setlocal complete+=s
    setlocal formatprg=par
    setlocal wrap 
    setlocal linebreak
    map j gj 
    map k gk
endfu 
com! WP call WordProcessorMode()
