#!/usr/bin/env zsh

emulate -LR zsh
set -euo pipefail
while IFS= read -d $'\0' -r f; do
  source "$f"
done < <(find "$_SODE_HOME/lib" -type f -iname '*.zsh' -print0 | sort -nz)

## Shared environment

export _SODE_INVOCATION="${_SODE_INVOCATION} find"

## Local environment

## Command

function main() {
  zparseopts -D -E \
    -help=help_option

  if [[ -n "$help_option" ]]
  then
    print_usage
    exit 0
  elif [[ $# == 0 ]]
  then
    echo "$_SODE_INVOCATION: Missing pattern"
    exit 1
  elif [[ $# == 1 ]]
  then
    echo "$_SODE_INVOCATION: Missing path(s)"
    exit 1
  fi

  local pattern="$1" ; shift 1
  _fscmd_find "$pattern" "$@"
}

function print_usage() {
  cat >&2 <<-EOF
USAGE
$_SODE_INVOCATION --help
$_SODE_INVOCATION <pattern> <path> [...]

OPTIONS
--help        Show help

See \`man ${_SODE_INVOCATION// /-}\` for details.
EOF
}

## Main

main "$@"; exit
