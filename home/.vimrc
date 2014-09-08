" Rafael Robayna's vimrc

set nocompatible

" " Vundle Initialization
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Themes
Plugin 'Lucius'
" Visual Enhancements
Plugin 'maciakl/vim-neatstatus'			" Lightweight status bar
Plugin 'airblade/vim-gitgutter'			" Display git diff in sidebar
Plugin 'kshenoy/vim-signature'
Plugin 'trailing-whitespace'			" Highlight/Fix trailing whitespace
" Vim Vocabulary Enhancements
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'nvie/vim-togglemouse'
" Tools
Plugin 'The-NERD-tree'
Plugin 'tpope/vim-fugitive'
Plugin 'vimwiki/vimwiki'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'renamer.vim'					" File renamer
Plugin 'Shutnik/jshint2.vim'
" Syntax
Plugin 'plasticboy/vim-markdown'
Plugin 'shawncplus/php.vim'
" Cheats
Plugin 'git-cheat'
call vundle#end()
filetype plugin indent on

" " Settings
syntax enable
map \ ,							" Shuffle comma mapping
let mapleader=","				" Set the leader
let maplocalleader=' '			" Set the localleader to <space>
set encoding=utf-8				" Set default encoding to utf-8
set nolist						" Set list characters off on load
set lcs=tab:▸\ ,trail:·			" Set the lcs tab and trailing space char
set lcs+=eol:¬					" Set the lcs end of line char
set ffs=unix,dos,mac			" Set unix as the standard file type
set foldcolumn=0				" Explicitly unset foldcolumn
set number						" Line Numbers
set hlsearch					" Highlight Search
set showmatch					" Show matching bracket
set incsearch					" Incremental search
set ignorecase					" Ignore case with search
set smartcase					" Allow search case matching
set lazyredraw					" Don't redraw while executing macros
set showcmd						" Display command as used
set autoindent					" Auto indent
set history=1000				" Extend history to 1000
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
set foldmethod=syntax
set foldlevel=20

" Default wiki locations
let g:wikis_folder = '~/.wikis'
let g:todo_path = g:wikis_folder . '/todo.wiki'
let g:scratch_path = g:wikis_folder . '/scratch.wiki'

" Get The OS Type
let os = substitute(system('uname'), "\n", "", "")

" Set External File Browser for OS X
if os == "Darwin"
	let g:netrw_browsex_viewer='open'
endif

" Set File Encryption Method
set cryptmethod=blowfish

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Enhanced wildmenu: Display long list on first tab and nav menu on second
set wildmenu
set wildmode=list:longest,full

" Display: Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Display: Set Default Colorscheme
try
	set background=dark
	colorscheme lucius
	exec 'LuciusDark'
catch /^Vim\%((\a\+)\)\=:E185/
	set background=light
	colorscheme elflord
endtry

" Display: 80-character wrap bar line
if exists('+colorcolumn')
	set colorcolumn=81
elseif exists('*matchadd')
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif

" " Mappings
" Remap 0 to move to the first string character instead of COL 0
map 0 ^
" Make Y behave like other capitals - http://vimbits.com/bits/11
nnoremap Y y$
" Make H and L move to beginning and end of line
nnoremap H ^
nnoremap L $
" Keep search pattern at the center of the screen - http://vimbits.com/bits/92
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" " Commands
command! Reload source $MYVIMRC
command! CheatGit tab help git-cheat
command! CheatVim !open http://www.viemu.com/vi-vim-cheat-sheet.gif
command! FTabs %retab!
command! Bdall execute "1," . bufnr("$") . "bd"
command! Todo execute 'e ' . g:todo_path
command! Scratch execute 'e ' . g:scratch_path
command! Today VimwikiMakeDiaryNote
command! Diary VimwikiDiaryIndex

" " Shortcuts
nmap <C-W>t :tabnew<CR>
nmap <C-W>l :tabnext<CR>
nmap <C-W>h :tabprevious<CR>
nmap <C-W>j :bn<CR>
nmap <C-W>k :bp<CR>
nmap <C-W>e :NERDTreeToggle<CR>
nmap <leader>. :bd<CR>
nmap <leader>a :Todo<CR>
nmap <leader>q :Scratch<CR>
nmap <leader>s :ShowMarksToggle<CR>
nmap <leader>t :TagbarToggle<CR>
map <leader>d :Dash<CR>
nmap <silent><Leader><space> :nohls<CR>
" Insert maps
imap <c-d> <esc>ddi
" Quick Access to vimrc
nmap <leader>rc :e $MYVIMRC<CR>
" Execute current line in bash
nnoremap <F2> :.w !bash<CR>
" Execute current shell script (must have correct permissions and shell definition)
nnoremap <F3> :! %:p
" Execute current file in bash (permissions not needed)
nnoremap <F4> :!bash %:p
" Git Command Shortcuts
nnoremap [gitter] <Nop>
nmap <C-x> [gitter]
nnoremap [gitter]n :GitGutterNextHunk<CR>
nnoremap [gitter]p :GitGutterPrevHunk<CR>
nnoremap [gitter]s :GitGutterStageHunk<CR>
nnoremap [gitter]b :Gblame<CR>

