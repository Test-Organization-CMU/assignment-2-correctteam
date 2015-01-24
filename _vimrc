execute pathogen#infect()
syntax enable
colorscheme monokai

set ruler

set nu

set hls

:nnoremap <leader>m :silent !open -a "Marked 2.app" '%:p'<cr>

set tabstop=4
set shiftwidth=4

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting
filetype plugin indent on

" For the NERD Tree plugin
" Open the NERDTree automatically when vim starts up.
" autocmd VimEnter * NERDTree
" Map a shortcut to toggle NERDTree
map <C-t> :NERDTreeToggle<CR>

" For the argdo command, enable the hidden option and ignore the modifications
" when running :bnext etc.
set hidden


""""""""" For the Taglist plugin

nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
