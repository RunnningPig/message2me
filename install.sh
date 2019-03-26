#!/usr/bin/env bash

CONFIG_PATH="${XDG_CONFIG_HOME:-${HOME}/.config}/message2me"
BIN_PATH="${XDG_BIN_HOME:-${HOME}/.local/bin}"

set -e

# copy configuration file
mkdir -p "${CONFIG_PATH}"
if [[ -f "${CONFIG_PATH}/message2me.conf" ]]; then
  mv "${CONFIG_PATH}/message2me.conf" "${CONFIG_PATH}/message2me.conf.old"
fi
cp message2me.conf "${CONFIG_PATH}/message2me.conf"
echo "Configuration file:"
echo "  ${CONFIG_PATH}/message2me.conf"

# copy executable file
mkdir -p "${BIN_PATH}"
cp message2me.sh "${BIN_PATH}/message2me.new"
chmod 755 "${BIN_PATH}/message2me.new"
mv "${BIN_PATH}/message2me.new" "${BIN_PATH}/message2me"
echo "Executable file:"
echo "  ${BIN_PATH}/message2me"

# set environment variable
if [[ -z "$(echo "${PATH}" | grep "${BIN_PATH}")" ]]; then
  cat >> "${HOME}/.bashrc" <<- "EOT"
	if [[ -d "${XDG_BIN_HOME:-${HOME}/.local/bin}" ]]; then
	  PATH="${XDG_BIN_HOME:-${HOME}/.local/bin}:${PATH}"
	fi
	EOT
  echo
  echo "Finally, please execute one of the following commands to finish install:"
  echo '  1. export PATH="${XDG_BIN_HOME:-${HOME}/.local/bin}:${PATH}"'
  echo "  2. reboot"
  exit 0
fi

echo
echo "message2me has successfully installed."
