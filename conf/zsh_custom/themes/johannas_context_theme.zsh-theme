ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

prompt_kubecontext() {
    if test ! -f '/usr/local/bin/kubectl' ; then
        echo "✨"
        return
    fi
    current_context=`kubectl config current-context`
    current_namespace=$(kubectl config view -o "jsonpath={.contexts[?(@.name==\"$current_context\")].context.namespace}")
    if [[ $current_context  == "minikube" ]]; then
        echo "%{$fg[green]%}minikube%{$reset_color%}"
    else
        echo "%{$fg_bold[red]%}$current_context/$current_namespace%{$reset_color%}"
    fi
}

prompt_aws() {
  if [[ -n "$AWS_PROFILE" ]]; then
    role=$(echo "${AWS_PROFILE%%@*}" | sed s/Klarna_ADFS_//)
    account="${AWS_PROFILE##*@}"
    echo "%{$fg_bold[yellow]%}${role##*.}@$account%{$reset_color%}"
  else
    return
  fi
}

prompt_sep() {
    echo "✨"
}

virtualenv_info(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
    else
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv)"
}

prompt_dir() {
    current_path=${PWD##*/}
    home=${HOME##*/}
    typeset -A emojis
    emojis[$home]="🏡"
    emojis[python]="🐍"
    emojis[APT]="⭕"
    emojis[credentials]="🔑"
    emojis[fishtank]="🐟🐟🐟"

    color="%{$fg_bold[cyan]%}"
    display_path=$current_path
    for path emoji in ${(kv)emojis}
    do
        if [[ $current_path == $path ]]; then
            color=""
            display_path="$emoji "
            break
        fi
    done

    echo "$color$display_path%{$reset_color%}"
}

PROMPT='$(virtualenv_info) $(prompt_aws) $(prompt_dir) $(prompt_sep) $(git_prompt_info)'
