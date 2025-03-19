
# SoundCloud API commands

# TODO KDK: Include current time and/or expiration time so can tell if the token has expired
function _soundcloudcmd_authorize() {
  local response_file="$1"; shift 1
  local clientId="$1" ; shift 1
  local clientSecret="$1" ; shift 1
  local token_endpoint='https://secure.soundcloud.com/oauth/token'

  # https://stackoverflow.com/questions/61238933/is-it-possible-to-include-current-time-stamp-in-jq-command
  # SoundCloud client_credentials flow: https://developers.soundcloud.com/docs#authentication
  # cURL user to Authorization header: https://stackoverflow.com/a/20814679/112682
  curl "$token_endpoint" \
    --create-file-mode 0600 \
    --fail \
    --output "$response_file" \
    --silent \
    --user "${clientId}:${clientSecret}" \
    --data-urlencode "grant_type=client_credentials" \
    -H "accept: application/json; charset=utf-8" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    "$@"
}
