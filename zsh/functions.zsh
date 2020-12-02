# funcao para adicionar no git de forma automatic5
function auto_git() {
  git add -A
  [ -z "$1" ] && git commit || git commit -m "$1"
  git push
}

function nasm_compile() {
  echo -n "Esse programa usa funções do C? [Y/n] "
  read VAR # read keyboard input
  FIRSTLETTER=${VAR:0:1} # get the first letter of keyboard input
  UPPER="$(echo $FIRSTLETTER | tr a-z A-Z)" # Captalize the letter

  # compare the captlize letter with "N"
  if [ "$UPPER" = "N" ]; then
    nasm -f elf64 $1 && ld ${1%.asm}.o -o ${1%.asm}.x && rm ${1%.asm}.o
  else
    nasm -f elf64 $1 && gcc -no-pie ${1%.asm}.o -o ${1%.asm}.x && rm ${1%.asm}.o
  fi
}

# The latexmk -c dont clear all files
# pre-contidion:
# the .tex in file name needs to be removed
function clear_tex_directory() {
  rm $(ls | grep -v "$1.pdf" | grep -v "$1.tex" | grep -v *.bib)
}


function tex_compile() {
  latexmk -pdf $1 && clear_tex_directory ${1%.tex}
}

# funcao compilando
function compile() {
  case $1 in
    *.c)      gcc $1 -o ${1%.c} -lm ;;
    *.cpp)    g++ -Wall -pedantic $1 -o ${1%.cpp} ;;
    *.asm)    nasm_compile $1 ;;
    *.tex)    tex_compile $1 ;;
  esac
}

function vim() {
  export FILE=$1 && /bin/vim $@
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
