set nocompatible            
syntax enable
filetype on
filetype plugin indent on    
let mapleader = ","
set number
set hlsearch
set showmatch
set incsearch
set ignorecase
set autoindent
set history=1000
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" " Vundle Initialization 
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'Vundle.vim'
"" ColorSchemes
Plugin 'Lucius'
Plugin 'Zenburn'
Plugin 'molokai'
Plugin 'wombat256.vim'
"" Plugins
Plugin 'ctrlp.vim'
Plugin 'fugitive.vim'
Plugin 'Mouse-Toggle'
Plugin 'The-NERD-tree'
Plugin 'bufexplorer.zip'
Plugin 'taglist.vim'
Plugin 'vim-airline'
Plugin 'vim-bufferline'
Plugin 'vim-gitgutter'
Plugin 'vimwiki'
"Plugin 'ShowMarks'
call vundle#end()            " required


" " Set DefualtColorscheme
set background=dark
colorscheme lucius

" " Keyboard Shortcuts
map <C-t> :tabnew<CR>
map <D-k> :tabnext<CR>
map <D-j> :tabprevious<CR>
map <D-/> :tabclose<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <Leader>tt :taglist<CR>
map <Leader>nn :NERDTreeToggle<CR>
map <Leader>bb :BufExplorer<CR>

" " Plugin: BufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerDetailedHelp=0
let g:bufExplorerFindActive=1
let g:bufExplorerShowTabBuffer=1
let g:bufExplorerSortBy='number'


" Plugin: NERDtree
" autocmd vimenter * NERDTree
"let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
"let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
"let NERDTreeKeepTreeInNewTab=1
"let g:nerdtree_tabs_open_on_gui_startup=1
