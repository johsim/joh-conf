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
    local venv=$(lsvirtualenv -b | fzf --height 50% --reverse --border --cycle --select-1 --query "$*")
    test -z "${venv[*]}" && return
    workon $venv
}
