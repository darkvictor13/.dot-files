"###############################################################
"# Arquivo de configuracao modificado por :                    #
"# __     ___      _                                           #
"# \ \   / (_) ___| |_ ___  _ __                               #
"#  \ \ / /| |/ __| __/ _ \| '__|                              #
"#   \ V / | | (__| || (_) | |                                 #
"#    \_/  |_|\___|\__\___/|_|                                 #
"#                                                             #
"###############################################################
"# Esse arquivo de configuração vem por padrão em (~/.vimrc)   #
"#                                                             #
"# Ou seja meu link simbólico ficou assim                      #
"# (ln -s ~/Repos/.dot-files/.vimrc ~/.vimrc)                  #
"#                                                             # 
"###############################################################

" Fazendo rodar o pathogen
execute pathogen#infect()
filetype plugin indent on

" Todos os sets e configs basicas
source $HOME/.vim/configs/basico.vim
" Faz todas as configs dos plugins
source $HOME/.vim/configs/plugins.vim
" Configura os remaps
source $HOME/.vim/configs/remaps.vim
" Todos os meus auto comands
source $HOME/.vim/configs/autocmds.vim
