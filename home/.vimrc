" Rafael Robayna's vimrc

set nocompatible

" Get The OS Type
let os = substitute(system('uname'), "\n", "", "")

" " Vundle Initialization
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Themes
Plugin 'Lucius'
" Visual Enhancements
Plugin 'maciakl/vim-neatstatus'			" Lightweight status bar
Plugin 'airblade/vim-gitgutter'			" Display git diff in gutter
Plugin 'kshenoy/vim-signature'			" Display marks in gutter
Plugin 'trailing-whitespace'			" Highlight/Fix trailing whitespace
" Vim Vocabulary Enhancements
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'nvie/vim-togglemouse'
" Tools
Plugin 'The-NERD-tree'					" File browser
Plugin 'tpope/vim-fugitive'				" Git interface
Plugin 'vimwiki/vimwiki'				" Wiki
Plugin 'majutsushi/tagbar'				" Taglist sidebar
Plugin 'vim-php/tagbar-phpctags.vim'	" Tagbar extension for php
Plugin 'joonty/vim-phpqa'				" PHP code quality tools interface
"Plugin 'PDV--phpDocumentor-for-Vim'
Plugin 'Shutnik/jshint2.vim'			" Javascript code quality tool
Plugin 'renamer.vim'					" File renamer
if has('lua')
	Plugin 'Shougo/vimproc.vim'
	Plugin 'Shougo/unite.vim'
	Plugin 'Shougo/neomru.vim'
	Plugin 'Shougo/unite-session'
	Plugin 'tacroe/unite-mark'
	Plugin 'Shougo/neocomplete.vim'
	Plugin 'Shougo/unite-outline'
endif
if has('python')
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
endif
if os == "Darwin"
	Plugin 'rizzatti/dash.vim'
endif
" Syntax
Plugin 'plasticboy/vim-markdown'
" Cheats
Plugin 'git-cheat'
call vundle#end()
filetype plugin indent on

" " Settings
syntax enable
let mapleader=' '				" Set the leader
let maplocalleader='\'			" Set the localleader
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

" Display: Force transparent background
hi NonText ctermfg=105 ctermbg=None cterm=Bold

" " Mappings
" Remap 0 to move to the first string character instead of COL 0
map 0 ^
" Close all buffers
nnoremap <silent> ZA :qa<CR>
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
" " Abbreviations
cabbrev h tab help
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
command! Gs Gstatus
command! Gc Gcommit
command! Gd Git diff
command! Gds Git diff --staged
command! Grl Git reflog
" " Shortcuts
nmap <C-W>t :tabnew<CR>
nmap <C-W>l :tabnext<CR>
nmap <C-W>h :tabprevious<CR>
nmap <leader>j :bn<CR>
nmap <leader>k :bp<CR>
nmap <leader>l :b #<CR>
nnoremap <C-W>e :NERDTreeToggle<CR>
nnoremap <silent><leader>e :NERDTreeToggle<CR>
nnoremap <silent><leader>t :TagbarToggle<CR>

nmap <silent><leader>. :bd<CR>
nmap <silent><leader>, :nohls<CR>
nmap <leader>a :Todo<CR>
nmap <leader>q :Scratch<CR>
map <leader>d :Dash<CR>
" Delete line in insert mode
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

" " Shortcuts: Unite
nnoremap <silent><leader>o :<C-u>Unite
\ -winheight=10 -buffer-name=buffers buffer<CR>
nnoremap <silent><leader>p :<C-u>Unite
\ -no-empty -buffer-name=sessions session<CR>
nnoremap <silent><leader>f :<C-u>UniteWithCurrentDir
\ -start-insert -winheight=25 -sync -buffer-name=files neomru/file<CR>
nnoremap <silent><leader>g :<C-u>Unite
\ -start-insert -no-empty -buffer-name=grep grep<CR>
nnoremap <leader>s :<C-u>Unite
\ -start-insert -no-empty -buffer-name=wikisearch grep:~/.wikis<CR>
nnoremap <silent><leader>u :<C-u>Unite
\ -start-insert -buffer-name=unitesources source<CR>
nnoremap <silent><leader>b :<C-u>Unite
\ -winheight=10 -buffer-name=bookmarks bookmark<CR>
nnoremap <leader>m :<C-u>Unite
\ -no-empty -winheight=10 -buffer-name=marks mark<CR>
nnoremap <leader>h :<C-u>UniteWithCursorWord
\ -start-insert -no-empty -buffer-name=grepcurrentword grep<CR>
nnoremap <silent><leader>r :<C-u>Unite
\ -winheight=20 -auto-preview -buffer-name=outline outline<CR>
nnoremap <C-w>y :<C-u>Unite
\ -no-empty -buffer-name=tabs tab<CR>

" " Plugin: NERDtree
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']

" " Plugin: tagbar
let g:tagbar_width = 40
let g:tagbar_singleclick = 1
let g:tagbar_phpctags_memory_limit = '512M'
" Enable cursorline for tagbar panes
autocmd FileType tagbar setlocal cursorline

" " Plugin: vimwiki
let g:vimwiki_folding = "expr"
let notes = {}
let notes.path = g:wikis_folder . '/notes/'
let notes.path_html = g:wikis_folder . '/notes_html/'
let notes.template_path = '~/.wikis/templates/'
let notes.template_default = 'index.html'
let g:vimwiki_list = [notes]
if !empty(glob('~/.vimwikirc.vim'))
	source ~/.vimwikirc.vim
endif

" " Plugin: markdown
let g:vim_markdown_initial_foldlevel=4

" " Plugin: neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 4
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
    \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" key mappings
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
noremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" " Plugin: phpqa
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codesniffer_args = "--standard=./contrib/phpcs/ruleset.xml --encoding=utf-8"
let g:phpqa_messdetector_cmd='./vendor/phpmd/phpmd/src/bin/phpmd'
let g:phpqa_messdetector_ruleset = "./contrib/phpmd/ruleset.xml"

" " Plugin: ultisnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

function! UltiSnipsCallUnite()
	Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
	return ''
endfunction
inoremap <silent> <F11> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent> <F11> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>

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
	"autocmd VimEnter * call RestoreSession(FindProjectName())
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
	else
		echo "Specify a display layout: [(w)rite|(d)ev]"
	end
endfunction
command! -nargs=* Layout call LayoutProfile(<q-args>)
