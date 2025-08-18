#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title derrubar-containers
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

# INICIO DO SCRIPT:

if pgrep -x "Docker Desktop" >/dev/null; then
  echo "🛑 Removendo containers..."

  docker ps -aq | xargs -r docker rm -f 2>/dev/null

  echo "✅ Containers removidos!"

  echo "🛑 Encerrando Docker Desktop..."

  /usr/bin/osascript -e 'tell application "System Events" to tell process "Docker Desktop" to tell (menu bar item 1 of menu bar 2) to click menu item "Quit Docker Desktop" of menu 1'

  echo "✅ Docker Desktop encerrado!"

else
  echo "Docker Engine já está parado — pulando remoção de containers."
fi


