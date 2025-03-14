#!/usr/bin/env bash

set -e

if (( $# != 1 ))
then
  echo "Usage: $0 <authorization code>"
  exit 1
fi

if [[ -z "$CLIENT_ID" ]]
then
  echo "Usage: CLIENT_ID=<client ID> $0 <authorization code>"
  exit 1
fi

if [[ -z "$CLIENT_SECRET" ]]
then
  echo "Usage: CLIENT_SECRET=<client secret> $0 <authorization code>"
  exit 1
fi

code=$1
shift 1

client_id="$CLIENT_ID"
client_secret="$CLIENT_SECRET"
grant_type='authorization_code'
redirect_uri_encoded='https%3A%2F%2Foidcdebugger.com%2Fdebug'

#./00_discover.sh | jq -r '.token_endpoint'
token_endpoint='https://login.salesforce.com/services/oauth2/token'
curl -X POST "${token_endpoint}" \
  --silent \
  -d "client_id=${client_id}" \
  -d "client_secret=${client_secret}" \
  -d "code=${code}" \
  -d "grant_type=${grant_type}" \
  -d "redirect_uri=${redirect_uri_encoded}" \
  "$@"
