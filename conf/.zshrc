#ZSH
export ZSH=~/.oh-my-zsh
ZSH_THEME="kubernetes_context_theme"
ZSH_CUSTOM=~/joh-conf/conf/zsh_custom/
plugins=(git aws pip emoji python zsh-autosuggestions zsh-syntax-highlighting) #NOTE Highlighting must be last
source $ZSH/oh-my-zsh.sh

#Aliases
export EDITOR="emacs -nw"
alias enw="emacs -nw"
alias emw="emacs -nw"
alias k="kubectl"
alias todo="emacs -nw ~/Desktop/todo.org"
alias ccat='pygmentize -g' #Pretty print cat
alias c='pygmentize -g'
alias nyan='docker run -it supertest2014/nyan'
alias delete-merged="git branch --merged | grep -v '\*\|master\|develop' | xargs -n 1 git branch -d"
alias copy='xclip -sel clip'

#Autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

## Make Terminator support 256 colours
[[ $COLORTERM = gnome-terminal ]] && TERM=xterm-256color

#Fixes cd ..<TAB>
zstyle ':completion:*' special-dirs true
eval $(thefuck --alias)

#Copy paste emacs style
x-copy-region-as-kill () {
    zle copy-region-as-kill
    print -rn $CUTBUFFER | xclip -i
}
zle -N x-copy-region-as-kill
x-kill-region () {
    zle kill-region
    print -rn $CUTBUFFER | xclip -i
}
zle -N x-kill-region
x-yank () {
    CUTBUFFER=$(xclip -o)
    zle yank
}
zle -N x-yank
bindkey -e '\eW' x-copy-region-as-kill
bindkey -e '^W' x-kill-region
bindkey -e '^Y' x-yank

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


#Source dotfiles
for f in ~/joh-secrets/dotfiles/*; do
    . $f
done

# Custom profile
HOSTNAME=$(cat ~/hostname)
. "$HOME/joh-secrets/profiles/${HOSTNAME}_profile"

#Tiny care terminal
export TTC_BOTS='tinycarebot,selfcare_bot,Puns_Only'
export TTC_SAY_BOX='parrot'
export TTC_REPOS_DEPTH=2
export TTC_GITBOT='gitlog'
export TTC_WEATHER='Stockholm'
export TTC_CELSIUS=true
export TTC_APIKEYS=true
export TTC_UPDATE_INTERVAL=10
export TTC_TERMINAL_TITLE=false
