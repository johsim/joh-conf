sr() {
    # Search replace recursively in directory
    if test $# -lt 2; then
        echo "Usage: sr old_str new_str file_glob[opt]"
        return
    fi

    if ! $(rg $1 -q); then
        echo "No occurrences of $1 found, exiting..."
        return
    fi

    if [ -z $3 ]; then
       file_glob=""
       file_msg="in all files"
    else
      file_glob=$3
      file_msg="in all files matching $file_glob"
    fi

    rg $1 -C 3 -g "$file_glob"

    msg="Do you want to replace $1 with $2 $file_msg? (y/n)"
    read "? > $msg " yn
    case $yn in
      [Yy]* ) ;;
      * ) return;;
    esac

    # Change sed delimiter if any str contains "@"
    rg $1 -l -g "$file_glob" | xargs sed -i -e "s@$1@$2@g"
}

svenv() {
    # Switch between python virtual environments
    local venv=$(pyenv virtualenvs --bare | fzf --height 50% --reverse --border --cycle --select-1 --query "$*")
    test -z "${venv[*]}" && return
    pyenv activate $venv
}

awsl() {
  local role_args role u
  user="johanna.simonsson"

  # Login
  avail_roles=$(aws-login-tool list-roles --okta -m -u "$user")
  role_args=($(echo $avail_roles | sort | fzf --height 50% --border --cycle --select-1 --query "$*"))
  test -z "${role_args[*]}" && return
  eval "$(aws-login-tool login --okta -u "$user" $role_args)"

  role_profile="${role_args[4]}@${role_args[2]}"
  echo "Account Number: $(aws_account)"
}

aws() {
  if [[ -n "$AWS_SESSION_EXPIRATION_TIME" ]] && [[ -n "$AWS_PROFILE" ]] && \
      (( $(date +%s) > AWS_SESSION_EXPIRATION_TIME )); then
    echo "AWS session about to expire, acquiring new credentials." >&2
    eval "$(
      aws-login-tool login --okta -a "${AWS_PROFILE##*@}" -r "${AWS_PROFILE%%@*}" \
    )" || return
  fi
  command aws "$@"
}

aws_account() {
  command aws sts get-caller-identity --profile "$role_profile" --output text --query 'Account'
}

bwl() {
  echo "Input password:"
  read -s password
  echo "Input Auth code:"
  read code
  session_key=$(bw login $HOME_EMAIL $password --code $code --method 0 --raw)
  export BW_SESSION=$session_key
  echo "Session key configured to $session_key"
}
