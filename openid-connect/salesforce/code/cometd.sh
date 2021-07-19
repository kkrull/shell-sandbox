#!/usr/bin/env bash

set -e

if (( $# < 1 ))
then
  echo "Usage: $0 <access token>"
  exit 1
fi

access_token="$1"
shift 1

cometd_endpoint="https://8thlight-dev-ed.lightning.force.com/cometd/48.0"
event_url="${cometd_endpoint}/event/ExpenseCRUD__e"
curl "${cometd_endpoint}" \
  --silent \
  -H "Authorization: Bearer ${access_token}" \
  -X POST \
  $@
