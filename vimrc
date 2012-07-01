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
" vim-scripts repos
Bundle 'L9'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!

let mapleader = ","

" Tabs, Spaces and Indentation.
set expandtab " Use spaces for tabs.
set tabstop=2 " Number of spaces to use for tabs.
set shiftwidth=2 " Number of spaces to autoindent.
set softtabstop=2 " Number of spaces for a tab.
set autoindent " Set autoindenting on.
set smartindent " Automatically insert another level of indent when needed. 

" colors, etc.
syntax on
set background=dark
colorscheme solarized

" Make jj exit insert mode (since it's almost never typed normally).
imap jj <Esc>:w<CR>

