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

" deactivate line numbers
set number

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

set tabstop=4

"#######################################################################

" disable visual bell (also disable in .inputrc)
set t_vb=

let mapleader=" "

set softtabstop=4

" mostly used with >> and <<
set shiftwidth=4

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

" mark trailing spaces as errors
" match IncSearch '\s\+$'

" enough for line numbers + gutter within 80 standard
set textwidth=72
"set colorcolumn=73

" replace tabs with spaces automatically
set expandtab

" disable relative line numbers, remove no to sample it
set norelativenumber

" makes ~ effectively invisible
"highlight NonText guifg=bg

" turn on default spell checking
"set spell

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

" not a fan of bracket matching or folding
" if has("eval") " vim-tiny detection
"   let g:loaded_matchparen=1
" endif
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

" requires PLATFORM env variable set (in ~/.bashrc)
if $PLATFORM == 'mac'
  " required for mac delete to work
  set backspace=indent,eol,start
endif

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

" high contrast for streaming, etc.
set background=dark

" base default color changes (gruvbox dark friendly)
hi StatusLine ctermfg=black ctermbg=NONE
hi StatusLineNC ctermfg=black ctermbg=NONE
hi Normal ctermbg=NONE
hi Special ctermfg=cyan
hi LineNr ctermfg=black ctermbg=NONE
hi SpecialKey ctermfg=black ctermbg=NONE
hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=black ctermbg=NONE
hi NonText ctermfg=black ctermbg=NONE
hi vimGlobal ctermfg=black ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi MatchParen ctermbg=236 ctermfg=darkred

" color overrides
au FileType * hi StatusLine ctermfg=black ctermbg=NONE
au FileType * hi StatusLineNC ctermfg=black ctermbg=NONE
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=black ctermbg=NONE
au FileType * hi SpecialKey ctermfg=black ctermbg=NONE
au FileType * hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=black ctermbg=NONE
au FileType * hi NonText ctermfg=black ctermbg=NONE
au FileType * hi vimGlobal ctermfg=black ctermbg=NONE
au FileType * hi goComment ctermfg=black ctermbg=NONE
au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Search ctermbg=236 ctermfg=darkred
au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
au FileType * hi Todo ctermbg=236 ctermfg=darkred
au FileType * hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
au FileType yaml hi yamlBlockMappingKey ctermfg=NONE
au FileType yaml set sw=4
au FileType bash set sw=2
au FileType c set sw=8

set cinoptions+=:0

" Edit/Reload vimr configuration file
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>

set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  " github.com/junegunn/vim-plug

  call plug#begin('~/.local/share/vim/plugins')
  Plug 'frazrepo/vim-rainbow' " rainbow paran
  Plug 'vim-pandoc/vim-pandoc' " markdown support
  Plug 'rwxrob/vim-pandoc-syntax-simple' " syntax for md files and more
  Plug 'tpope/vim-fugitive' " Git stuff
  Plug 'EdenEast/nightfox.nvim' " colorscheme
  Plug 'tpope/vim-commentary' " gcc sttyle commenting
  Plug 'ryanoasis/vim-devicons' " Icons for nerdtree, lightline, etc
  Plug 'preservim/nerdtree' " File explorer
  Plug 'jiangmiao/auto-pairs' " Auto pair paranthesis, quotations, etc
  call plug#end()

  " pandoc
  let g:pandoc#formatting#mode = 'h' " A'
  let g:pandoc#formatting#textwidth = 72

else
  autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif

" set colorscheme
colorscheme nordfox

" fill in anything beginning with @ with a link to twitch to it
" autocmd vimleavepre *.md !perl -p -i -e 's, @(\w+), [\\@\1](https://twitch.tv/\1),g' %

" make Y consitent with D and C (yank til end)
map Y y$

" better command-line completion
set wildmenu

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" enable omni-completion
set omnifunc=syntaxcomplete#Complete

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

" displays all the syntax rules for current position, useful
" when writing vimscript syntax plugins
if has("syntax")
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
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

" Nerdtree key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Set TMUX window name to name of file
"au fileopened * !tmux rename-window TESTING

" read personal/private vim configuration (keep last to override)
set rtp^=~/.vimpersonal
set rtp^=~/.vimprivate
set rtp^=~/.vimwork

