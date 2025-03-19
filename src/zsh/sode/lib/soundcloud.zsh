
# SoundCloud API

function _soundcloud_oauth_token_file() {
  local sode_config_dir
  sode_config_dir=$(_sode_config_dir)

  echo "${sode_config_dir}/soundcloud-token-response.json"
}
