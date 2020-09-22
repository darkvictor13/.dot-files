# funcao para adicionar no git de forma automatica
function auto_git() {
  git add -A
  [ -z "$1" ] && git commit || git commit -m "$1"
  git push
}

# funcao compilando
function compile() {
  case $1 in
    *.c)      gcc $1 -o ${1%.c} -lm;;
    *.cpp)    g++ -Wall -pedantic $1 -o ${1%.cpp};;
    *.asm)    nasm -f elf64 $1 && ld ${1%.asm}.o -o ${1%.asm}.x;;
  esac
}

# Funcao 
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
