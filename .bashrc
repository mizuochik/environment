[[ -r ~/.bashrc_private ]] && . ~/.bashrc_private

export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="$ "
export EDITOR=nano
export HISTSIZE=99999

export PROMPT_COMMAND="history -a && history -c && history -r"
shopt -u histappend

export PATH=~/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

alias ls="ls -F"

if which brew &> /dev/null
then
  BREW_PREFIX=$(brew --prefix)
  [[ -r $BREW_PREFIX/etc/bash_completion ]] && . $BREW_PREFIX/etc/bash_completion
  [[ -r $BREW_PREFIX/etc/bash_completion.d/git-completion.bash ]] && . $BREW_PREFIX/etc/bash_completion.d/git-completion.bash
fi

[[ -r /usr/share/git/completion/git-completion.bash ]] && . /usr/share/git/completion/git-completion.bash

# gcloud
[[ -r /usr/local/share/google-cloud-sdk/path.bash.inc ]] && . /usr/local/share/google-cloud-sdk/path.bash.inc
[[ -r /usr/local/share/google-cloud-sdk/completion.bash.inc ]] && . /usr/local/share/google-cloud-sdk/completion.bash.inc

eval "$(/opt/homebrew/bin/brew shellenv)"

complete -C /usr/local/bin/terraform terraform
