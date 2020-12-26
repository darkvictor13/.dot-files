" Vim airline
" let g:airline_theme='bubblegum'
" let g:airline_theme='deus'
let g:airline_theme='powerlineish'
let g:airline_symbols_ascii = 1
let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled=1
" if !exists('g:airline_symbols')
  " let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
" let g:airline#extensions#tabline#enabled = 1

" Vim polyglot
" Detectando arquivo do i3
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Nerd Tree
" Abre Quando vc digita so vim sem arquivo
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Fecha caso so o NERDTree esteja ativo
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Bind para abrir
map <C-o> :NERDTreeToggle<CR>
" Mostra as hiden files
let NERDTreeShowHidden=1
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
  \ 'java' : ['re!\w{2}'],
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
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 1
"let g:livepreview_engine = 'latexmk' . '-pdf'

" Criando snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>p"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Indent Lines
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
autocmd FileType tex let g:indentLine_enabled = 0

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" List of colors that you do not want. ANSI code or #RRGGBB
"let g:rainbow#blacklist =  [233, 234]
