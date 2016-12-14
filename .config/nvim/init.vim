"- Vatrat's init.vim

"- Install vim-plug if not installed
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
if !has('python3')
    execute '!sudo pip3 install neovim'
endif
if !has('python')
    execute '!sudo pip2 install neovim'
endif

"- Vim-plug Plugin Setup
call plug#begin('~/.config/nvim/plugged')
Plug 'KeitaNakamura/neodark.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'floobits/floobits-neovim'
Plug 'godlygeek/tabular'
Plug 'hlissner/vim-multiedit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kien/ctrlp.vim'
Plug 'klen/python-mode'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
Plug 'reedes/vim-wordy'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
set undodir=~/.vim/undodir
set undofile
set history=1000
" Setup for Live Subsitution
set inccommand=nosplit


"- Movement Between Vim Windows
nnoremap ,h <C-W>h| " Move focus left
nnoremap ,l <C-W>l| " Move focus right
nnoremap ,j <C-W>j| " Move focus down
nnoremap ,k <C-W>k| " Move focus up
nnoremap ,H <C-W>H| " Move window left
nnoremap ,L <C-W>L| " Move window right
nnoremap ,J <C-W>J| " Move window down
nnoremap ,K <C-W>K| " Move window up

"- Vim Window Size Changes
" All Windows
nnoremap ,= <C-W>=| " Make all windows equal-ish/symmetrical in size
" Current Window
nnoremap ,- <C-W>-| " Shrink vertically; horizontally; takes optional count
nnoremap ,+ <C-W>+| " Expand vertically; takes optional count
nnoremap ,_ <C-W>_| " Expand vertically as much as possible
nnoremap ,> <C-W><| " Shrink horizontally; takes optional count
nnoremap ,< <C-W>>| " Expand horizontally; takes optional count
nnoremap ,\| <C-W>\|| " Expand horizontally as much as possible
" Note: In the above command, "\|" is equivalent to '|', so type ",|" to use.

"- Other Vim Window Movements
nnoremap ,r <C-W>r
nnoremap ,R <C-W>R
nnoremap ,x <C-W>x| " Exchange current window with next; takes optional count
nnoremap ,o <C-W>o

"- Movement Between Vim Buffers
nnoremap <silent> ;n :bnext<cr>
nnoremap <silent> ;p :bprev<cr>
nnoremap <silent> ;d :bdelete<cr>

" Remap comma and semicolon
nnoremap + ;| " Find next instance of f or t match
nnoremap _ ,| " Find previous instance of f or t match

"- Vim Command Shortcuts
" Config shortcuts
nnoremap <silent> ,cv :vs ~/.config/nvim/init.vim<cr>| " Open init.vim in vsplit
nnoremap <silent> ,q :source ~/.config/nvim/init.vim<cr>| " Re-load init.vim
nnoremap <silent> ,cx :vs ~/.xmonad/xmonad.hs<cr>| " Open xmonad.hs in vsplit
nnoremap <silent> ,ct :vs ~/.tmux.conf<cr>| " Open .tmux.conf in vsplit
nnoremap <silent> ,cb :vs ~/.bashrc<cr>| " Open .bashrc in vsplit
nnoremap <silent> ,cp :vs ~/.ps1rc<cr>| " Open .ps1rc in vsplit
" Save
nnoremap <silent> ,s :w<cr>| " Normal save
nnoremap  ,S :w !sudo tee %<cr>| " Force save with sudo
" Quit
nnoremap <silent> ,x :q<cr>| " Normal quit
nnoremap <silent> ,X :q!<cr>| " Force quit
nnoremap <silent> ,z :x<cr>| " Save and quit
" Toggle Paste Mode
set pastetoggle=,:| " Toggle paste mode
" Open File
nnoremap ,e :e | " Edit specific file
nnoremap <silent> ,nh :new<cr>| " New file in split
nnoremap <silent> ,nv :vne<cr>| " New file in vsplit

"- Vim-plug Command Mappings
nnoremap <silent> ,i :PlugUpdate<cr>| " Run vim-plug installer
" Re-load init.vim then run vim-plug installer
nnoremap <silent> ,I :source ~/.config/nvim/init.vim<cr> <bar> :PlugUpdate<cr>

"- Sidebar Toggle Mappings
nnoremap <silent> ,; :TagbarToggle<cr>| " Show/hide GUI tag list
nnoremap <silent> ,u :GundoToggle<cr>| " Show/hide GUI undo menu

"- Emmet-vim Mappings
nnoremap <silent> -- <C-y>,
nnoremap <silent> -d <C-y>d
nnoremap <silent> -D <C-y>D
nnoremap <silent> -n <C-y>n
nnoremap <silent> -N <C-y>N
nnoremap <silent> -m <C-y>m
nnoremap <silent> -k <C-y>k
nnoremap <silent> -j <C-y>j

"- NERDTree Mappings
nnoremap <silent> ,' :NERDTree<cr> 

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

" Neovim Terminal Mappings
if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
endif

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
highlight Normal ctermbg=234
highlight Normal ctermbg=234
" For some reason, if next to 'colorscheme...', this line has no effect.
" Command is added twice; the first does nothing, and serves as a
" separator from 'colorscheme...', the second does its job.
" And, no, putting the 'CursorlineNr' between 'Colorscheme...' and
" this line doesn't work.
highlight CursorLineNr ctermbg=none
highlight SignColumn ctermbg=234

"- Airline Symbol Setup
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'

"- Airline Setup
let g:airline#extensions#tmuxline#enabled = 1
" The colors of this airline theme are slightly different
" than those of the default neodark ariline theme. They have
" higher contrast, so I like them more.
let g:airline_theme='neodark'
" For some reason, when I reload my init.vim the neodark
" bundled airline theme takes over, even though the
" airline theme pack one is loaded on startup.
" Running ':AirlineRefresh' switches to the airline
" theme pack theme.
if !has('vim_starting')
    AirlineRefresh
endif

"- Tmuxline Setup
let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '>',
      \ 'right' : '',
      \ 'right_alt' : '<',
      \ 'space' : ' '}

"- NERDTree Setup
let g:NERDTreeWinPos = "right"

"- Vim-Obsession Setup
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

if has('nvim')
    "- Deoplete Setup
    call deoplete#enable()

    "- Neomake Setup
    let g:neomake_open_list = 2
    let g:neomake_python_enabled_makers = ['flake8']
    autocmd BufWritePost,BufEnter * Neomake
    autocmd InsertLeave * update | Neomake
    autocmd InsertChange,TextChanged * update | Neomake
endif

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
