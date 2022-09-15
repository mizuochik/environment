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

export HISTSIZE=100000

[ -f ~/google-cloud-sdk/path.zsh.inc ] && . ~/google-cloud-sdk/path.zsh.inc
[ -f ~/google-cloud-sdk/completion.zsh.inc ] && . ~/google-cloud-sdk/completion.zsh.inc

export GOOGLE_APPLICATION_CREDENTIALS=~/.google-application-credentials.json

export PATH=/usr/local/bin:$PATH

setopt share_history

alias cc="cargo test && cargo fix --allow-staged --allow-dirty && cargo fmt --all && cargo clippy && echo ok"

export PYTHONPATH=python/*
