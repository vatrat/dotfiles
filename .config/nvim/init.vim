"- Vatrat's init.vim
" To open this file when using this config,
" type ',cv' without the quotes. To see a list
" of key mappings, type ',;' without the quotes.
" (You must install ctags to use the map list)
" Type ',l' until the rightmost pane is selected,
" then type 'o' on the 'maps' line. As your
" cursor goes over each line in 'maps', the line
" that binds that map will be shown at the bottom
" left of the window.

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
" Appearance
" Plug 'KeitaNakamura/neodark.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'morhetz/gruvbox'
" Tmux Integration
Plug 'christoomey/vim-tmux-navigator'
" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
" Editing
Plug 'hlissner/vim-multiedit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'junegunn/rainbow_parentheses.vim'
" Word Processing
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
" Autocompletion and Snippets
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Code Linting
Plug 'neomake/neomake'
" Programming Extensions
Plug 'bitc/vim-hdevtools'
Plug 'sheerun/vim-polyglot'
" Programming Setups
Plug 'klen/python-mode'
Plug 'metakirby5/codi.vim'
" Fuzzy Finding and Subsitution
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-abolish'
" Vim Extensions
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'neovim/python-client'
" Sidebars
Plug 'majutsushi/tagbar'| ", { 'on': 'TagbarToggle' }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
" Session Management
Plug 'tpope/vim-obsession'
Plug 'floobits/floobits-neovim'
call plug#end()

"- Vim Hackery
" set nocompatible| " no longer needed in Neovim
set laststatus=2| " Have statusline always on
set clipboard=unnamedplus| " Use system clipboard
set diffopt+=vertical| " Make Fugitive's :Gsdiff behave
set updatetime=250| " Make gitgutter update more often
set ttimeoutlen=0| " Fix esc key delay 
set hidden| " Make buffers persist in the background
let g:pymode_rope = 0| " Fix massive delay from deoplete_jedi
" This delay is caused when using deoplete_jedi's suggestions
" when python-mode is also installed. This issue is still
" open on github:
" https://github.com/davidhalter/jedi-vim/issues/163

"- Vim Option Setup
" Line number
set number| " Turn on line numbers
set relativenumber| " Make line numbers relative to cursor
set cursorline| " Highlight the currenty selected line
" On-screen cues
set showcmd| " Show letters as they're typed
set noshowmode| " Use Airline instead
" Pane setup
set splitright| "
" Indentation
set autoindent| "
set copyindent| "
set shiftround| "
set foldmethod=indent " by default, fold using indentation
set nofoldenable " don't fold by default
set foldlevel=0 " if fold everything if 'foldenable' is set
" Search Setup
set smartcase| "
set incsearch| "
set inccommand=nosplit| " Setup for Live Subsitution
" Tab setup (tab=4spaces)
set tabstop=4| "
set softtabstop=0| "
set expandtab| "
set shiftwidth=4| "
set smarttab| "
" Turn off bells and screen flashing
set noerrorbells| "
set visualbell| "
set t_vb=| "
" History and Undo Setup
set undolevels=1000| "
set undodir=~/.vim/undodir| "
set undofile| "
set history=1000| "
" Go between screen lines, not actual lines
noremap j gj| "
noremap k gk| 


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
nnoremap ,r <C-W>r| " 
nnoremap ,R <C-W>R| " 
" nnoremap ,x <C-W>x| " Exchange current window with next; takes optional count
nnoremap ,o <C-W>o| " View only current pane

"- Movement Between Vim Buffers
nnoremap <silent> ;. :bnext<cr>| " Move next buffer to current pane
nnoremap <silent> ;, :bprev<cr>| " Move previous buffer to current pane
nnoremap <silent> ;/ :bdelete<cr>| " Close current buffer completely

