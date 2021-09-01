" Abre um novo arquivo no modo insert
" autocmd BufNewFile * start
" autocmd FileType gitcommit startinsert

" Trabalhando com latex
" Quando sai do latex exlui arquivos temporarios
autocmd BufWinLeave *.tex silent!execute "!latexmk %:r -pdf && latexmk -c"
" Preview no latex 
autocmd FileType tex nmap <F6> :LLPStartPreview <CR> 
" autocmd FileType tex nmap <F6> :!latexmk %:r -pvc -pdf -pv
" Abrindo arquivos latex de forma correta
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Compilar em JAVA
autocmd FileType java map <F6> :!javac %:r.java &<Enter>
" Compilar em c
autocmd FileType c map <F6> :!gcc %:r.c -std=c11 -O2 -o %:r -lm &<Enter>
" autocmd FileType c map <F6> :zsh compile("%:r") &<Enter>
" Copilar c++
autocmd FileType cpp map <F6> :!g++ %:r.cpp -std=c++17 -O2 -lm -o %:r &<Enter>
" Copilar assembly
autocmd FileType asm map <F6> :!nasm -f elf64 %:r.asm && ld %:r.o -o %:r.x &<Enter>
" Não funciona
" autocmd FileType asm map <F6> :!compile %:r &<Enter>

" silent!execute "FILE=%:r"
" map <leader>c :!export FILE=%:r && printenv FILE
" map <F6> <m-=>compile $FILE

" Carrega dicionario em português
autocmd FileType * set spelllang=pt 
autocmd FileType c,cpp,text,tex,gitcommit,snippets set spell

" Disables automatic commenting on newline:
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
