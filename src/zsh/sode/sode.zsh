#!/usr/bin/env zsh

# https://stackoverflow.com/a/56311706/112682
emulate -LR zsh
set -euo pipefail

## Shared environment

export _SODE_HOME="${0:A:h}"
export _SODE_INVOCATION="${0:t}"

## Local environment

while IFS= read -d $'\0' -r f; do
  source "$f"
done < <(find "$_SODE_HOME/lib" -type f -iname '*.zsh' -print0 | sort -nz)

## Command

function main() {
  if [[ $# == 0 ]]
  then
    print_usage
    exit 0
  fi

  # Distinguish `sode --help` (top-level usage) from `sode <command> --help` (command usage)
  zparseopts -E \
    -help=help_option \
    -version=version_option
  if [[ $# == 1 && -n "$help_option" ]]
  then
    print_usage
    exit 0
  elif [[ $# == 1 && -n "$version_option" ]]
  then
    _sode_version
    exit 0
  fi

  command="$1"
  case "$command" in
  'fs')
    shift 1
    exec "$_SODE_HOME/bin/fs.zsh" "$@"
    ;;

  'soundcloud')
    shift 1
    exec "$_SODE_HOME/bin/soundcloud.zsh" "$@"
    ;;

  *)
    echo "Unknown command: $command"
    exit 1
    ;;
  esac
}

function print_usage() {
  cat >&2 <<-EOF
USAGE
$_SODE_INVOCATION [--help] [--version]
$_SODE_INVOCATION command [args ...]

OPTIONS
--help        Show help
--version     Show version

COMMANDS
fs            Hack the local file system
soundcloud    Hack SoundCloud

See \`man ${_SODE_INVOCATION// /-}\` for details.
EOF
}

## Main

# Make sure the script exits, even if main doesn't
# https://unix.stackexchange.com/a/449508/37734
main "$@"; exit
