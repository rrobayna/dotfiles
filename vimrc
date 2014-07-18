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
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'Mouse-Toggle'
Plugin 'ctrlp.vim'
Plugin 'vimwiki'
Plugin 'bufexplorer.zip'
Plugin 'fugitive.vim'
Plugin 'vim-airline'
Plugin 'vim-gitgutter'
"Plugin 'vim-bufferline'
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
map <leader>tt :Tlist<CR>
map <leader>nn :NERDTreeToggle<CR>
map <leader>bb :BufExplorer<CR>
map <leader>rc :e ~/.vimrc<CR>
map <leader>rr :source ~/.vimrc<CR>  


" " Plugin: taglist
let tlist_php_settings = 'php;f:functions'
let Tlist_WinWidth = 40
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
let rlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1


" " Plugin: BufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerDetailedHelp=0
let g:bufExplorerFindActive=1
let g:bufExplorerShowTabBuffer=1
let g:bufExplorerSortBy='number'


" Plugin: NERDtree
let NERDTreeChDirMode = 0
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']


