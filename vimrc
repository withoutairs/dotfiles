set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'henrik/vim-open-url'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdtree.git'

" vim-scripts repos
Bundle 'L9'
" non github repos
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!

" relative line numbers
Bundle 'myusuf3/numbers'
nnoremap <F3> :NumbersToggle<CR>

nnoremap ; :NERDTreeToggle<CR>
Bundle 'https://github.com/scrooloose/nerdtree'

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

" todo
Bundle "vimoutliner/vimoutliner"

" quiet down
set visualbell

" tab-completion for commands
set wildmenu
set wildmode=longest,list,full

" crontab
" http://tim.theenchanter.com/2008/07/crontab-temp-file-must-be-edited-in.html
set backupskip=/tmp/*,/private/tmp/*

" vim-airline
Bundle 'bling/vim-airline'
set laststatus=2

" F5 to insert current date/time
:nnoremap <F5> "=strftime("%FT%T")<CR>P
:inoremap <F5> <C-R>=strftime("%FT%T")<CR>
