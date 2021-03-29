"__/\\\________/\\\___/\\\\\\\\\\\___/\\\\____________/\\\\_        
"_\/\\\_______\/\\\__\/////\\\///___\/\\\\\\________/\\\\\\_       
" _\//\\\______/\\\_______\/\\\______\/\\\//\\\____/\\\//\\\_      
"  __\//\\\____/\\\________\/\\\______\/\\\\///\\\/\\\/_\/\\\_     
"   ___\//\\\__/\\\_________\/\\\______\/\\\__\///\\\/___\/\\\_    
"    ____\//\\\/\\\__________\/\\\______\/\\\____\///_____\/\\\_   
"     _____\//\\\\\___________\/\\\______\/\\\_____________\/\\\_  
"      ______\//\\\_________/\\\\\\\\\\\__\/\\\_____________\/\\\_ 
"       _______\///_________\///////////___\///______________\///__
"  vim.rc file 
"


"######################################################################
"#       VIM PLUGINS
"######################################################################

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ycm-core/YouCompleteMe', {'do':'./install.py'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dracula/vim'
Plug 'tlhr/anderson.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'

" Initialize plugin system
call plug#end()


" ========================================================================
map <C-n> :NERDTreeToggle<CR>
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

"######################################################################
"#           YouCompleteMe config
"######################################################################

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']
map <C-]> :YcmCompleter GoToImprecise<CR>
let g:ycm_global_ycm_extra_conf = '/home/mazin/.ycm_extra_conf.py'

" Gecko includes a .ycm_extra_conf.py file in the root directory.
" Update this glob path to your Gecko source code location.
let g:ycm_extra_conf_globlist = ['~/Dev/gecko/*']

" This is less secure, but this option will load any ycm config
" file found without a confirmation.
" let g:ycm_confirm_extra_conf = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = {
  \   'python': [ 'import ' ]
  \ }
let g:ycm_filetype_whitelist = {
  \ '*': 1,
  \ 'ycm_nofiletype': 1
   \ }
let g:ycm_filetype_blacklist = {
            \ 'help': 1,
            \ 'vimwiki': 1}
" Snippets are separated from the engine. Add this if you want them:

"######################################################################
"#       UltiSnips
"######################################################################

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ale_fixers = ['clang-format','clangtidy']
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

"######################################################################
"#       Auto commands and set options
"######################################################################

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
set number
syntax on
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
set noshowmode
set laststatus=2 
set tabstop=4
set autoindent
set smartindent
set shiftwidth=4
set expandtab
colorscheme dracula
set encoding=utf-8 
set fileencoding=utf-8

