#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ytd='/home/sumit/_scripts/ytdlp_download.sh'
alias autogit='/home/sumit/_scripts/auto-git.sh'
PS1='[\u@\h \W]\$ '

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/hul10.omp.json)"
alias ytdlp_dd='/home/sumit/_scripts/ytdlp_download.sh'
