# faz o pathogen rodar
execute pathogen#infect()
filetype plugin indent on

" sincroniza clipboard com o buffer do vim
set clipboard+=unnamedplus

" muda a tecla do leader
let mapleader =","

" ########### Os meus plugins ########### 

" lightline
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \     'active': {
			\     'left' : [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
      \			'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
      \		}
	  \ }

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

" Criando snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
