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
Plugin 'Zenburn'
Plugin 'molokai'
Plugin 'wombat256.vim'
" Visual Enhancements
Plugin 'maciakl/vim-neatstatus'
Plugin 'airblade/vim-gitgutter'
Plugin 'trailing-whitespace'
Plugin 'vim-scripts/ShowMarks'
" Tools
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'taglist.vim'
Plugin 'Mouse-Toggle'
Plugin 'vimwiki'
Plugin 'fugitive.vim'
"Plugin 'tomtom/tcomment_vim'
"Plugin 'The-NERD-tree'
call vundle#end()
filetype plugin indent on

" " Configuration
syntax enable
let mapleader=","       " Set the leader
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
map <C-S-Up> :tabnew<CR>
map <C-S-Right> :tabnext<CR>
map <C-S-Left> :tabprevious<CR>
map <C-S-C> :tabclose<CR>
nmap <leader>tt :Tlist<CR>
"map <C-S-Down> :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>
"nmap <leader>nn :NERDTreeToggle<CR>
nmap <leader>rc :e ~/.vimrc<CR>
nmap <leader>rr :source ~/.vimrc<CR>

" Open Scratchpad Buffer
map <leader>q :e ~/.scrachpad<CR>

" Execute current line in bash
nmap <F2> :.w !bash<CR> 

" Execute current file in bash (must have correct permissions on disk)
nmap <F3> :! %:p

" Unite - Set a prefix key [f] 
nnoremap [unite] <Nop>
nmap f [unite]

" Unite Shortcuts used f+
nnoremap <silent> [unite]f :<C-u>UniteWithCurrentDir
\ -start-insert -buffer-name=files file_rec<CR>
nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
\ -start-insert -buffer-name=buffers buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite
\ -start-insert -buffer-name=recent file_mru<CR>
nnoremap <silent> [unite]o :<C-u>Unite 
\ -start-insert -buffer-name=outline outline<CR>

nmap <C-R> :Unite -start-insert -buffer-name=outline outline<CR>

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
"let NERDTreeChDirMode = 0
"let NERDTreeQuitOnOpen = 1
"let NERDTreeShowHidden = 1
"let NERDTreeIgnore = ['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']

" " Plugin: Showmarks
let g:showmarks_enable=0
let g:showmarks_textlower="\t"
let g:showmarks_textupper=">"
let g:showmarks_textother=">"
let g:showmarks_hlline_lower=1
let g:showmarks_hlline_upper=0
let g:showmarks_hlline_other=0

" " Plugin: Search Pulse
let g:vim_search_pulse_mode = 'cursor_line'
"let g:vim_search_pulse_duration = 400

" " Plugin: Unite
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-P> :<C-u>Unite -buffer-name=files -start-insert buffer file_rec:!<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
