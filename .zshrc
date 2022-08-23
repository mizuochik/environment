alias ls="ls -F"

export PS1='%# '
export EDITOR='nano'

autoload -Uz compinit && compinit

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

export ZLE_REMOVE_SUFFIX_CHARS=

alias py=python3

[ -f ~/google-cloud-sdk/path.zsh.inc ] && . ~/google-cloud-sdk/path.zsh.inc
[ -f ~/google-cloud-sdk/completion.zsh.inc ] && . ~/google-cloud-sdk/completion.zsh.inc

export GOOGLE_APPLICATION_CREDENTIALS=~/.google-application-credentials.json
