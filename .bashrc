[[ -r ~/.bashrc_private ]] && . ~/.bashrc_private

export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="$ "
export EDITOR=nano

export PROMPT_COMMAND="history -a && history -c && history -r"
shopt -u histappend

export PATH=$PATH:~/bin

alias ls="ls -GF"

BREW_PREFIX=$(brew --prefix)
[[ -r $BREW_PREFIX/etc/bash_completion ]] && . $BREW_PREFIX/etc/bash_completion
[[ -r $BREW_PREFIX/etc/bash_completion.d/git-completion.bash ]] && . $BREW_PREFIX/etc/bash_completion.d/git-completion.bash

# gcloud
[[ -r /usr/local/share/google-cloud-sdk/path.bash.inc ]] && . /usr/local/share/google-cloud-sdk/path.bash.inc
[[ -r /usr/local/share/google-cloud-sdk/completion.bash.inc ]] && . /usr/local/share/google-cloud-sdk/completion.bash.inc
