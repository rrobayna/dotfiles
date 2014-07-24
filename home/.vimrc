" Rafael Robayna's vimrc

set nocompatible
set shell=bash						" @checkNeeded
set shellpipe=2>/dev/null>			" @checkNeeded

" " Get The OS Type
let os = substitute(system('uname'), "\n", "", "")

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
Plugin 'vim-scripts/ShowMarks'
Plugin 'trailing-whitespace'
" Vim Vocabulary Enhancements
Plugin 'tpope/vim-unimpaired'
"Plugin 'tpope/vim-surround'		" @test
"" Tools
Plugin 'The-NERD-tree'
Plugin 'Mouse-Toggle'
Plugin 'tpope/vim-fugitive'
Plugin 'vimwiki'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'taglist.vim'
"Plugin 'tomtom/tcomment_vim'		" @test
" Help Tools
Plugin 'git-cheat'
call vundle#end()
filetype plugin indent on

" " Configuration
syntax enable
let mapleader=","				" Set the leader
set encoding=utf-8				" Set default encoding to utf-8
set nolist						" Set list characters off on load
set lcs=tab:▸\ ,trail:·			" Set the lcs tab and trail char
set lcs+=eol:¬					" Set the lcs end of line char
set lcs+=precedes:<				" Set the lcs precedes char
set lcs+=extends:>				" Set lcs char
set lcs+=nbsp:%					" Set lcs char
set ffs=unix,dos,mac			" Set unix as the standard file type
set number						" Line Numbers
set hlsearch					" Highlight Search
set showmatch					" Show matching bracket
set incsearch					" Incremental search
set ignorecase					" Ignore case with search
set smartcase					" Allow search case matching
set lazyredraw					" Don't redraw while executing macros
set showcmd						" Display command as used
set autoindent					" Auto indent
set history=500					" Extend history to 500
set splitright					" Opens vertical split right of current window
set splitbelow					" Opens horizontal split below current window
set noexpandtab
set noerrorbells				" Disable audible errors
set shiftwidth=4
set tabstop=4
set softtabstop=4
set laststatus=2				" Always show the status line
set backspace=2					" Fix delete/backspace behavior
set backspace=indent,eol,start

" Set External File Browser for OS X
if os == "Darwin"
	let g:netrw_browsex_viewer='open'
endif

" Set Encryption Method
set cryptmethod=blowfish

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Enhanced wildmenu: Display long list on first tab and nav menu on second
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

" " Shortcuts: Commands
command! Reload source ~/.vimrc
command! FTabs %retab!
"command! FWhitespace %s/\s\+$//
command! CheatGit tab help git-cheat
command! CheatVim !open http://www.viemu.com/vi-vim-cheat-sheet.gif

" " Modified Mappings
map 0 ^

" " Keyboard Shortcuts
map <C-W>t :tabnew<CR>
map <C-S-Up> :tabnew<CR>
map <C-S-Right> :tabnext<CR>
map <C-S-Left> :tabprevious<CR>
map <C-S-Down> :NERDTreeToggle<CR>
nmap <leader>ss :ShowMarksToggle<CR>
nmap <leader>tt :Tlist<CR>

" Quick Access to vimrc
nmap <leader>rc :e ~/.vimrc<CR>

" Open Scratchpad Buffer
map <leader>q :e ~/.scrachpad<CR>

" Execute current line in bash
nmap <F2> :.w !bash<CR>

" Execute current file in bash (must have correct permissions on disk)
nmap <F3> :! %:p

" Fuzzy - Define prefix combo [Ctrl-f]
nnoremap [fuzzy] <Nop>
nmap <C-f> [fuzzy]

" " Shortcuts: Unite
" Fuzzy File Search with Async Load
nnoremap <silent> [fuzzy]f :<C-u>UniteWithCurrentDir
\ -start-insert -winheight=25 -no-split -sync -buffer-name=files file_rec/async<CR>
nnoremap <silent> <leader>ff :<C-u>UniteWithCurrentDir
\ -start-insert -winheight=25 -no-split -sync -buffer-name=files file_rec/async<CR>
" Unite Outline
nnoremap <silent> [fuzzy]r :<C-u>Unite
\ -start-insert -winheight=25 -no-split -auto-preview -buffer-name=outline outline<CR>
nmap <C-R> :Unite
\ -start-insert -winheight=25 -no-split -auto-preview -buffer-name=outline outline<CR>
" Unite Buffers
nnoremap <silent> [fuzzy]b :<C-u>Unite
\ -winheight=20 -no-split -buffer-name=buffers buffer<CR>
nmap <leader>bb :Unite
\ -winheight=10 -no-split -buffer-name=buffers buffer<CR>
" Unite Grep
nnoremap <silent> [fuzzy]g :<C-u>Unite
\ -start-insert -winheight=25 -no-split -buffer-name=grep grep<CR>
nnoremap <silent> [fuzzy]w :<C-u>UniteWithCursorWord
\ -winheight=30 -buffer-name=grep grep<CR>
" Unite recent files
nnoremap <silent> [fuzzy]h :<C-u>Unite
\ -start-insert -no-split -buffer-name=recent file_mru<CR>


" " Plugin: NERDtree
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 0
let NERDTreeIgnore = ['\.pyc','\~$','\.swo$','\.swp$','\.hg','\.svn','\.bzr']

" " Plugin: Showmarks
let g:showmarks_enable=0
let g:showmarks_textlower="\t"
let g:showmarks_textupper=">"
let g:showmarks_textother=">"
let g:showmarks_hlline_lower=1
let g:showmarks_hlline_upper=0
let g:showmarks_hlline_other=0

" " Plugin: taglist
let tlist_php_settings = 'php;f:functions'
let Tlist_WinWidth = 40
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
