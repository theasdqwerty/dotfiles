let mapleader = " "

" ---------- Main settings ----------
set history=1000
set showcmd
set scrolloff=5
set sidescrolloff=5
set number relativenumber
set incsearch
set ignorecase
set smartcase
set hlsearch
set nrformats-=octal
set clipboard=unnamedplus
set mouse=a
set encoding=utf-8
set wildmenu

set nocompatible

imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" ---------- Blackhole ----------
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" ---------- Config reload ----------
nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap \r :source ~/.vimrc<CR>

" ---------- Navigation ----------
nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>
nnoremap tu :only<CR>
nnoremap tc :tabclose<CR>
nnoremap tC :tabonly<CR>
nnoremap to :tabonly<CR>
nnoremap tm :tabmove<CR>
nnoremap tv :vsplit<CR>
nnoremap ts :split<CR>
nnoremap th <C-w>h
nnoremap tl <C-w>l
nnoremap tj <C-w>j
nnoremap tk <C-w>k

nnoremap gf <C-]>                  " Goto definition (тэги)
nnoremap gb <C-T>                  " Back
nnoremap gj <C-o>                  " Jump to last change

" ---------- Scrolling ----------
nnoremap zH 50zh
nnoremap zL 50zl

" ---------- Search ----------
map <c-r> :CtrlPMRU<CR>            " Recent files (CtrlP)
map <c-/> :grep<CR>
map <c-a> :CtrlP<CR>               " GotoAction → CtrlP
map <c-f> :CtrlP<CR>
map <c-s> :TagbarToggle<CR>        " File structure
map <c-o> :CtrlPLine<CR>           " GotoSymbol
map <c-c> :CtrlPBuffer<CR>         " GotoClass → buffers
map <c-l> :jumps<CR>               " Recent locations

" ---------- Tool windows ----------
nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap <leader>1 :NERDTreeToggle<CR>
nnoremap <leader>x :only<CR>

" ---------- Терминал ----------
nnoremap <leader>t :terminal<CR>

" ---------- Cursor shape & layout switching ----------

" Терминальные настройки (для Alacritty и др.)
let &t_SI = "\e[6 q"   " Insert mode — vertical bar
let &t_SR = "\e[4 q"   " Replace mode — underline
let &t_EI = "\e[2 q"   " Normal mode — block

call plug#begin('~/.vim/plugged')

" Базовые улучшения
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-highlightedyank'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'

" Навигация по коду
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

" Визуальные улучшения
Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'

" Автоматическое переключение раскладки
Plug 'lyokha/vim-xkbswitch'

call plug#end()
" ---------- Настройки плагинов ----------

" NERDTree
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" EasyMotion
nmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)
nmap s <Plug>(easymotion-s)

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Тема (ayu — современная, но можешь оставить gruvbox/molokai)
set termguicolors
let ayucolor = "dark"
colorscheme ayu

" Включаем matchit (для % с HTML/XML и т.д.)
packadd matchit

" Включаем поддержку мыши (уже было выше, но продублировал по твоему запросу)
set mouse=a

" ---------- Дополнительно ----------
set whichwrap=b,s,<,>,[,]
set splitright
set splitbelow

" ---------- Настройка vim-xkbswitch (переключение раскладки) ----------
" Включить плагин
let g:XkbSwitchEnabled = 1

" Установить английскую раскладку для Normal режима
let g:XkbSwitchNLayout = 'us'

" Установить русскую раскладку для Insert режима (по желанию)
let g:XkbSwitchILayout = 'ru'

let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
