alias ls="ls -F"

export PS1='%# '

autoload -Uz compinit && compinit

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

eval "$(/opt/homebrew/bin/brew shellenv)"
