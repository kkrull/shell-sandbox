#!/usr/bin/env zsh

emulate -LR zsh
set -euo pipefail
while IFS= read -d $'\0' -r f; do
  source "$f"
done < <(find "$_SODE_HOME/lib" -type f -iname '*.zsh' -print0 | sort -nz)

## Shared environment

export _SODE_INVOCATION="${_SODE_INVOCATION} authorize"

## Local environment

## Command

function main() {
  zparseopts -D -E \
    -help=help_option

  if [[ -n "$help_option" ]]
  then
    print_usage
    exit 0
  elif [[ "$CLIENT_ID" == "" ]]
  then
    printf "Missing: CLIENT_ID"
    exit 1
  elif [[ "$CLIENT_SECRET" == "" ]]
  then
    printf "Missing: CLIENT_SECRET"
    exit 1
  fi

  #TODO KDK: Use an existing valid token or a refresh token before asking for another one
  local token_response_file=".soundcloud-token-response.json"
  _soundcloudcmd_authorize "$token_response_file" "$CLIENT_ID" "$CLIENT_SECRET"
  echo "Saved response in: ${token_response_file}"
}

function print_usage() {
  cat >&2 <<-EOF
USAGE
$_SODE_INVOCATION --help
$_SODE_INVOCATION

OPTIONS
--help        Show help

See \`man ${_SODE_INVOCATION// /-}\` for details.
EOF
}

## Main

main "$@"; exit
