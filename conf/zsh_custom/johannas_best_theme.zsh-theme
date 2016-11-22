PROMPT='$(prompt_kubecontext) %{$fg[yellow]%}🟊 %{$fg_bold[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[orange]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

prompt_kubecontext() {
    if [[ $(kubectl config current-context) == *"minikube"* ]]; then
	echo "%{$fg[green]%}minikube%{$reset_color%}"
    else
	echo "%{$fg_bold[red]%}`kubectl config current-context`%{$reset_color%}"
    fi
}
