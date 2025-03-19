
# SoundCloud API commands

function _soundcloudcmd_authorize() {
  local clientId="$1" ; shift 1
  local clientSecret="$1" ; shift 1

  echo "_soundcloudcmd_authorize: clientId=${clientId}, clientSecret=${clientSecret}"
  local token_endpoint='https://secure.soundcloud.com/oauth/token'
  curl "$token_endpoint" \
    --user "${clientId}:${clientSecret}" \
    --data-urlencode "grant_type=client_credentials" \
    -H "accept: application/json; charset=utf-8" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    "$@"
}
