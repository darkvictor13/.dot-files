"# Arquivo de configuracao modificado por :
"# __     ___      _
"# \ \   / (_) ___| |_ ___  _ __
"#  \ \ / /| |/ __| __/ _ \| '__|
"#   \ V / | | (__| || (_) | |
"#    \_/  |_|\___|\__\___/|_|
"#
"################################################################################
"# Esse arquivo de configuração vem por padrão em (~/.vimrc)                    #
"#                                                                              #
"# Ou seja meu link simbólico ficou assim                                       #
"# (ln -s ~/Repos/.dot-files/.vimrc ~/.vimrc)							                      #
"#                                                                              # 
"################################################################################

" Fazendo rodar o pathogen
execute pathogen#infect()
filetype plugin indent on

" configura a tecla leader
let mapleader =","

" ########### Os meus plugins ########### 

" Vim airline
"let g:airline_theme='bubblegum'
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='deus'

" Vim polyglot
" Detectando arquivo do i3
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Nerd Tree
" Abre Quando vc digita so vim sem arquivo
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Fecha caso so o NERDTree esteja ativo
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Bind para abrir
map <C-o> :NERDTreeToggle<CR>
" Configurando p git
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  :'✹',
      \ 'Staged'    :'✚',
      \ 'Untracked' :'✭',
      \ 'Renamed'   :'➜',
      \ 'Unmerged'  :'═',
      \ 'Deleted'   :'✖',
      \ 'Dirty'     :'✗',
      \ 'Ignored'   :'☒',
      \ 'Clean'     :'✔︎',
      \ 'Unknown'   :'?',
      \ }
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusUseNerdFonts = 1

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \ 'c' : ['re!\w{2}'],
  \ 'cpp' : ['re!\w{2}'],
  \ 'python' : ['re!\w{2}'],
  \ }

" Verificador de erros c/c++ syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Latex live Preview
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 1
"let g:livepreview_engine = 'latexmk' . '-pdf'

" Criando snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Indent Lines
"let g:indent_guides_enable_on_vim_startup = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
autocmd FileType tex let g:indentLine_enabled = 0


" ########### Configs do vim puro ########### 

" Trabalhando com latex
"autocmd FileType tex  map <C-p> :silent !qpdfview %:r.pdf &<Enter>
"autocmd FileType tex  map <C-p> :silent !evince %:r.pdf &<Enter>
"autocmd FileType tex  map <C-r> :silent !latexmk -pvc -pdf %:r.tex &<Enter>
"autocmd FileType tex  map <C-r> :silent !pdflatex %:r.tex &<Enter>
autocmd BufWinLeave *.tex silent! execute "!latexmk %:r -pdf && latexmk -c"
" Preview no latex 
autocmd FileType tex nmap <F6> :LLPStartPreview <CR> 

" Colocando os auto complete que estou acostumado
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
"inoremap { {}<left>
autocmd FileType c inoremap { {<Enter><Enter>}<up><Tab>

" Configuração do tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

"impede que o vim execute shellscripts indesejados, modo seguro
set exrc
set secure

" Configuração de aspectos visuais

" Esquemas de cores
"color spacecamp_lite
"color one-dark
color dracula
"color space-vim-dark
"color yellow-moon
"color abstract
"color atom
"color wombat256mod
"color apprentice

"highlight Comment ctermbg=Black ctermfg=White

syntax on
syntax enable
set showmatch
set number
set relativenumber
set showcmd
set noshowmode

" arruma o sistema de busca da tecla [/]
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>

" Arrumando a path
set path=$PWD/**

" Abrindo arquivos latex de forma correta
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Compilar em c
autocmd FileType c map <F6> :!gcc %:r.c -o %:r -lm &<Enter>
"autocmd FileType c map <F6> :silent !gcc %:r -lm && ./a.out &<Enter>
"autocmd FileType c map <F6> :QuickRunExecute<CR>
autocmd FileType cpp map <F6> :silent !g++ %:r.cpp -o %:r &<Enter>
"autocmd FileType c map <leader>s :terminal
"map <F6> :QuickRunExecute<CR>

" Carrega dicionario em português
autocmd FileType c set spell spelllang=pt 
autocmd FileType cpp set spell spelllang=pt 
autocmd FileType text set spell spelllang=pt 
autocmd FileType tex set spell spelllang=pt 
autocmd FileType gitcommit set spell spelllang=pt 

" Abre um novo arquivo no modo insert
autocmd BufNewFile * startinsert
autocmd FileType gitcommit startinsert

set encoding=utf-8

" Arrumando palavras escritas errado
nnoremap <leader>w 1z=ea
nnoremap <leader>z [s1z=A
inoremap <leader>z <esc>[s1z=A

" clipboard compartilhada, vim e resto do sistema
set clipboard=unnamedplus

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
