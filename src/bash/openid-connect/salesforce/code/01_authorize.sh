#!/usr/bin/env bash

set -e

usage() {
  echo "Usage: CLIENT_ID=<client ID> $0 [-r] [-s <scope>] [-- <cURL option> ...]"
  exit 1
}

[[ -z "$CLIENT_ID" ]] && usage

mode='parsed'
scope=''
while getopts ":rs:" arg
do
  case "$arg" in
    r)
      mode='raw'
      ;;

    s)
      scope="$OPTARG"
      ;;

    *)
      usage
  esac
done
shift $((OPTIND-1))


#./00_discover.sh | jq -r '.authorization_endpoint'
authorization_endpoint="https://login.salesforce.com/services/oauth2/authorize"
client_id="$CLIENT_ID"
redirect_uri='https://oidcdebugger.com/debug'
response_type='code'
case "$mode" in
  'parsed')
    #Usage: ./01_authorize.sh | pbcopy
    #TODO KDK: Add state parameter, to prevent attacks
    curl "${authorization_endpoint}?client_id=${client_id}&redirect_uri=${redirect_uri}&response_type=${response_type}&scope=${scope}" \
      --dump-header - \
      --silent \
      --show-error \
      "$@" \
      | grep Location \
      | sed 's/Location: //'
    ;;

  'raw')
    curl "${authorization_endpoint}?client_id=${client_id}&redirect_uri=${redirect_uri}&response_type=${response_type}&scope=${scope}" \
      --dump-header - \
      --silent \
      --show-error \
      "$@" \
    ;;
esac
