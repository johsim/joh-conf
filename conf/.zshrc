# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/joh-conf/conf/zsh_custom

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="favorite_theme"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting) #NOTE Highlighting must be last

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)
export EDITOR="emacs -nw"
alias enw="emacs -nw"
alias emw="emacs -nw"
zstyle ':completion:*' special-dirs true #Fixes cd ..<TAB>

# Source autojump
. /usr/share/autojump/autojump.sh

[[ $COLORTERM = gnome-terminal ]] && TERM=xterm-256color ## Make Terminator support 256 colours

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
