#!/bin/bash -xeu

from="$1"
to="$2"
p="$(realpath -s --relative-to="$HOME" "$3")"

mkdir -p "$(dirname "$to/$p")"
stow -D $from
git mv -v "$from/$p" "$to/$p"
stow $from $to
