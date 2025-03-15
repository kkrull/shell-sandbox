
# Sode filesystem

#TODO KDK: Look in /usr/local/share/sode as well when home is /usr/local/libexec/sode
function _fs_sode_version() {
  cat "$_SODE_HOME/version"
}
