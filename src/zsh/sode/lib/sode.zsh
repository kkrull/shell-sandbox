
# Sode suite

function _sode_config_dir() {
  local config_dir="${HOME}/.config/sode"
  if [ ! -e "$config_dir" ]
  then
    mkdir -m 700 -p "$config_dir"
  fi

  echo "$config_dir"
}

function _sode_version() {
  cat "$_SODE_HOME/version"
}
