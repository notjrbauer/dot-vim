" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" set vim home directory as vimrc is sourced
let $VIMFILES=fnamemodify(globpath(&rtp, 'bundle'), ":h")
let $DEIN_PATH=expand('~/.cache/dein')
let $DEIN_REPO=$DEIN_PATH.'/repos/github.com/Shougo/dein.vim'

if has('vim_starting')
  set nocompatible          " We're running Vim, not Vi!
  set runtimepath+=$DEIN_REPO
endif

set shell=/bin/bash

if dein#load_state($DEIN_PATH)
  call dein#begin($DEIN_PATH)

  " Let dein manage dein
  call dein#add($DEIN_REPO)

  if !has('nvim')
    call dein#add('Shougo/vimproc', {'build': 'make'})
  endif

  call dein#add('tpope/vim-sensible')

  " Navigation
  call dein#add('justinmk/vim-dirvish')
  call dein#add('airblade/vim-rooter')
  call dein#add('tpope/vim-projectionist')
  call dein#add('simnalamburt/vim-mundo')
  if has('nvim') && has('python3')
    call dein#add('Shougo/denite.nvim')
    call dein#add('neoclide/denite-git')
  endif

  " unimpaired pairs well with syntastic - provides location list
  " shortcuts
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-characterize')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-rsi')
  call dein#add('AndrewRadev/splitjoin.vim')

  " Movements
  call dein#add('tpope/vim-surround')
  call dein#add('justinmk/vim-sneak')
  call dein#add('wellle/targets.vim')

  " Text objects
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-entire')
  call dein#add('kana/vim-textobj-function')
  call dein#add('kana/vim-textobj-line')
  call dein#add('coderifous/textobj-word-column.vim')

  " more from kana
  call dein#add('kana/vim-smartinput')
  call dein#add('kana/vim-niceblock')

  if has('nvim') && has('python3')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('wokalski/autocomplete-flow')
    call dein#add('zchee/deoplete-go', {'build': 'make', 'on_ft': ['go']})
    call dein#add('eagletmt/neco-ghc')
  endif
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')

  call dein#add('neoclide/vim-easygit')
  call dein#add('godlygeek/tabular')

  " Language support
  call dein#add('pangloss/vim-javascript', {'on_ft': ['javascript', 'jsx']})
  call dein#add('mxw/vim-jsx', {'on_ft': ['javascript', 'jsx']})
  call dein#add('flowtype/vim-flow', {'on_ft': ['javascript', 'jsx'], 'augroup': 'vim_flow'})
  call dein#add('maksimr/vim-jsbeautify', {'on_ft': ['javascript', 'jsx']})
  call dein#add('tpope/vim-markdown')
  call dein#add('lambdatoast/elm.vim')
  call dein#add('idris-hackers/idris-vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('derekwyatt/vim-scala', {'on_ft': ['scala']})
  call dein#add('vim-pandoc/vim-pandoc')
  call dein#add('vim-pandoc/vim-pandoc-syntax')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('fatih/vim-go', {'on_ft': ['go']})

  " Formatting
  call dein#add('hallettj/vim-sleuth')
  call dein#add('sbdchd/neoformat')

  " Visuals
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('drmikehenry/vim-fontdetect')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  if has('nvim')
    call dein#add('machakann/vim-highlightedyank')
  endif

  " Tmux integration
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('hallettj/tmux-config')
  call dein#add('tpope/vim-tbone')

  call dein#add('907th/vim-auto-save')
  call dein#add('mtth/scratch.vim')

  call dein#add('neomake/neomake')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Don't need netrw - we are using dirvish instead
let g:loaded_netrwPlugin = 1

set encoding=utf-8
set scrolloff=3
set wildmode=longest
if has ('ttyfast')
  set ttyfast
endif

" Make searches case-sensitive only when capital letters are included.
set ignorecase
set smartcase
set nohlsearch

" Wrap long lines
set wrap
set textwidth=80
set formatoptions=cqrn1

" Default indentation options
set tabstop=4
set shiftwidth=4
set noexpandtab

" Ask vim-sleuth to respect the 4-space tabstop setting
let g:SleuthDefaultWidth = &tabstop

" Displays visible characters for tab and end-of-line characters.
if has('gui_running')
  " do nothing
else
  set t_ZH=[3m
  set t_ZR=[23m
endif
set listchars=tab:▸\ ,trail:·
set conceallevel=0 concealcursor=c

" Highlights the given column.
set colorcolumn=80

" Store temp files in a central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if has('gui_running')
  " Remove menu bar, toolbar, and scrollbars
  set guioptions+=mTLlRrb
  set guioptions-=mTLlRrb

  " Overridden in airline customization
  set guifont=Ubuntu\ Mono\ 12
endif

" Don't keep swap files.
set noswapfile
set nobackup
set writebackup

" Load matchit to bounce between do and end in Ruby and between opening
" and closing tags in HTML.
if !has('gui_running')
  set noshowmatch
  let loaded_matchparen = 1  " Prevents DoMatchParen plugin from loading.
endif

" I don't want code to be folded when I open a file.
set nofoldenable

" vim-pandoc/vim-pandoc {{{
  let g:pandoc#modules#disabled = ["chdir"]
"}}}

" Raimondi/delimitMate {{{
  let delimitMate_expand_cr          = 1
  let delimitMate_expand_space       = 1
  let delimitMate_balance_matchpairs = 1
  let delimitMate_jump_expansion     = 1
"}}}

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") && &filetype != 'gitcommit' | exe "'\"" | endif
endif

runtime! init.d/*.vim
