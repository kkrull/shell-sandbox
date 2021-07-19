#!/usr/bin/env bash

set -e

base_url='https://login.salesforce.com'
discovery_endpoint="${base_url}/.well-known/openid-configuration"
curl --silent "${discovery_endpoint}" $@
