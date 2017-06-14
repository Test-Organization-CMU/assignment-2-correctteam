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
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-airline/vim-airline'
Plugin 'keith/swift.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'honza/vim-snippets'
" Plugin 'keith/swift.vim'
" Plugin 'ensime/ensime-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'lervag/vimtex'
Plugin 'vim-syntastic/syntastic'

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

set guifont=Inconsolata-dz\ for\ Powerline:h16

" Change cursor color so that highlighting is more visible
highlight Cursor guifg=Yellow guibg=Purple

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
	" Dash (Mac Only)
	let g:dash_activate=0
	:nmap <silent> <leader>d <Plug>DashSearch
endif

" vim-surround
let g:surround_126 = "~~\r~~"	" markdown strike
let g:surround_42 = "**\r**"	" markdown emphasize
let g:surround_95 = "_\r_"		" markdown italics

" " Ultisnips
let g:UltiSnipsExpandTrigger = "<c-h>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsEditSplit = "vertical"

""""""""""""""""""""
" vim-airline
""""""""""""""""""""
let g:airline_detect_modified=1
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""
" Syntastic
""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ignore_files = ['\m\.sbt$', '\m\.tex$']	" Avoid checking .sbt files and tex files
" let g:syntastic_scala_checkers = ['fsc']
" let g:syntastic_tex_checkers = ['chktex']

""""""""""""""""
" ENSIME
""""""""""""""""
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>t :EnTypeCheck<CR>

""""""""""""""""
" ack.vim
""""""""""""""""
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""
" vimtex
"""""""""""""""
" let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_method = 'skim'
let g:vimtex_complete_recursive_bib = 1
let g:vimtex_quickfix_warnings = {
	\ 'overfull': 0,
	\ 'Underfull': 0,
	\}
let g:vimtex_compiler_latexmk = {
\ 'background' : 0,
\ 'build_dir' : '',
\ 'callback' : 1,
\ 'continuous' : 1,
\ 'options' : [
\   '-pdf',
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}

" This adds a callback hook that updates Skim after compilation
" let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
" function! UpdateSkim(status)
"   if !a:status | return | endif

"   let l:out = b:vimtex.out()
"   let l:tex = expand('%:p')
"   let l:cmd = [g:vimtex_view_general_viewer, '-r']
"   if !empty(system('pgrep Skim'))
" 	call extend(l:cmd, ['-g'])
"   endif
"   if has('nvim')
" 	call jobstart(l:cmd + [line('.'), l:out, l:tex])
"   elseif has('job')
" 	call job_start(l:cmd + [line('.'), l:out, l:tex])
"   else
" 	call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
"   endif
" endfunction


set clipboard=unnamed

""""""""""""""
" Ensime 
""""""""""""""
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>t :EnTypeCheck<CR>


"""""""""""""""""""""""""""
" Distraction Free Editing
"""""""""""""""""""""""""""
" Turn on distraction free writing mode for latex files
" au BufNewFile,BufRead *.{tex,bib} call DistractionFreeWriting()

function! DistractionFreeWriting()
	let g:airline#extensions#tabline#enabled = 0
	set background=light
	set lines=40 columns=100	" size of the editable area
	set linespace=5
	set fuoptions=background:#00f5f6f6	" MacVim background color
	set guioptions-=r	" remove MacVim right scroll bar
	" set fullscreen	" go to full screen mode
	set tw=80
	setlocal spell
endfunction

""""""""""""""""""""""
" Personal Key Mapping
""""""""""""""""""""""
nmap <leader>q gqip
