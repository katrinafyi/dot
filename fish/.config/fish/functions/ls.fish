function ls --wraps=exa --description 'alias ls exa'
  if command -v exa >/dev/null
    exa $argv
  else if command -v eza >/dev/null
    eza $argv
  else
    command ls $argv
  end
end
