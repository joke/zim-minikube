(( ${+commands[minikube]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[minikube]:-"$(${commands[asdf]} which minikube 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_minikube
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'minikube'. Regenerated completions."
  fi
} ${0:h}
