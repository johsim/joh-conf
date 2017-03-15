ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

prompt_kubecontext() {
    local current_context
    current_context=`kubectl config current-context`
    if [[ $current_context  == "minikube" ]]; then
	echo "%{$fg[green]%}minikube%{$reset_color%}"
    else
	echo "%{$fg_bold[red]%}$current_context%{$reset_color%}"
    fi
}

PROMPT='$(prompt_kubecontext) %{$fg[yellow]%}🟊 %{$fg_bold[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
