
# Sode filesystem

function _sode_config_dir() {
  echo "${HOME}/.config/sode"
}

function _sode_version() {
  cat "$_SODE_HOME/version"
}
