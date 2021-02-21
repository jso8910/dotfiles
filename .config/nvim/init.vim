syntax on
set nocompatible
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
syntax enable
set smartcase
set noswapfile
set nobackup
set incsearch

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/jason/.local/share/vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/jason/.local/share/vim')
  call dein#begin('/home/jason/.local/share/vim')

  " Let dein manage dein
  " Required:
  call dein#add('/home/jason/.local/share/vim/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/deoplete.nvim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
call deoplete#enable()
