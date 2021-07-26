[ -f ~/.bashrc_private ] && . ~/.bashrc_private

export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="$ "

export PROMPT_COMMAND="history -a && history -c && history -r"
shopt -u histappend

export PATH=$PATH:~/bin

alias ls="ls -GF"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