"let g:unite_source_menu_menus = {bookmarks}

" " Shortcuts: Unite
" Define Fuzzy prefix
nnoremap [fuzzy] <Nop>
nmap <LocalLeader> [fuzzy]
nnoremap <silent>[fuzzy]e :NERDTreeToggle<CR>
nnoremap <silent>[fuzzy]t :TagbarToggle<CR>
nnoremap <silent>[fuzzy]c :tabclose<CR>
" Unite Buffers
nnoremap <leader>, :Unite
\ -winheight=10 -no-split -buffer-name=buffers buffer<CR>
" Unite Fuzzy File Filter
nnoremap <silent> [fuzzy]f :<C-u>UniteWithCurrentDir
\ -start-insert -winheight=25 -no-split -sync -buffer-name=files file_rec/async<CR>
" Unite Grep
nnoremap <silent> [fuzzy]g :<C-u>Unite
\ -start-insert -winheight=25 -no-split -buffer-name=grep grep<CR>
" Unite Grep Current Word
nnoremap <silent> [fuzzy]w :<C-u>UniteWithCursorWord
\ -winheight=30 -buffer-name=grep grep<CR>
" Unite Outline/Tags
nnoremap <silent> [fuzzy]r :<C-u>Unite
\ -winheight=25 -no-split -auto-preview -buffer-name=outline outline<CR>
" Unite Search for vimwiki
nnoremap <silent> [fuzzy]v :<C-u>Unite
\ -buffer-name=vimwiki grep:~/.wikis<CR>

" " Plugin: NERDtree
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']

" " Plugin: Showmarks
let g:showmarks_enable=0
let g:showmarks_textlower="\t"
let g:showmarks_textupper=">"
let g:showmarks_textother=">"
let g:showmarks_hlline_lower=1
let g:showmarks_hlline_upper=0
let g:showmarks_hlline_other=0

" " Plugin: phpctagsbar
let g:tagbar_phpctags_memory_limit = '512M'

" " Plugin: vimwiki
let g:vimwiki_folding = "expr"
let notes = {}
let notes.path = g:wikis_folder . '/notes/'
let notes.path_html = g:wikis_folder . '/notes_html/'
let g:vimwiki_list = [notes]
if !empty(glob('~/.vimwikirc.vim'))
	source ~/.vimwikirc.vim
endif

" " Plugin: markdown
let g:vim_markdown_initial_foldlevel=4

" " Functions: Session
function! FindProjectName()
	let s:name = getcwd()
	if s:name != ""
		let s:name = matchstr(s:name, ".*", strridx(s:name, "/") + 1)
	end
	return s:name
endfunction

" Sessions only restored if we start Vim without args.
function! RestoreSession(name)
	if a:name != ""
		if filereadable($HOME . "/.vim/sessions/" . a:name)
			execute 'source ' . $HOME . "/.vim/sessions/" . a:name
		end
	end
endfunction

" Check if a session exists
function! ExistsSession(name)
	if a:name != ""
		if filereadable($HOME . "/.vim/sessions/" . a:name)
			echom 'Session exists for ' . a:name
		else
			echom 'No session exists for ' . a:name
		end
	end
endfunction

" Sessions only saved if we start Vim without args.
function! SaveSession(name, create)
	if a:name != ""
		if filereadable($HOME . "/.vim/sessions/" . a:name) || a:create == 1
			execute 'mksession! ' . $HOME . '/.vim/sessions/' . a:name
			echom 'Session saved ' . a:name
		end
	end
endfunction

" Delete session
function! DeleteSession(name)
	if a:name != "" && filereadable($HOME . "/.vim/sessions/" . a:name)
		call delete($HOME . '/.vim/sessions/' . a:name)
		echom 'Session deleted: ' . a:name
	end
endfunction

function! Session(flag)
	if a:flag == "d" || a:flag == "delete"
		call DeleteSession(FindProjectName())
	elseif a:flag == "s" || a:flag == "save"
		call SaveSession(FindProjectName(), 1)
	elseif a:flag == "r" || a:flag == "restore"
		call RestoreSession(FindProjectName())
	else
		call ExistsSession(FindProjectName())
	end
endfunction

command! -nargs=* Session call Session(<q-args>)

" Restore and save sessions automaticaly
if argc() == 0
	autocmd VimEnter * call RestoreSession(FindProjectName())
	"autocmd VimLeave * call SaveSession(FindProjectName(), 0)
end

function! LayoutProfile(flag)
	if a:flag == "write" || a:flag == "w"
		set nonumber
		set colorcolumn=0
		set laststatus=0
		set foldcolumn=4
		set foldmethod=marker
		set foldlevel=0
		set wrap linebreak nolist
		set spell
		set mouse=a
		exec 'LuciusBlackLowContrast'
	elseif a:flag == "dev" || a:flag == "d"
		set number
		set colorcolumn=81
		set laststatus=2
		set foldcolumn=0
		set foldmethod=syntax
		set foldlevel=-1 " or 20
		set nowrap nolinebreak nolist
		set nospell
		set mouse=
		exec 'LuciusDark'
	end
endfunction
command! -nargs=* Layout call LayoutProfile(<q-args>)
