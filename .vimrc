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

" statusline
set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin('~/.local/share/vim/plugins')
  Plug 'tpope/vim-fugitive' " Git stuff
  Plug 'EdenEast/nightfox.nvim' " colorscheme
  Plug 'tpope/vim-commentary' " gcc sttyle commenting
  Plug 'jiangmiao/auto-pairs' " Auto pair paranthesis, quotations, etc
  Plug 'vim-scripts/AutoComplPop' " Automatically show vim's built in completion
  " Not neccessary to have plugins
  Plug 'Yggdroot/indentLine' " Indent rules
  Plug 'airblade/vim-gitgutter' " shows a 'gutter' of diff changes
  Plug 'junegunn/fzf.vim' " fuzzy finding
  Plug 'sheerun/vim-polyglot' " Better syntax highlighting
  Plug 'lervag/vimtex' " vim syntax highlighting and more 
  call plug#end()
endif

" set colorscheme
colorscheme nordfox

" make Y consitent with D and C (yank til end)
map Y y$

" better command-line completion
set wildmenu

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" enable omni-completion
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest
set shortmess+=c

" Set key mappings for navigating auto complete menu
nnoremap <C-j> <nop>
nnoremap <C-k> <nop>
inoremap <expr> <C-j> pumvisible() ? "<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"

" force some files to be specific file type
au bufnewfile,bufRead $SNIPPETS/md/* set ft=pandoc
au bufnewfile,bufRead $SNIPPETS/sh/* set ft=sh
au bufnewfile,bufRead $SNIPPETS/bash/* set ft=bash
au bufnewfile,bufRead $SNIPPETS/go/* set ft=go
au bufnewfile,bufRead $SNIPPETS/c/* set ft=c
au bufnewfile,bufRead $SNIPPETS/html/* set ft=html
au bufnewfile,bufRead $SNIPPETS/css/* set ft=css
au bufnewfile,bufRead $SNIPPETS/js/* set ft=javascript
au bufnewfile,bufRead $SNIPPETS/python/* set ft=python
au bufnewfile,bufRead $SNIPPETS/perl/* set ft=perl
au bufnewfile,bufRead user-data set ft=yaml
au bufnewfile,bufRead meta-data set ft=yaml
au bufnewfile,bufRead *.bash* set ft=bash
au bufnewfile,bufRead *.{peg,pegn} set ft=config
au bufnewfile,bufRead *.profile set filetype=sh
au bufnewfile,bufRead *.crontab set filetype=crontab
au bufnewfile,bufRead *ssh/config set filetype=sshconfig
au bufnewfile,bufRead .dockerignore set filetype=gitignore
au bufnewfile,bufRead *gitconfig set filetype=gitconfig
au bufnewfile,bufRead /tmp/psql.edit.* set syntax=sql
au bufnewfile,bufRead *.go set spell spellcapcheck=0
au bufnewfile,bufRead commands.yaml set spell

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
nmap <F2> :call <SID>SynStack()<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
map <F12> :set fdm=indent<CR>

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

"####################### Netrw configuration #######################
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25

" function that toggles netrw
function! ToggleNetrw()
  if g:NetrwIsOpen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i-=1
    endwhile
    let g:NetrwIsOpen=0
  else
    let g:NetrwIsOpen=1
    silent Vexplore
  endif
endfunction

" Close netrw if its the only open buffer
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|| &buftype == 'quickfix' |q|endif

let g:NetrwIsOpen=0
noremap <silent> <leader>e :call ToggleNetrw()<CR>
"###################################################################


" indentLine exclusions
let g:indentLine_fileTypeExclude = ["vimwiki", "help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]
let g:indentLine_indentLevel = 6

" indentLine conceal settings
let g:indentLine_setConceal = 1
let g:indentLine_concealCursor = "inc"
let g:indentLine_conceallevel = 2

" chars to display
let g:indentLine_char_list = '|'

" Set TMUX window name to name of file
"au fileopened * !tmux rename-window TESTING

" fzf  mapping 
noremap <leader>f :Files<CR>

" These filetypes will use 4 spaces instead of the default 2 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab
