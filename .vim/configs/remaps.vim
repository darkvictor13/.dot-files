" Colocando os auto complete que estou acostumado
inoremap " ""<left>
autocmd FileType vim inoremap " " 
autocmd FileType sh inoremap # # 
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
autocmd FileType c inoremap { {<Enter><Enter>}<up><Tab>

" Arrumando palavras escritas errado
nnoremap <leader>w 1z=ea
nnoremap <leader>z [s1z=A
inoremap <leader>z <esc>[s1z=A