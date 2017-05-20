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

" Todo:
"    Learn and/or set up plugins
"       ('*' = important):
"     vim-wordy
"     vim-pencil
"     spell (not a plugin but still important; :h spell)
"     neosnippet.vim
"     python-mode
"   * fzf.vim
"   * vim-obsession
"     floobits
"   * abolish
"     denite
"     vim-taskwarrior
"     split-term
"     vimterm
"     ctrlspace
"     vim-move
"     

"- Install vim-plug if not installed
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
if !has('python3')
    execute '!sudo pip3 install neovim'
endif
if !has('python3')
    execute '!sudo pip3 install neovim'
endif
" if empty(glob("~/.config/nvim/autoload/plug.vim"))
    " execute '!./~/setup.sh'
" endif

"- Vim-plug Plugin Setup
call plug#begin('~/.config/nvim/plugged')
" Appearance
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
" Tmux Integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'chemzqm/vim-easygit'
Plug 'chemzqm/denite-git'
Plug 'mhinz/vim-signify'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'matze/vim-move'
" Plug 'vim-expand-region'
Plug 'tpope/vim-speeddating'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'junegunn/rainbow_parentheses.vim'
" Word Processing
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Autocompletion and Snippets
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Linting
Plug 'neomake/neomake'
" Plug 'ludovicchabant/vim-gutentags'
" Programming Extensions
Plug 'bitc/vim-hdevtools'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'PeterRincker/vim-argumentative'
Plug 'Olical/vim-syntax-expand'
" Programming Setups
Plug 'klen/python-mode'
Plug 'metakirby5/codi.vim'
" Fuzzy Finding and Subsitution
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Vim Extensions
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'neovim/python-client'
Plug 'Shougo/denite.nvim'
" Terminal Emulator Extensions
Plug 'vimlab/split-term.vim'
Plug 'wvffle/vimterm'
" Sidebars
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
" Session Management
Plug 'tpope/vim-obsession'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'floobits/floobits-neovim'
" Alternative Uses
" Plug 'blindFS/vim-taskwarrior'
call plug#end()

"- Vim Hackery
set laststatus=2          | " Have statusline always on
set clipboard=unnamedplus | " Use system clipboard
set diffopt+=vertical     | " Make Fugitive's :Gsdiff behave
set updatetime=250        | " Make gitgutter update more often
set ttimeoutlen=0         | " Fix esc key delay
set hidden                | " Make buffers persist in the background
let g:pymode_rope=0       | " Fix massive delay from deoplete_jedi
" This delay is caused when using deoplete_jedi's suggestions
" when python-mode is also installed. This issue is still
" open on github:
" https://github.com/davidhalter/jedi-vim/issues/163

"- Vim Option Setup
" Line number
set number                 | " Turn on line numbers
set relativenumber         | " Make line numbers relative to cursor
set cursorline             | " Highlight the currenty selected line
" On-screen cues
set showcmd                | " Show letters as they're typed
set noshowmode             | " Use Airline instead
" Pane setup
set splitright             | " Make vertical splits open to the right
set splitbelow             | " Make horiontal splits open to the bottom
" Indentation
set autoindent             | " Autoindent when creating a new line
set copyindent             | "
set shiftround             | "
set foldmethod=indent      | " by default, fold using indentation
set nofoldenable           | " don't fold by default
set foldlevel=0            | " if fold everything if 'foldenable' is set
" Search Setup
set smartcase              | "
set incsearch              | "
set inccommand=nosplit     | " Setup for Live Subsitution
" Tab setup (tab=4spaces)
set tabstop=4              | "
set softtabstop=0          | "
set expandtab              | "
set shiftwidth=4           | "
set smarttab               | "
" Turn off bells
set noerrorbells           | " Try to disable error bells
set visualbell             | " Use visual bell instead of a beep
set t_vb=                  | " Set visual bell action to no action
" History and Undo Setup
set undolevels=99999       | " Set max number of undo actions saved
set undodir=~/.vim/undodir | " Set directory to store undo files
set undofile               | " Make undo history persistent
set history=1000           | "
noremap <C-ScrollWheelUp>   :redo<cr>
noremap <C-ScrollWheelDown> :undo<cr>
" Go between screen lines, not actual lines
" noremap j gj| "
" noremap k gk| "

"- Map Leader Keys
" map , <Leader2>| " Start at 2 to prevent plugin conflicts
" map ; <Leader3>
" map <Space> <Leader4>

"- Movement Between Vim Panes
nnoremap ,h <C-W>h| " Move focus left
nnoremap ,l <C-W>l| " Move focus right
nnoremap ,j <C-W>j| " Move focus down
nnoremap ,k <C-W>k| " Move focus up
nnoremap ,H <C-W>H| " Move pane left
nnoremap ,L <C-W>L| " Move pane right
nnoremap ,J <C-W>J| " Move pane down
nnoremap ,K <C-W>K| " Move pane up

