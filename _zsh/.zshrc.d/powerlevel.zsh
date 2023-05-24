
source $ZSHRCD/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
case $(tty) in 
  /dev/tty[0-9]*)
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.ascii.zsh
    ;;
  *)
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    ;;
esac

