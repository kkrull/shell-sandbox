#!/bin/bash

set -e
socket_file="/tmp/tmux-pairing.sock"
#touch "$socket_file"
#chmod 777 "$socket_file"
tmux -S "$socket_file" new -s pair
