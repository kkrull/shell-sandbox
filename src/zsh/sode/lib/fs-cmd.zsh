
# File system commands

# ${@:#} Remove array elements matching '' to avoid entering a world of pain
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Parameter-Expansion

function _fscmd_find() {
  local pattern="$1" ; shift 1

  find "$@" -type f -name "$pattern" \
    | grep -v '[.]git/' \
    | grep -v 'node_modules'
}
