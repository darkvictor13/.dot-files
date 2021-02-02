syntax on
syntax enable
set encoding=utf-8
set showmatch
set number
set relativenumber
set showcmd
set noshowmode
" Configuração do tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
" configura a tecla leader
let mapleader =","
"impede que o vim execute shellscripts indesejados, modo seguro
set secure
set exrc
" arruma o sistema de busca da tecla [/]
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>
" Arrumando a path
set path=$PWD/**
" clipboard compartilhada, vim e resto do sistema
set clipboard=unnamedplus

" ALgumas coisas clicaveis
set mouse=a

" Decidindo o colorscheme
color dracula
"color spacecamp_lite
"color one-dark
"color space-vim-dark
"color yellow-moon
"color abstract
"color atom
"color wombat256mod
"color apprentice
