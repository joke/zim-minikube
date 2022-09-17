(( ${+commands[minikube]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[minikube]:-"$(${commands[asdf]} which minikube 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_minikube
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion zsh >| $compfile
} ${0:h}
