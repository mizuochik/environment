alias ls="ls -F"

export PS1='%# '
export EDITOR='nano'

autoload -Uz compinit && compinit

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$(brew --prefix)/bin:$PATH"

export NODE_PATH="$(npm root -g)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

export ZLE_REMOVE_SUFFIX_CHARS=
export HISTSIZE=999999
export PATH=~/bin:/usr/local/bin:$PATH
setopt share_history
export PATH=./node_modules/.bin:$PATH

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
