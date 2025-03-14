#!/bin/bash

echo "**Run with sudo**"
share_dir="$HOME/host/share"
mkdir -p "$share_dir"
mount -t vboxsf share "$share_dir"
