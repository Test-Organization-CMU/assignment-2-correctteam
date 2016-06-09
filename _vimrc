set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-airline/vim-airline'
Plugin 'rizzatti/dash.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
syntax enable
" colorscheme monokai
set background=dark
colorscheme hybrid

set ruler
set nu
set hls

" Enable project specific vim settings
set exrc

if has("Darwin")
	:nnoremap <leader>m :silent !open -a "Marked 2.app" '%:p'<cr>
	" Open Marked 2 with \m
endif

set tabstop=4
set shiftwidth=4


""""""""""""""""""""""""""""""""""""""""
" NerdTree Plugin
""""""""""""""""""""""""""""""""""""""""
" Open NERDTree automatically when vim starts up
" autocmd VimEnter * NERDTree
" Map a shortcut to toggle NERDTree
map <C-a> :NERDTreeToggle<CR>
" close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" For the argdo command, enable the hidden option and ignore the modifications
" when running :bnext etc.
set hidden

nnoremap <F5> :!ctags -R<CR>

" Toggle taglist.vim
nnoremap <silent> <F8> : TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1


" Write better git commit messages
autocmd filetype gitcommit setlocal spell textwidth=72


" Options for CtrlP plugin
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Options for vim-markdown
let g:vim_markdown_folding_disabled=1

inoremap <C-q> <ESC>

if has("Darwin")
	" Vim-Latex Suite 
	filetype plugin on
	set grepprg=grep\ -nH\ $*
	filetype indent on
	let g:tex_flavor='latex'
	let g:Tex_ViewRule_pdf = '/Applications/Skim.app/Contents/MacOS/Skim'
	let g:Tex_GotoError=0
	let g:Tex_DefaultTargetFormat='pdf'
	let g:Tex_MultipleCompileFormats='pdf'

	" PDF sync
	let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
	map ,ls :w<CR> :silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>

	" Dash (Mac Only)
	let g:dash_activate=0
	:nmap <silent> <leader>d <Plug>DashSearch
endif

" vim-surround
let g:surround_126 = "~~\r~~"	" markdown strike
let g:surround_42 = "**\r**"	" markdown emphasize
let g:surround_95 = "_\r_"		" markdown italics

" Ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsEditSplit = "vertical"

""""""""""""""""""""
" vim-airline
""""""""""""""""""""
let g:airline_detect_modified=1

