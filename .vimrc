syntax enable

se expandtab
se nu
se nocompatible
se showmatch
se mouse=a
se ts=2
se laststatus=2
se sw=2
se autoindent
se smartindent
se noshowmode
se background=dark

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set scrolloff=10
set t_Co=256

filetype indent plugin on
execute pathogen#infect()

set rtp+=~/.fzf

let g:powerline_pycmd="py3"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
let loaded_matchparen = 1

map <C-n> :NERDTreeToggle<CR>

colorscheme hybrid

if !empty(glob("~/.vimrc.local"))
  source ~/.vimrc.local
end