" Movement Between Vim Tabs
nnoremap <silent> ;l :tabnew<cr>| " Open and switch to a new tab to the right
nnoremap <silent> ;L :-tabnew<cr>| " Open and switch to a new tab to the left
nnoremap <silent> ;' :tabclose<cr>| " Close current tab
nnoremap <silent> ;] :tabnext<cr>| " Move to next tab
nnoremap <silent> ;[ :tabprev<cr>| " Move to previous tab
nnoremap <silent> ;} :tabmove +<cr>| " Swap current tab right
nnoremap <silent> ;{ :tabmove -<cr>| " Swap current tab left
nnoremap <silent> ;+ :tabmove $<cr>| " Swap current tab all the way right
nnoremap <silent> ;- :tabmove 0<cr>| " Swap current tab all the way left

"- Remap comma and semicolon
nnoremap + ;| " Find next instance of f or t match
nnoremap _ ,| " Find previous instance of f or t match

"- Search Mappings
nnoremap <silent> ,/ :let @/ = ''<cr>| " Clear current search

"- Vim Command Mappings
" Config Mappings
nnoremap <silent> ,cv :e ~/.config/nvim/init.vim<cr>| " Open init.vim in vsplit
nnoremap <silent> ,q :source ~/.config/nvim/init.vim<cr>| " Re-load init.vim
nnoremap <silent> ,cx :e ~/.xmonad/xmonad.hs<cr>| " Open xmonad.hs in vsplit
nnoremap <silent> ,ct :e ~/.tmux.conf<cr>| " Open .tmux.conf in vsplit
nnoremap <silent> ,cb :e ~/.bashrc<cr>| " Open .bashrc in vsplit
nnoremap <silent> ,cp :e ~/.ps1rc<cr>| " Open .ps1rc in vsplit
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
" Autoscroll
" Press ctrl-c to stop scrolling
nmap <silent> ,aS <C-E>M0:sleep 2400m<CR>,aS| " Very slow autoscroll
nmap <silent> ,as <C-E>M0:sleep 1600m<CR>,as| " Slow autoscroll
nmap <silent> ,ad <C-E>M0:sleep 800m<CR>,ad| " Medium autoscroll
nmap <silent> ,af <C-E>M0:sleep 400m<CR>,af| " Fast autoscroll
nmap <silent> ,aF <C-E>M0:sleep 200m<CR>,aF| " Very fast autoscroll
nmap <silent> ,ax <C-E>M0:sleep 100m<CR>,ax| " Extremely fast autoscroll
nmap <silent> ,aX <C-E>M0:sleep 50m<CR>,aX| " Very extremely fast autoscroll

"- Vim-plug Command Mappings
nnoremap <silent> ,i :PlugUpdate<cr>| " Run vim-plug updater
" Re-load init.vim then run vim-plug updater
nnoremap <silent> ,I :source ~/.config/nvim/init.vim<cr> <bar> :PlugUpdate<cr>

"- Sidebar Toggle Mappings
nnoremap <silent> ,; :TagbarToggle<cr>| " Show/hide GUI tag list
nnoremap <silent> ,u :GundoToggle<cr>| " Show/hide GUI undo menu

"- Neosnippet Mappings
" function! s:neosnippet_complete()
"   if pumvisible()
"     return "\<c-n>"
"   else
"     if neosnippet#expandable_or_jumpable() 
"       return "\<Plug>(neosnippet_expand_or_jump)"
"     endif
"     return "\<tab>"
"   endif
" endfunction

" imap <expr><TAB> <SID>neosnippet_complete()

"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand)" : "\<TAB>"

"- NERDTree Mappings
nnoremap <silent> ,' :NERDTreeToggle<cr> | " 
nnoremap <silent> ," :NERDTreeTabsToggle<cr> | " 
" let g:NERDTreeDirArrowExpandable = '-'
" let g:NERDTreeDirArrowCollapsible = '+'

"- Fugitive Git Command Mappings
nnoremap ,ga :Git add %:p<CR><CR>| " Git add current file
nnoremap ,gA :Git add .<CR><CR>| " 
nnoremap ,gs :Gstatus<CR>| " Git status in a horizontal split
nnoremap ,gc :Gcommit -v -q<CR>| " 
nnoremap ,gC :Gcommit -v -q %:p<CR>| " Git add current file and commit
nnoremap ,gd :Gdiff<CR>| " Opens git diff splits
nnoremap ,gvd :Gsdiff<CR>| " 
nnoremap ,ge :Gedit<CR>| " 
nnoremap ,gr :Gread<CR>| " 
nnoremap ,gw :Gwrite<CR><CR>| " 
nnoremap ,gL :silent! Glog<CR>:bot copen<CR>| " 
nnoremap ,gg :Ggrep<Space>| " 
nnoremap ,gm :Gmove<Space>| " 
nnoremap ,gB :Git branch<Space>| " 
nnoremap ,gb :Gblame<cr>| " 
nnoremap ,gi :Gbrowse<cr>| " 
nnoremap ,go :Git checkout<Space>| " Prompt for Git branch to checkout
nnoremap ,gp :Gpush<CR>| " Git push (Not working in neovim?)
nnoremap ,gl :Gpull<CR>| " Git pull

"- Neovim Terminal Mappings
if has('nvim')
    :tnoremap <Esc> <C-\><C-n>| " 
endif

"- Wordy Command Mappings
" (Nothing here for now)

"- Disable Arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"- Vim Color Setup
syntax on
let g:neodark#use_256color = 1
colorscheme gruvbox
set background=dark
" let g:gruvbox_contrast_dark = "soft"
highlight CursorLineNr ctermbg=none
highlight SignColumn ctermbg=none

" Rainbow Parentheses Setup
" Rainbow Parentheses Color Setup
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" Rainbow Parentheses autocmd setup
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline_theme='gruvbox'

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
set ssop-=options| " do not store global and local values in a session
set ssop-=folds| " do not store folds

if has('nvim')
    "- Deoplete Setup
    call deoplete#enable()

    "- Neomake Setup
    let g:neomake_open_list = 2
    let g:neomake_python_enabled_makers = ['flake8']
    let g:neomake_haskell_enabled_makers = ['ghc-mod', 'hdevtools', 'hlint']
    augroup neomake_cmd| " Autocommand group for Neomake
        " Since autocmds are added each time init.vim
        " is sourced, clear on load to prevent duplicate
        " autocmds.
        autocmd!
        " Run Neomake on buffer save and enter
        autocmd BufWritePost,BufEnter *.* Neomake
        " Run Neomake when leaving insert mode
        " autocmd InsertLeave *.* update | Neomake
        " Run Neomake when text changes
        " autocmd InsertChange,TextChanged *.* update | Neomake
    augroup END
endif

"- Modes
" Word Processor Mode
func! WordProcessorMode() 
    setlocal formatoptions=1 
    setlocal noexpandtab 
    setlocal spell spelllang=en_us 
    setlocal complete+=s
    setlocal formatprg=par
    setlocal wrap 
    setlocal tw=79 
    setlocal linebreak
    :Wordy weak
    :Goyo
endfu 
com! WP call WordProcessorMode()

func! NoteTakingMode() 
    setlocal formatoptions=1 
    setlocal noexpandtab 
    setlocal spell spelllang=en_us 
    setlocal complete+=s
    setlocal formatprg=par
    setlocal wrap 
    setlocal tw=79 
    setlocal linebreak
    :Goyo
endfu 
com! NT call NoteTakingMode()
" Mode Mappings
nnoremap <silent> ,mn :call NoteTakingMode()<cr>
nnoremap <silent> ,mw :call WordProcessorMode()<cr>
