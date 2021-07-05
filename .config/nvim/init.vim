syntax on
set nocompatible
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
syntax enable
set smartcase
set noswapfile
set nobackup
set incsearch
set mouse=a
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python'
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

let delimitMate_expand_cr = 1

let delimitMate_expand_space = 1

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

  call dein#add('neoclide/coc.nvim', { 'merged': 0 })

  "call dein#add('Shougo/deoplete.nvim')

  call dein#add('Raimondi/delimitMate')
  " Add or remove your plugins here like this:
  call dein#add('vimwiki/vimwiki')
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
"call deoplete#enable()

call plug#begin(stdpath('data') . '/plugged')
    Plug 'vimwiki/vimwiki'
call plug#end()


let g:vimwiki_list = [{'path': '$HOME/vimwiki/',                                
                     \ 'auto_diary_index': 1, 'auto_generate_links': 1,          
                     \ }]
