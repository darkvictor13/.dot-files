" Trabalhando com latex
" Quando sai do latex exlui arquivos temporarios
autocmd BufWinLeave *.tex silent! execute "!latexmk %:r -pdf && latexmk -c"
" Preview no latex 
autocmd FileType tex nmap <F6> :LLPStartPreview <CR> 
" Abrindo arquivos latex de forma correta
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Compilar em c
autocmd FileType c map <F6> :!gcc %:r.c -o %:r -lm &<Enter>
autocmd FileType cpp map <F6> :silent !g++ %:r.cpp -o %:r &<Enter>

" Carrega dicionario em português
autocmd FileType c,cpp,text,tex,gitcommit set spell spelllang=pt 

" Abre um novo arquivo no modo insert
autocmd BufNewFile * startinsert
autocmd FileType gitcommit startinsert

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
