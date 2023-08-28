[[ -r ~/.bashrc_private ]] && . ~/.bashrc_private

export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="$ "
export EDITOR=dew
export HISTSIZE=999999
export SHELL_SESSION_HISTORY=0

shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=~/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH=~/zig:$PATH
export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH
export CDPATH=.:~/Projects
source ~/.cargo/env

alias ls="ls -F"
alias curl="curl -s"

if type brew &> /dev/null
then
  BREW_PREFIX=$(brew --prefix)
  [[ -r $BREW_PREFIX/etc/bash_completion ]] && . $BREW_PREFIX/etc/bash_completion
  COMPLETION_D="$BREW_PREFIX/etc/bash_completion.d"
  [[ -r $COMPLETION_D/git-completion.bash ]] && . "$COMPLETION_D/git-completion.bash"
  [[ -r $COMPLETION_D/helm ]] && . "$COMPLETION_D/helm"
fi
if [[ -d ~/etc/bash_completion.d ]]
then
  for completion in ~/etc/bash_completion.d/*
  do
    [[ -r $completion ]] && source "$completion"
  done
fi

[[ -r /usr/share/git/completion/git-completion.bash ]] && . /usr/share/git/completion/git-completion.bash

complete -C "$(brew --prefix)/bin/aws_completer" aws

# gcloud
[[ -r /usr/local/share/google-cloud-sdk/path.bash.inc ]] && . /usr/local/share/google-cloud-sdk/path.bash.inc
[[ -r /usr/local/share/google-cloud-sdk/completion.bash.inc ]] && . /usr/local/share/google-cloud-sdk/completion.bash.inc

eval "$(direnv hook bash)"

export PYTHONPATH=.:$PYTHONPATH

mypytest() {
  python -m mypy $(basename $PWD | tr '-' '_') tests \
    && python -m pytest $@ $(basename $PWD | tr '-' '_') tests
}
