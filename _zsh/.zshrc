# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Use powerline
#USE_POWERLINE="true"

#source ~/init_opam.sh

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  #ZVM_VI_INSERT_ESCAPE_BINDKEY=";'"
  #ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
}
export ZSHRCD=~/.zshrc.d
zvm_after_init_commands+=(
  "bindkey '^[[A' history-substring-search-up"
  "bindkey '^[[B' history-substring-search-down"
  "bindkey '^[[1;5C' emacs-forward-word"
  "bindkey '^[[1;5D' emacs-backward-word"
  "bindkey '^H' backward-kill-word"
  "bindkey '^[[3;5~' kill-word"
)
source ~/.zshrc.d/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.zshrc.d/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/.zshrc.d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward


for f in ~/.zshrc.d/*.zsh; do
  if [[ -f "$f" ]]; then
    source "$f"
  fi
done


command -v exa &>/dev/null && alias ls=exa
! command -v poweroff &>/dev/null && alias poweroff='systemctl poweroff'
! command -v reboot &>/dev/null && alias reboot='systemctl reboot'
! command -v halt &>/dev/null && alias halt='systemctl halt'

platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == *'BSD' ]]; then
   platform='bsd'
fi

if [[ $platform == linux ]]; then 
  alias ll='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias grep='grep --color=auto'
  alias zy='sudo zypper'
fi

if command -v nvim &>/dev/null; then
  export EDITOR=nvim
fi



setopt INC_APPEND_HISTORY

# load suse cnf, if it exists.
if [[ -f /etc/zsh_command_not_found ]]; then
  function command_not_found_handler cnf_handler {
    if [ -x /usr/bin/python3 ] && [ -x /usr/bin/command-not-found ]; then
      /usr/bin/command-not-found "${(Q)1}" zypp
    fi
    return 127
  }
fi

if command -v direnv &>/dev/null; then 
  eval "$(direnv hook zsh)"
fi
