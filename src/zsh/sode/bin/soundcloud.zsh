#!/bin/zsh

emulate -LR zsh
set -euo pipefail
while IFS= read -d $'\0' -r f; do
  source "$f"
done < <(find "$_SODE_HOME/lib" -type f -iname '*.zsh' -print0 | sort -nz)

## Shared environment

export _SODE_INVOCATION="${_SODE_INVOCATION} soundcloud"

## Local environment

## Command

function main() {
  if [[ $# == 0 ]]
  then
    print_usage
    exit 0
  fi

  zparseopts -E \
    -help=help_option
  if [[ $# == 1 && -n "$help_option" ]]
  then
    print_usage
    exit 0
  fi

  sub_command="$1"
  case "$sub_command" in
  'authorize')
    shift 1
    exec "$_SODE_HOME/bin/soundcloud-authorize.zsh" "$@"
    ;;

  *)
    echo "Unknown sub-command: $sub_command"
    exit 1
    ;;
  esac
}

function print_usage() {
  cat >&2 <<-EOF
USAGE
$_SODE_INVOCATION --help
$_SODE_INVOCATION sub-command [args ...]

SUB-COMMANDS
authorize     Obtain auth tokens to use the API

OPTIONS
--help        Show help

See \`man ${_SODE_INVOCATION// /-}\` for details.
EOF
}

## Main

main "$@"; exit