"- Vim Pane Size Changes
" All Panes
nnoremap ,=  <C-W>=  | " Make all panes equal-ish/symmetrical in size
" Current Pane
nnoremap ,-  <C-W>-  | " Shrink vertically; horizontally; takes optional count
nnoremap ,+  <C-W>+  | " Expand vertically; takes optional count
nnoremap ,_  <C-W>_  | " Expand vertically as much as possible
nnoremap ,>  <C-W><  | " Shrink horizontally; takes optional count
nnoremap ,<  <C-W>>  | " Expand horizontally; takes optional count
nnoremap ,\| <C-W>\| | " Expand horizontally as much as possible
" Note: In the above command, "\|" is equivalent to '|', so type ",|" to use.

"- Other Vim Pane Movements
nnoremap ,r <C-W>r | "
nnoremap ,R <C-W>R | "
nnoremap ,w <C-W>x | " Exchange current pane with next; takes optional count
nnoremap ,o <C-W>o | " View only current pane

" Open panes
nnoremap          ,e :e        | " Edit specific file
nnoremap <silent> ,hn :new<cr> | " New file in split
nnoremap <silent> ,vn :vne<cr> | " New file in vsplit

" Open Help
nnoremap          ;h :tab help  | " Open help in new tab
nnoremap          ;H :-tab help | " Open help in new tab

"- Neovim Terminal Mappings
tnoremap <Esc> <C-\><C-n> | " Use escape key to exit terminal input
nnoremap <silent> ,t :call vimterm#toggle()<cr><C-\><C-n>
nnoremap <silent> ,vt :VTerm<cr>
nnoremap <silent> ,ht :Term<cr>
nnoremap <silent> ;t :tab :term<cr>
nnoremap <silent> ;T :-tab :term<cr>

"- Movement Between Vim Buffers
nnoremap <silent> ;. :bnext<cr>    | " Move next buffer to current pane
nnoremap <silent> ;, :bprev<cr>    | " Move previous buffer to current pane
nnoremap <silent> ;/ :bdelete<cr>  | " Close current buffer completely
nnoremap <silent> ;? :bdelete!<cr> | " Force close current buffer completely

