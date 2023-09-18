function ll --wraps=ls --wraps='exa -l' --wraps='exa -l --icons' --description 'alias ll exa -l --icons'
  ls -l --icons $argv
end
