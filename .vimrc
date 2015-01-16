set nocompatible              " be iMproved
filetype off                  " required!

filetype plugin indent on      " required!

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>

" ============
" Basic
" ============

syntax on                    " syntax highlighting
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
"set number                   " display line numbers
hi LineNr ctermfg=darkgrey
set background=dark          " self explanatory
set title                    " idem
set wildmenu                 " menu completion in command mode on <Tab>
set wildmode=full            " <Tab> cycles between all matching choices

" Ignore these files when completing
set wildignore+=*.git,*.pyc,*.min.js,*.min.css

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Moving around / editing
set cursorline           " have a line indicate the cursor location
set ruler                " show the cursor position at all time
set nostartofline        " avoid moving cursor to start of line when jumping around
set tabstop=4            " <tab> inserts 4 spaces
set shiftwidth=4         " an indent level is 4 spaces wide
set softtabstop=4        " <BS> over an autoindent deletes both spaces
set expandtab            " use spaces, not tabs, for autoindent/tab key.
set shiftround           " rounds indents to a multiple of shiftwidth
set textwidth=80         " lines are automatically wrapped after 80 columns

" Reading / writing
set noautowrite
set noautowriteall
set autoread

" Messages, info, status
set ls=2         " always show status line
set showcmd      " show incomplete normal mode commands
set laststatus=2 " always show statusline even if only 1 window

" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

map <C-space> :bn <CR>
map <C-M-space> :bp <CR>

if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.vim/undo//
    set undofile
endif
