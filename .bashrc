[[ -r ~/.bashrc_private ]] && . ~/.bashrc_private

export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="$ "
export EDITOR=nano
export HISTSIZE=999999
export SHELL_SESSION_HISTORY=0

set_title() {
  local title=$1
  echo -ne "\033]0;$title\a"
}

show_cwd() {
  if [[ $PWD = $HOME ]]
  then
    echo '~/'
  else
    echo "(basename $PWD)/"
  fi
}

show_command() {
  case "$BASH_COMMAND" in
  *\033]0*)
    ;;
  *)
    set_title "! $BASH_COMMAND"
    ;;
  esac
}
trap show_command DEBUG

shopt -s histappend
export PROMPT_COMMAND='history -a; history -c; history -r; set_title $(show_cwd)'

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
  eval "$(/opt/homebrew/bin/brew shellenv)"
  [[ -r $BREW_PREFIX/etc/bash_completion ]] && . $BREW_PREFIX/etc/bash_completion
  COMPLETION_D="$BREW_PREFIX/etc/bash_completion.d"
  [[ -r $COMPLETION_D/git-completion.bash ]] && . "$COMPLETION_D/git-completion.bash"
  [[ -r $COMPLETION_D/helm ]] && . "$COMPLETION_D/helm"
  complete -C "$(brew --prefix)/bin/aws_completer" aws
fi
if [[ -d ~/etc/bash_completion.d ]]
then
  for completion in ~/etc/bash_completion.d/*
  do
    [[ -r $completion ]] && source "$completion"
  done
fi

[[ -r /usr/share/git/completion/git-completion.bash ]] && . /usr/share/git/completion/git-completion.bash


# gcloud
[[ -r /usr/local/share/google-cloud-sdk/path.bash.inc ]] && . /usr/local/share/google-cloud-sdk/path.bash.inc
[[ -r /usr/local/share/google-cloud-sdk/completion.bash.inc ]] && . /usr/local/share/google-cloud-sdk/completion.bash.inc

eval "$(direnv hook bash)"

export PYTHONPATH=.:$PYTHONPATH

mypytest() {
  python -m mypy $(basename $PWD | tr '-' '_') tests \
    && python -m pytest $@ $(basename $PWD | tr '-' '_') tests
}

export PATH="$PATH:~/.foundry/bin"

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
