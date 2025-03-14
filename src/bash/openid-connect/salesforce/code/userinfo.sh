#!/usr/bin/env bash

set -e

if (( $# != 1 ))
then
  echo "Usage: $0 <access token>"
  echo "Note: See .urls in response for REST API endpoint"
  exit 1
fi

access_token="$1"
shift 1

#./00_discover.sh | jq -r '.userinfo_endpoint'
userinfo_endpoint='https://login.salesforce.com/services/oauth2/userinfo'
curl "${userinfo_endpoint}" \
  --silent \
  -H "Authorization: Bearer ${access_token}" \
  "$@"
