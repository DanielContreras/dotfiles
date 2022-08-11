"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                   "
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                   "
"               ██║   ██║██║██╔████╔██║██████╔╝██║                        "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                        "
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                   "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                   "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" designed for vim 8+

if has("eval")                               " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif

set nocompatible

" set mouse support
set mouse=a

" set cursor style in normal and insert mode
if &term =~ '^xterm'
    " normal mode - solid block
    let &t_EI .= "\<Esc>[2 q"
    " insert mode - solic line
    let &t_SI .= "\<Esc>[6 q"
endif

" tmux Compatible
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" activate line numbers
set number

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

set tabstop=2

"#######################################################################

" disable visual bell (also disable in .inputrc)
set t_vb=

nnoremap <SPACE> <Nop>
let mapleader=" "

set softtabstop=2

" mostly used with >> and <<
set shiftwidth=2

set smartindent

set smarttab

if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
  set nofixendofline

  " better ascii friendly listchars
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

  " i hate automatic folding
  set foldmethod=manual
  set nofoldenable
endif

" Keeps the current visual block after changing indent 
vmap < <gv
vmap > >gv

" Shortcut split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" enough for line numbers + gutter within 100 lines
set textwidth=92

" replace tabs with spaces automatically
set expandtab

" set current line relative
set relativenumber

" disable spellcapcheck
set spc=

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

" center the cursor always on the screen
set scrolloff=9

" highlight search hits
set hlsearch
set incsearch
set linebreak

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" Highlight match
set showmatch

" wrap around when searching
set wrapscan

" Just the defaults, these are changed per filetype by plugins.
" Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

set fo-=t   " don't auto-wrap text using text width
set fo+=c   " autowrap comments using textwidth with leader
set fo-=r   " don't auto-insert comment leader on enter in insert
set fo-=o   " don't auto-insert comment leader on o/O in normal
set fo+=q   " allow formatting of comments with gq
set fo-=w   " don't use trailing whitespace for paragraphs
set fo-=a   " disable auto-formatting of paragraph changes
set fo-=n   " don't recognized numbered lists
set fo+=j   " delete comment prefix when joining
set fo-=2   " don't use the indent of second paragraph line
set fo-=v   " don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " long lines not broken in insert mode
set fo+=m   " multi-byte character line break support
set fo+=M   " don't add space before or after multi-byte char
set fo-=B   " don't add space between two multi-byte chars
set fo+=1   " don't break a line after a one-letter word

set backspace=indent,eol,start

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" dunno
set cinoptions+=:0

" Edit/Reload vimr configuration file
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin('~/.local/share/vim/plugins')
  Plug 'tpope/vim-fugitive' " Git stuff
  Plug 'tpope/vim-surround' " Surround text objects with delimeters
  Plug 'tpope/vim-repeat' " Fixes dot repeat functionality on some plugins
  Plug 'morhetz/gruvbox' " gruvbox colorscheme
  Plug 'EdenEast/nightfox.nvim' " neovim nightfox colorscheme
  Plug 'arcticicestudio/nord-vim' " vim nord colorscheme
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf vim
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree' " Tree drawer
  Plug 'ryanoasis/vim-devicons' " Icons 
  Plug 'vim-airline/vim-airline' " Status bar
  Plug 'vim-airline/vim-airline-themes' " Status bar themes
  Plug 'tpope/vim-commentary' " gcc sttyle commenting
  Plug 'jiangmiao/auto-pairs' " Auto pair paranthesis, quotations, etc
  Plug 'vim-scripts/AutoComplPop' " Automatically show vim's built in completion
  " Not neccessary to have plugins
  Plug 'Yggdroot/indentLine' " Indent rules
  Plug 'airblade/vim-gitgutter' " shows a 'gutter' of diff changes
  Plug 'sheerun/vim-polyglot' " Better syntax highlighting
  call plug#end()
endif

" set colorscheme
set t_Co=256
set background=dark
let g:gruvbox_termcolors = 256
colorscheme nord

" Set airline theme
let g:airline_powerline_fonts = 1
" let g:airline_theme='nord'

" vim-devicons
set encoding=UTF-8

" vim indentline configuration
let g:indentLine_char_list = ['▏']

" make Y consitent with D and C (yank til end)
map Y y$

" better command-line completion
set wildmenu

" disable search highlighting with <C-e> when refreshing screen
nnoremap <C-e> :nohl<CR><C-e>

" enable omni-completion
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest
set shortmess+=c

" Set key mappings for navigating auto complete menu
nnoremap <C-j> <nop>
nnoremap <C-k> <nop>
inoremap <expr> <C-j> pumvisible() ? "<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"

"fix bork bash detection
if has("eval")  " vim-tiny detection
fun! s:DetectBash()
  if getline(1) == '#!/usr/bin/bash' || getline(1) == '#!/bin/bash'
    set ft=bash
    set shiftwidth=2
  endif
endfun
autocmd BufNewFile,BufRead * call s:DetectBash()
endif

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"au BufWritePost ~/.vimrc so ~/.vimrc

" functions keys
map <F1> :set number!<CR> :set relativenumber!<CR>
map <F2> :set spell!<CR>

nmap <leader>2 :set paste<CR>i

" disable arrow keys (vi muscle memory)
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>

" better use of arrow keys, number increment/decrement
nnoremap <up> <C-a>
nnoremap <down> <C-x>

" Better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

" indentLine exclusions
let g:indentLine_fileTypeExclude = ["vimwiki", "help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]
let g:indentLine_indentLevel = 6

" indentLine conceal settings
let g:indentLine_setConceal = 6
let g:indentLine_concealCursor = "inc"
let g:indentLine_conceallevel = 2

" chars to display
let g:indentLine_char_list = '|'

" fzf  mapping 
nnoremap <leader>f :Files <CR> 
nnoremap <leader>fg :Rg <CR> 

" nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>

" Move blocks of code
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" These filetypes will use 4 spaces instead of the default 2 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab
