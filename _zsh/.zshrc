# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration

source ~/init_opam.sh

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}
source ~/.zshrc.d/zsh-vi-mode/zsh-vi-mode.plugin.zsh

bindkey -M emacs '^[[3;5~' kill-word
bindkey -M emacs '^[D' kill-word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

for f in ~/.zshrc.d/*; do
  if [[ -f "$f" ]]; then
    source "$f"
  fi
done
