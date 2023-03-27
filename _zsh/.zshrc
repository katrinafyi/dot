# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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



for f in ~/.zshrc.d/*; do
  if [[ -f "$f" ]]; then
    source "$f"
  fi
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

command -v exa &>/dev/null && alias ls=exa
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias grep='grep --color=auto'


setopt INC_APPEND_HISTORY