" Movement Between Vim Tabs
nnoremap <silent> ;l :tabnew<cr>    | " Open and switch to a new tab to the right
nnoremap <silent> ;L :-tabnew<cr>   | " Open and switch to a new tab to the left
nnoremap <silent> ;' :tabclose<cr>  | " Close current tab
nnoremap <silent> ;] :tabnext<cr>   | " Move to next tab
nnoremap <silent> ;[ :tabprev<cr>   | " Move to previous tab
nnoremap <silent> ;} :tabmove +<cr> | " Swap current tab right
nnoremap <silent> ;{ :tabmove -<cr> | " Swap current tab left
nnoremap <silent> ;+ :tabmove $<cr> | " Swap current tab all the way right
nnoremap <silent> ;- :tabmove 0<cr> | " Swap current tab all the way left

"- Remap comma and semicolon
nnoremap + ;| " Find next instance of f or t match
nnoremap _ ,| " Find previous instance of f or t match

"- Vim-sneak Mappings
nmap <expr> + sneak#is_sneaking() ? '<Plug>Sneak_;' : ';'
nmap <expr> _ sneak#is_sneaking() ? '<Plug>Sneak_,' : ','
" Replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" Replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

"- Editing Mappings
" Vim-multiple-cursors mappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key = '<C-m>'
let g:multi_cursor_prev_key = '<C-l>'
let g:multi_cursor_skip_key = '<C-M>'
let g:multi_cursor_quit_key = '<Esc>'
" unmap enter, which is set by this plugin?
" nunmap <CR>
" xunmap <CR>
" nunmap <CR> <CR>
" xunmap <CR> <CR>

"- Vim-expand-region Mappings
let g:expand_region_text_objects = {
    \ 'iw'  :0,
    \ 'iW'  :0,
    \ 'i"'  :0,
    \ 'i''' :0,
    \ 'il'  :0,
    \ 'ip'  :0,
    \ 'ie'  :0,
    \ }

" nnoremap <space>. <Plug>(expand_region_expand)
" nnoremap <space>, <Plug>(expand_region_shrink)

"- Search Mappings
nnoremap <silent> ,/ :let @/ = ''<cr>| " Clear current search

"- Vim Command Mappings
" Config Mappings
nnoremap <silent> ,cv :tabnew<cr><bar>:e ~/.config/nvim/init.vim<cr>      | " Open init.vim in new tab
nnoremap <silent> ,q                  :source ~/.config/nvim/init.vim<cr> | " Re-load init.vim in new tab
nnoremap <silent> ,cx :tabnew<cr><bar>:e ~/.xmonad/xmonad.hs<cr>          | " Open xmonad.hs in new tab
nnoremap <silent> ,ct :tabnew<cr><bar>:e ~/.tmux.conf<cr>                 | " Open .tmux.conf in new tab
nnoremap <silent> ,cb :tabnew<cr><bar>:e ~/.bashrc<cr>                    | " Open .bashrc in new tab
nnoremap <silent> ,cp :tabnew<cr><bar>:e ~/.ps1rc<cr>                     | " Open .ps1rc in new tab
nnoremap <silent> ,cs :tabnew<cr><bar>:e ~/.setup.sh<cr>                  | " Open .ps1rc in new tab
nnoremap <silent> ,Cv :e ~/.config/nvim/init.vim<cr>                      | " Open init.vim
nnoremap <silent> ,Cx :e ~/.xmonad/xmonad.hs<cr>                          | " Open xmonad.hs
nnoremap <silent> ,Ct :e ~/.tmux.conf<cr>                                 | " Open .tmux.conf
nnoremap <silent> ,Cb :e ~/.bashrc<cr>                                    | " Open .bashrc
nnoremap <silent> ,Cp :e ~/.ps1rc<cr>                                     | " Open .ps1rc
nnoremap <silent> ,Cs :e ~/.setup.sh<cr>                                  | " Open .ps1rc
" Save
nnoremap <silent> ,s :w<cr>             | " Normal save
nnoremap          ,S :w !sudo tee %<cr> | " Force save with sudo
" Quit
nnoremap <silent> ,x :q<cr>     | " Normal quit
nnoremap <silent> ;x :qall!<cr> | " Normal quit all
nnoremap <silent> ,X :q!<cr>    | " Force quit
nnoremap <silent> ;X :qall<cr>  | " Force quit all
nnoremap <silent> ,z :x<cr>     | " Save and quit
" Toggle Paste Mode
set pastetoggle=,:
" Autoscroll
" Press ctrl-c to stop scrolling
" Down
nmap <silent> ,aS <C-E>M0:sleep 2400m<CR>,aS | " Very slow autoscroll
nmap <silent> ,as <C-E>M0:sleep 1600m<CR>,as | " Slow autoscroll
nmap <silent> ,ad <C-E>M0:sleep  800m<CR>,ad | " Medium autoscroll
nmap <silent> ,af <C-E>M0:sleep  400m<CR>,af | " Fast autoscroll
nmap <silent> ,aF <C-E>M0:sleep  200m<CR>,aF | " Very fast autoscroll
nmap <silent> ,ax <C-E>M0:sleep  100m<CR>,ax | " Extremely fast autoscroll
nmap <silent> ,aX <C-E>M0:sleep   50m<CR>,aX | " Very extremely fast autoscroll
nmap <silent> ,az <C-E>M0:sleep   25m<CR>,aX | " Zuper very extremely fast autoscroll
nmap <silent> ,aZ <C-E>M0:sleep   12m<CR>,aX | " Really zuper very extremely fast autoscroll
" Up
nmap <silent> ,AS <C-Y>M0:sleep 2400m<CR>,AS | " Very slow autoscroll, up
nmap <silent> ,As <C-Y>M0:sleep 1600m<CR>,As | " Slow autoscroll, up
nmap <silent> ,Ad <C-Y>M0:sleep  800m<CR>,Ad | " Medium autoscroll, up
nmap <silent> ,Af <C-Y>M0:sleep  400m<CR>,Af | " Fast autoscroll, up
nmap <silent> ,AF <C-Y>M0:sleep  200m<CR>,AF | " Very fast autoscroll, up
nmap <silent> ,Ax <C-Y>M0:sleep  100m<CR>,Ax | " Extremely fast autoscroll, up
nmap <silent> ,AX <C-Y>M0:sleep   50m<CR>,AX | " Very extremely fast autoscroll, up
nmap <silent> ,Az <C-Y>M0:sleep   25m<CR>,AX | " Zuper very extremely fast autoscroll, up
nmap <silent> ,AZ <C-Y>M0:sleep   12m<CR>,AX | " Really zuper very extremely fast autoscroll, up

"- Vim-plug Command Mappings
nnoremap <silent> ,i :PlugUpdate<cr> | " Run vim-plug updater
" Re-load init.vim then run vim-plug updater
nnoremap <silent> ,I :source ~/.config/nvim/init.vim<cr> <bar> :PlugUpdate<cr>

"- Sidebar Toggle Mappings
nnoremap <silent> ,; :TagbarToggle<cr> | " Show/hide GUI tag list
nnoremap <silent> ,u :GundoToggle<cr>  | " Show/hide GUI undo menu

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

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"- NERDTree Mappings
nnoremap <silent> ,' :NERDTreeToggle<cr>     | "
nnoremap <silent> ," :NERDTreeTabsToggle<cr> | "
" let g:NERDTreeDirArrowExpandable = '-'
" let g:NERDTreeDirArrowCollapsible = '+'

"- Fugitive Git Command Mappings
nnoremap <silent> ,ga :Git add %:p<CR><CR>            | " Git add current file
nnoremap <silent> ,gA :Git add .<CR><CR>              | "
nnoremap <silent> ,gs :Gstatus<CR>                    | " Git status in a horizontal split
nnoremap <silent> ,gc :Gcommit -v -q<CR>              | "
nnoremap <silent> ,gC :Gcommit -v -q %:p<CR>          | " Git add current file and commit
nnoremap <silent> ,gd :Gdiff<CR>                      | " Opens git diff splits
nnoremap <silent> ,gvd :Gsdiff<CR>                    | "
nnoremap <silent> ,ge :Gedit<CR>                      | "
nnoremap <silent> ,gr :Gread<CR>                      | "
nnoremap <silent> ,gw :Gwrite<CR><CR>                 | "
nnoremap <silent> ,gL :silent! Glog<CR>:bot copen<CR> | "
nnoremap <silent> ,gg :Ggrep<Space>                   | "
nnoremap <silent> ,gm :Gmove<Space>                   | "
nnoremap <silent> ,gB :Git branch<Space>              | "
nnoremap <silent> ,gb :Gblame<cr>                     | "
nnoremap <silent> ,gi :Gbrowse<cr>                    | "
nnoremap <silent> ,go :Git checkout<Space>            | " Prompt for Git branch to checkout
nnoremap <silent> ,gp :Gpush<CR>                      | " Git push (Not working in neovim?)
nnoremap <silent> ,gl :Gpull<CR>                      | " Git pull

"- Wordy Command Mappings
" (Nothing here for now)

"- Disable Arrow keys
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>

"- Vim Color Setup
syntax on

" let g:neodark#use_256color = 1
" let g:seoul256_background = 235
colorscheme gruvbox "seoul256
set background=dark
highlight CursorLineNr ctermbg=none
highlight SignColumn   ctermbg=none

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
let g:airline_symbols.paste  = 'ρ'
let g:airline_symbols.paste  = 'Þ'

"- Airline Setup
let g:airline#extensions#tmuxline#enabled               = 1
let g:airline#extensions#tabline#enabled                = 1
let g:airline#extensions#tabline#tab_min_count          = 2
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#bufferline#enabled             = 0
let g:airline_theme                                     = 'gruvbox'

"- Tmuxline Setup
let g:tmuxline_separators = {
      \ 'left'      : ''   ,
      \ 'left_alt'  : '>'  ,
      \ 'right'     : ''   ,
      \ 'right_alt' : '<'  ,
      \ 'space'     : ' '   }

"- NERDTree Setup
let g:NERDTreeWinPos = "right"

"- Vim-Obsession Setup
set ssop-=options| " do not store global and local values in a session
set ssop-=folds| " do not store folds

"- Deoplete Setup
" let g:deoplete#sources = ['buffer', 'tag']
let g:deoplete#enable_at_startup = 1


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

func! GermanWordProcessorMode() 
    setlocal formatoptions=1 
    setlocal fo+=t
    setlocal noexpandtab 
    setlocal spell spelllang=de
    setlocal complete+=s
    setlocal formatprg=par
    setlocal wrap 
    setlocal tw=79 
    " setlocal linebreak
    " :Wordy weak
    :Goyo
endfu 

func! NoteTakingMode() 
    setlocal formatoptions=1 
    setlocal fo+=t
    setlocal noexpandtab 
    setlocal spell spelllang=en_us
    setlocal complete+=s
    setlocal formatprg=par
    setlocal wrap 
    setlocal tw=79 
    " setlocal linebreak
    setl fo=aw2tq
    " inoremap <buffer> <enter> <enter>- 
    inoremap <buffer> <tab> <esc>>>A
    nnoremap <buffer> <tab> >>$
    nnoremap <buffer> o o- 
    :Goyo
    let g:limelight_conceal_ctermfg = 'gray'
    :Limelight
endfu 
" Mode Mappings
nnoremap <silent> ,mn :call NoteTakingMode()<cr>
nnoremap <silent> ,mw :call WordProcessorMode()<cr>
nnoremap <silent> ,mg :call GermanWordProcessorMode()<cr>
