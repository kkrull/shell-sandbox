#!/usr/bin/env zsh

pattern='index[.][jt]s'
directories=()
directories+=(bitovi.github.com)
directories+=(kkrull.github.com)

#find kkrull.github.com bitovi.github.com -type f -name 'index[.][jt]s' -or -name 'index[.][jt]sx' | grep -v '[.]git/' | grep -v 'node_modules'
find "${directories[@]}" -type f -name "$pattern" \
  | grep -v '[.]git/' \
  | grep -v 'node_modules'
