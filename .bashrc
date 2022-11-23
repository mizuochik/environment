[[ -r ~/.bashrc_private ]] && . ~/.bashrc_private

export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="$ "
export EDITOR=nano
export HISTSIZE=999999

export PROMPT_COMMAND="history -a && history -c && history -r"
shopt -u histappend

export PATH=~/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH
export CDPATH=.:~/Projects

alias ls="ls -F"

eval "$(/opt/homebrew/bin/brew shellenv)"

if which brew &> /dev/null
then
  BREW_PREFIX=$(brew --prefix)
  [[ -r $BREW_PREFIX/etc/bash_completion ]] && . $BREW_PREFIX/etc/bash_completion
  [[ -r $BREW_PREFIX/etc/bash_completion.d/git-completion.bash ]] && . $BREW_PREFIX/etc/bash_completion.d/git-completion.bash
fi

[[ -r /usr/share/git/completion/git-completion.bash ]] && . /usr/share/git/completion/git-completion.bash

complete -C "$(brew --prefix)/bin/aws_completer" aws

# gcloud
[[ -r /usr/local/share/google-cloud-sdk/path.bash.inc ]] && . /usr/local/share/google-cloud-sdk/path.bash.inc
[[ -r /usr/local/share/google-cloud-sdk/completion.bash.inc ]] && . /usr/local/share/google-cloud-sdk/completion.bash.inc

eval "$(direnv hook bash)"

mypytest() {
  python -m mypy $(basename $PWD | tr '-' '_') tests \
    && python -m pytest $@ $(basename $PWD | tr '-' '_') tests
}
