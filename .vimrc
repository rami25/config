"General settings
set mouse=a
map <WheelUp> <C-Y>
map <WheelDown> <C-E>
set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set number
set relativenumber
set cino+=L0
syntax on
filetype indent on
setlocal indentkeys-=:

"keybindings
inoremap {}   {}
imap jk <Esc> 
imap nl '\n'
imap NL '\n'
vmap v <Esc>

":map q : set paste<C-Enter>
":map z : set paste!<C-Enter>
set belloff=all

"onedark.vim override: Set a custom background color in the terminal
colorscheme onehalfdark
set termguicolors
let g:airline_powerline_fonts = 1
set t_Co=256


"Theme (requires Solarized Light terminal theme to work properly)

" let g:solarized_termcolors=256
" set background=light
" colorscheme solarized

" WSL yank support
"Clipboard configuration
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif