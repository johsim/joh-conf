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

prompt_sep() {
    echo "%{$fg_bold[yellow]%}🟊 %{$reset_color%}"
}

prompt_dir() {
    current_path=${PWD##*/}
    home=${HOME##*/}
    typeset -A emojis
    typeset -A colors
    emojis[$home]="🏛"
    colors[$home]="%{$fg_bold[cyan]%}"
    emojis[python]="🐍"
    colors[python]="%{$fg_bold[green]%}"
    emojis[APT]="⭕"
    colors[APT]="%{$fg_bold[cyan]%}"
    emojis[credentials]="🗝"
    colors[credentials]="%{$fg_bold[cyan]%}"
    emojis[Downloads]="⬇"
    colors[Downloads]="%{$fg_bold[green]%}"
    emojis[kubernetes-cluster]="☸ -cluster"
    colors[kubernetes-cluster]="%{$FG[039]%}"


    color="%{$fg_bold[cyan]%}"
    display_path=$current_path
    for path emoji in ${(kv)emojis}
    do
        if [[ $current_path == $path ]]; then
            color=$colors[$path]
            display_path="$emoji "
            break
        fi
    done

    echo "$color$display_path%{$reset_color%}"
}
kubectl_prompt=''
kubectl_installed=$(type kubectl)
if [[ $kubectl_installed != 0 ]]; then
    kubectl_prompt=$(prompt_kubecontext)
fi
PROMPT='$kubectl_prompt $(prompt_dir) $(prompt_sep) $(git_prompt_info)'
