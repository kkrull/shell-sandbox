#!/bin/bash

set -e
socket_file="/tmp/tmux-pairing.sock"
tmux -S "$socket_file" attach
