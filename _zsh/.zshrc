# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"

#source ~/init_opam.sh

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
}
export ZSHRCD=~/.zshrc.d
#source ~/.zshrc.d/zsh-vi-mode/zsh-vi-mode.plugin.zsh
#source ~/.zshrc.d/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey -M emacs '^[[3;5~' kill-word
bindkey -M emacs '^[D' kill-word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

for f in ~/.zshrc.d/*; do
  if [[ -f "$f" ]]; then
    source "$f"
  fi
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
