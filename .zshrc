if [[ ~/.zshrc.local ]]
then
    source ~/.zshrc.local
fi

alias ls="ls -F"

export EDITOR='nano'

export HISTSIZE=999999
export PATH=~/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH=~/zig:$PATH

setopt share_history
export PATH=./node_modules/.bin:$PATH

alias ls="ls -F"
alias curl="curl -s"

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH

autoload -U compinit && compinit

zstyle ':completion:*:*:git:*' script /opt/homebrew/etc/bash_completion.d/git-completion.bash

source <(direnv hook zsh)
source <(kubectl completion zsh)
