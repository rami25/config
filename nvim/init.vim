:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a 
imap jk <Esc>
tnoremap jk <C-\><C-n>
imap nl "\n"
imap NL "\n"
noremap <TAB> %
nnoremap <C-w> <C-w>w 
tnoremap <C-d> :q<CR> 
tnoremap <C-d> <C-\><C-n>:q<CR>

noremap zz :set foldmethod=syntax<CR>
set foldmethod=syntax
set foldlevel=99
set nofoldenable

call plug#begin('~/.config/nvim/plugged')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
" Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/Raimondi/delimitMate'
call plug#end()

"auto-complete
inoremap <expr> <A-j> coc#pum#visible() ? coc#pum#next(1) : "\<A-j>"
inoremap <expr> <A-k> coc#pum#visible() ? coc#pum#prev(1) : "\<A-k>"
inoremap <expr> <A-n> coc#pum#visible() ? coc#pum#confirm() : "\<A-n>"

" use <c-space> for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" " Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()
let g:coc_global_extensions = ['coc-clangd']
let g:coc_disable_startup_warning = 1

" let g:airline_left_sep = '>'
" let g:airline_right_sep = '<'

"fzf
noremap <silent> <C-f> :Files<CR>
nnoremap <silent> <A-o> :Buffers<CR>
nmap <C-q> <Plug>(fzf-diagnostics-handler)
let g:fzf_layout = { 'down' : '25%' }

nmap <F8> :TagbarToggle<CR>
let g:airline#extensions#whitespace#enabled = 0 " Enable whitespace indicators
let g:airline_theme= 'onedark'
" colorscheme onehalfdark
set termguicolors
" set t_Co=256

" Set the colorscheme for C++ files
autocmd BufReadPre,FileReadPre *.cpp colorscheme molokai
" Set the colorscheme for Python files
autocmd BufReadPre,FileReadPre *.py colorscheme solarized8_high

" :colorscheme molokai
:colorscheme solarized8_high

"c++ file compiling
nnoremap <F10> <ESC> :w <CR> :!g++ -std=c++17 -Wall -Wextra -Wshadow -fsanitize=address -D_DEBUG -O2 % -o %< && ./%< <CR>

"hterm
command! ToggleHTerm call ToggleHTerminal()
function! ToggleHTerminal() 
	w | below new | term 
	exec 'resize 10'
	exec 'setlocal nornu nonu'
endfunction
nnoremap <F11> :ToggleHTerm <CR> <A-a>
inoremap <F11> <C-o>:ToggleHTerm <CR> 

"vterm
command! ToggleVTerm call ToggleVTerminal()
function! ToggleVTerminal() 
	w | rightbelow vnew | vertical resize 60 | term 
	exec 'setlocal nornu nonu'
endfunction
nnoremap <F12> :ToggleVTerm <CR> <A-a>
inoremap <F12> <C-o>:ToggleVTerm <CR> 

"Clipboard configuration
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
