filetype off
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

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set visualbell
"set cursorline
set ruler
set backspace=indent,eol,start
set laststatus=2
if version >= 730
	"set relativenumber
	set undofile
endif

" Use Perl-style regexp
nnoremap / /\v
vnoremap / /\v

" Searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Clear search by <leader><space>
nnoremap <leader><space> :let @/=''<cr>

" These would use <tab> instead of % to jump to matching bracket
"nnoremap <tab> %
"vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=croqln
"set formatoptions=qrn1
"macvim default: croql

" Color Display
if &t_Co > 2 || has("gui_running")
	colorscheme torte
	if version >= 730
		set colorcolumn=80
	endif
endif

" Any GUI
if has("gui_running")
	" Set font
	if has("macvim")
		set guifont=Monaco:h12
	elseif has("mac")
		set guifont=Monaco:h12
	else
		" What font to set for Windows or Linux?
	endif
	set lines=50 columns=120
endif

" Custom commands

" Subversion command
com! Commit -nargs=1 !svn ci "%" -m '<args>'

" authorization.conf
:autocmd BufRead authorization.conf noremap <C-M> :w!<CR>:!cp % /Volumes/192.168.1.23/SVN/authorization.conf

" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" Re-selected pasted text
nnoremap <leader>v V`]

" Open .vimrc in split window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

