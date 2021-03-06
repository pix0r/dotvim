if version >= 700

	call pathogen#helptags()
	call pathogen#runtime_append_all_bundles() 
endif


" Basics
"filetype off
if has("autocmd")
        filetype plugin indent on
endif

set nocompatible

" Security
set modelines=0

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Basic options
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set wildignore=.git,.svn,.hg,*~,*.o,*.so,*/tmp/*,*.swp,*.pyc
set visualbell
set cursorline
set cursorcolumn
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
if version >= 730
	"set relativenumber
	set undofile
endif

" C, C++, Javascript options
set cino=j1,J1,(1s,m1

" Backups
set backupdir=~/.vim/tmp/backup//	" backups
set undodir=~/.vim/tmp/undo//		" undo
set directory=~/.vim/tmp/swap//		" swap files
set backup							" enable backups



" Use Perl-style regexp
"nnoremap / /\v
"vnoremap / /\v

" Searching
set smartcase
set incsearch
set showmatch
set nohlsearch

" Clear search by <leader><space>
nnoremap <leader><space> :let @/=''<cr>

" These would use <tab> instead of % to jump to matching bracket
"nnoremap <tab> %
"vnoremap <tab> %

set wrap
set textwidth=0
set formatoptions=croqln
"set formatoptions=qrn1
"macvim default: croql

" Language-specific stuff """"""""""""""

" Python
autocmd BufRead,BufNewFile *.rpy set ft=python
autocmd BufRead,BufNewFile *.py setlocal expandtab
autocmd BufRead,BufNewFile *.py setlocal colorcolumn=80

" Ruby
autocmd BufRead,BufNewFile *.rb set ft=ruby
autocmd BufRead,BufNewFile Podfile set ft=ruby
autocmd BufRead,BufNewFile Gemfile set ft=ruby
autocmd FileType ruby setlocal expandtab ts=2 sw=2 sts=2
" Vroom, helper to run ruby tests
" Use vimux (runs tests in tmux pane below vim)
let g:vroom_use_vimux = 1

" Javascript & JS templates
autocmd BufRead,BufNewFile *.ejs set filetype=javascript
autocmd FileType javascript setlocal expandtab ts=2 sw=2 sts=2

" JSON
autocmd BufRead,BufNewFile *.json setlocal expandtab ts=2 sw=2 sts=2

" Coffeescript
autocmd FileType coffee setlocal ts=2 sw=2 sts=2 expandtab

" HTML & CSS
autocmd BufRead,BufNewFile *.hbs setlocal ft=html
autocmd BufRead,BufNewFile *.erb setlocal ft=html
autocmd FileType html setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType css setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType scss setlocal ts=2 sw=2 sts=2 expandtab

" JS Templates
autocmd BufRead,BufNewFile *.ejs set filetype=html

" Stylus
autocmd FileType stylus setlocal ts=2 sw=2 sts=2 expandtab

" Jade
autocmd FileType jade setlocal ts=2 sw=2 sts=2 expandtab

" PHP
autocmd FileType php setlocal ts=4 sw=4 sts=4 expandtab
autocmd FileType php setlocal colorcolumn=80

" YAML
autocmd FileType yaml setlocal ts=2 sw=2 sts=2 expandtab

" Custom commands

imap jj <Esc>

" Subversion command
com! Commit -nargs=1 !svn ci "%" -m '<args>'

" authorization.conf
:autocmd BufRead authorization.conf noremap <C-M> :w!<CR>:!cp % /Volumes/192.168.32.77/SVN/authorization.conf

" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" Re-selected pasted text
nnoremap <leader>v V`]

" Open .vimrc in split window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Copy entire document to system clipboard (buffer *)
nnoremap <leader>cc :%y*<cr>

" Open a new split window
nnoremap <leader>w <C-w>v<C-w>l

" Sudo to write file
cmap w!! w !sudo tee % > /dev/null

" Toggle line numbers in all windows
nnoremap <leader>n :windo set number!<cr>

" Change to file's directory
"nmap <silent> <leader>cd :cd %:p:h<cr>

" Reload .vimrc
map <F9> :source $HOME/.vimrc<cr>

" NERD Tree
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$']

" Taglist
" Note: May be necessary to override Tlist_Ctags_Cmd to point to a working
" ctags. If so, override the next line in vimrc.local.
" let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
nmap <silent> <F3> :TlistToggle<cr>

" Edit file in current directory (stolen from janus)
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>

" GUI
if has("gui_running")

	" default macvim: egmrLtT
	set guioptions=ermLt
	
	" Set font
	if has("macvim")
		"set guifont=Monaco:h12
		set guifont=Inconsolata:h15
	elseif has("mac")
		"set guifont=Monaco:h12
		set guifont=Inconsolata:h15
	else
		" What font to set for Windows or Linux?
	endif
	
	" Screen size
	set lines=50 columns=120
endif

" COLORS

" true color support
" see: https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors') && !empty($COLORTERM)
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" Override terminal to 256 color
"set t_Co=256

"colorscheme torte
colorscheme monokai

"let g:dracula_italic = 0
"colorscheme dracula

syntax on

" Cursorline shiz
"hi clear CursorLine
"hi CursorLine term=underline ctermbg=236 guibg=#404040
"hi clear CursorColumn
"hi CursorColumn term=reverse ctermbg=236 guibg=#404040

" Line numbers
"hi LineNr term=underline ctermfg=238 guifg=#800000

" Enable mouse support
" (note for tmux, first "set -g mode-mouse on")
set mouse=a
" Mouse compatibility past 223rd character
" See: http://stackoverflow.com/questions/7000960/vim-mouse-problem
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

" Load any local config
runtime vimrc.local

