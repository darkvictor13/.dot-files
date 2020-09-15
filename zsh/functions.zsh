# funcao para adicionar no git de forma automatica
function auto_git() {
  git add -A
  [ -z "$1" ] && git commit || git commit -m "$1"
  git push
}

# funcao compilando
function compile() {
  case $1 in
    *.c)      gcc $1 -o exec -lm  ;;
    *.cpp)    g++ $1 -o exec      ;;
    #*.asm)    "nasm -f elf64 $1 && ld  ";;
  esac
}
function compile_run() {
  gcc $1.c -o $1 -lm && ./$1
}

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
