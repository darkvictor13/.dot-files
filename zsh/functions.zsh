# funcao para adicionar no git de forma automatica
function auto_git() {
  git add -A
  [ -z "$1" ] && git commit || git commit -m "$1"
  git push
}

# funcao compilando
function compile() {
  gcc $1.c -o $1 -lm
}
function compile_run() {
  gcc $1.c -o $1 -lm && ./$1
}
