" Rafael Robayna's vimrc

set nocompatible        " Use vim rather than vi settings
set shell=bash
set shellpipe=2>/dev/null>

" " Vundle Initialization
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Themes
Plugin 'Lucius'
Plugin 'obsidian'
Plugin 'simple-dark'
" Visual Enhancements
Plugin 'maciakl/vim-neatstatus'
Plugin 'airblade/vim-gitgutter'
Plugin 'trailing-whitespace'
Plugin 'vim-scripts/ShowMarks'
" Tools
Plugin 'The-NERD-tree'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'taglist.vim'
Plugin 'Mouse-Toggle'
Plugin 'vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'git-cheat'
"Plugin 'tomtom/tcomment_vim'
call vundle#end()
filetype plugin indent on

" " Configuration
syntax enable
"let mapleader=","       " Set the leader
let g:mapleader=","     " Set leader globally @needed?
set encoding=utf-8      " Set default encoding to utf-8
set ffs=unix,dos,mac    " Set unix as the standard file type
set number              " Enable line numbers
set hlsearch
set showmatch
set incsearch           " Incremental search
set ignorecase          " Ignore case with search
set smartcase
set lazyredraw          " Don't redraw while executing macros
set showcmd
set autoindent          " Auto indent
set history=500         " Extend history to 500
set splitright          " Opens vertical split right of current window
set splitbelow          " Opens horizontal split below current window
set expandtab
set noerrorbells        " Disable audible errors
set shiftwidth=4
set tabstop=4
set softtabstop=4
set laststatus=2        " Always show the status line
set backspace=2         " Fix delete/backspace behavior
set backspace=indent,eol,start

set wildmenu
set wildmode=list:longest,full

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set Default Colorscheme
try
    set background=dark
    colorscheme lucius
catch /^Vim\%((\a\+)\)\=:E185/
    set background=light
    colorscheme elflord
endtry

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" " Modified Mappings
map 0 ^

" " Keyboard Shortcuts
map <C-W>t :tabnew<CR>
map <C-S-Up> :tabnew<CR>
map <C-S-Right> :tabnext<CR>
map <C-S-Left> :tabprevious<CR>
nmap <leader>tt :Tlist<CR>
nmap <leader>ss :ShowMarksToggle<CR>
nmap <leader>nn :NERDTreeToggle<CR>
nmap <leader>d :bd<CR>
nmap <C-P> :CtrlPRoot<CR>
map <C-S-Down> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
nmap <leader>rc :e ~/.vimrc<CR>
nmap <leader>rr :source ~/.vimrc<CR>
nmap <leader>gc :tab help git-cheat<CR>
nmap <leader>bb :BufExplorer<CR>
nmap <leader>n :bn<CR>

" Open Scratchpad Buffer
map <leader>q :e ~/.scrachpad<CR>

" Execute current line in bash
nmap <F2> :.w !bash<CR>

" Execute current file in bash (must have correct permissions on disk)
nmap <F3> :! %:p

" Fuzzy - Set a prefix key [f]
nnoremap [fuzzy] <Nop>
nmap f [fuzzy]

" Unite Shortcuts
nnoremap <silent> [fuzzy]f :<C-u>UniteWithCurrentDir
\ -start-insert -winheight=25 -no-split -sync -buffer-name=files file_rec/async<CR>
nnoremap <silent> [fuzzy]r :<C-u>Unite
\ -start-insert -winheight=25 -no-split -auto-preview -buffer-name=outline outline<CR>
nmap <C-R> :Unite
\ -start-insert -winheight=25 -no-split -auto-preview -buffer-name=outline outline<CR>
nnoremap <silent> [fuzzy]b :<C-u>Unite
\ -winheight=20 -no-split -buffer-name=buffers buffer<CR>
nmap <leader>bb :Unite
\ -winheight=10 -no-split -buffer-name=buffers buffer<CR>
nnoremap <silent> [fuzzy]g :<C-u>Unite
\ -start-insert -winheight=25 -no-split -buffer-name=grep grep<CR>
nnoremap <silent> [fuzzy]w :<C-u>UniteWithCursorWord
\ -winheight=30 -buffer-name=grep grep<CR>
nnoremap <silent> [fuzzy]h :<C-u>Unite
\ -start-insert -no-split -buffer-name=recent file_mru<CR>

" " Plugin: taglist
let tlist_php_settings = 'php;f:functions'
let Tlist_WinWidth = 40
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1

" " Plugin: BufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerDetailedHelp=0
let g:bufExplorerFindActive=1
let g:bufExplorerShowTabBuffer=1
let g:bufExplorerSortBy='number'

" " Plugin: NERDtree
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc','\~$','\.swo$','\.swp$','\.hg','\.svn','\.bzr']

" " Plugin: Showmarks
let g:showmarks_enable=0
let g:showmarks_textlower="\t"
let g:showmarks_textupper=">"
let g:showmarks_textother=">"
let g:showmarks_hlline_lower=1
let g:showmarks_hlline_upper=0
let g:showmarks_hlline_other=0
