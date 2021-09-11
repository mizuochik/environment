[[ -r ~/.bashrc_private ]] && . ~/.bashrc_private

export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="$ "
export EDITOR=nano
export HISTSIZE=99999

export PROMPT_COMMAND="history -a && history -c && history -r"
shopt -u histappend

export PATH=$PATH:~/bin
export PATH=$PATH:~/go/bin
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

alias ls="ls -F"

BREW_PREFIX=$(brew --prefix)
[[ -r $BREW_PREFIX/etc/bash_completion ]] && . $BREW_PREFIX/etc/bash_completion
[[ -r $BREW_PREFIX/etc/bash_completion.d/git-completion.bash ]] && . $BREW_PREFIX/etc/bash_completion.d/git-completion.bash

# gcloud
[[ -r /usr/local/share/google-cloud-sdk/path.bash.inc ]] && . /usr/local/share/google-cloud-sdk/path.bash.inc
[[ -r /usr/local/share/google-cloud-sdk/completion.bash.inc ]] && . /usr/local/share/google-cloud-sdk/completion.bash.inc
