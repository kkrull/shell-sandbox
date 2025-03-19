
# SoundCloud API commands

function _soundcloudcmd_authorize() {
  local clientId="$1" ; shift 1
  local clientSecret="$1" ; shift 1

  echo "_soundcloudcmd_authorize: clientId=${clientId}, clientSecret=${clientSecret}"
  # local authorization_endpoint='https://secure.soundcloud.com/authorize'
}
