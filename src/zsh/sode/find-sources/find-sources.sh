#!/usr/bin/env zsh

# https://stackoverflow.com/a/56311706/112682
emulate -LR zsh
set -euo pipefail

## Shared environment

# export _SODE_HOME="${0:A:h}"
export _SODE_INVOCATION="${0:t}"
# export _SODE_INVOCATION="${_SODE_INVOCATION} add"

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

  find "$@" -type f -name "$pattern" \
    | grep -v '[.]git/' \
    | grep -v 'node_modules'
}

function print_usage() {
  cat >&2 <<-EOF
USAGE
$_SODE_INVOCATION --help
$_SODE_INVOCATION <pattern> <path> [...]

OPTIONS
--help        Show help
EOF
}

## Main

# Make sure the script exits, even if main doesn't
# https://unix.stackexchange.com/a/449508/37734
main "$@"; exit
