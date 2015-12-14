set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'henrik/vim-open-url'
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'

" vim-scripts repos
Plugin 'L9'
" non github repos
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin indent on     " required!

" relative line numbers
Plugin 'myusuf3/numbers'
nnoremap <F3> :NumbersToggle<CR>

nnoremap ; :NERDTreeToggle<CR>
Plugin 'https://github.com/scrooloose/nerdtree'

" Tabs, Spaces and Indentation.
set expandtab " Use spaces for tabs.
set tabstop=2 " Number of spaces to use for tabs.
set shiftwidth=2 " Number of spaces to autoindent.
set softtabstop=2 " Number of spaces for a tab.
set autoindent " Set autoindenting on.
set smartindent " Automatically insert another level of indent when needed. 

" colors, etc.
syntax on
if has('gui_running')
  set background=dark
endif
colorscheme solarized

" Make jj exit insert mode (since it's almost never typed normally).
imap jj <Esc>:w<CR>

" quiet down
set visualbell

" tab-completion for commands
set wildmenu
set wildmode=longest,list,full

" crontab
" http://tim.theenchanter.com/2008/07/crontab-temp-file-must-be-edited-in.html
set backupskip=/tmp/*,/private/tmp/*

" vim-airline
Plugin 'bling/vim-airline'
set laststatus=2

" F5 to insert current date/time
:nnoremap <F5> "=strftime("%FT%T")<CR>P
:inoremap <F5> <C-R>=strftime("%FT%T")<CR>

set incsearch

autocmd BufWritePost * execute ':silent ! if [ -d .git -a -f todo.txt ]; then git commit -a -m %; fi'
