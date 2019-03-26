#!/usr/bin/env bash

CONFIG_PATH="${XDG_CONFIG_HOME:-${HOME}/.config}/message2me"
BIN_PATH="${XDG_BIN_HOME:-${HOME}/.local/bin}"

# delete executable file
rm -v -rf "${BIN_PATH}/message2me"

# delete configuration file
rm -v -rf "${CONFIG_PATH}"

echo "uninstall finished."
