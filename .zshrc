###############################################################
# Arquivo de configuracao modificado por :                    #
# __     ___      _                                           #
# \ \   / (_) ___| |_ ___  _ __                               #
#  \ \ / /| |/ __| __/ _ \| '__|                              #
#   \ V / | | (__| || (_) | |                                 #
#    \_/  |_|\___|\__\___/|_|                                 #
#                                                             #
###############################################################
# Esse arquivo de configuracao vem por padrao em (~/.zshrc)   #
#                                                             #
# Ou seja meu link simbolico ficou assim                      #
# (ln -s ~/Repos/.dot-files/.zshrc ~/.zshrc)                  #
#                                                             # 
###############################################################

# Muda o local do history file
HISTFILE=~/zsh/.zsh_history
# Path to your oh-my-zsh installation.
export ZSH="/home/victor/zsh/.oh-my-zsh"
# Escolhe o tema
ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Puxando minhas configs
source $ZSH/oh-my-zsh.sh
source ~/zsh/functions.zsh
source ~/zsh/alias.zsh

#configs do luke smith, modo vim interativo
bindkey -v
export KEYTIMEOUT=1

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

### Added by Zinit's installer
if [[ ! -f $HOME/zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/zsh/.zinit" && command chmod g-rwX "$HOME/zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi

source "$HOME/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
