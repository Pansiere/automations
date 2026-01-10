#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title SECON
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

# INICIO DO SCRIPT:

# Caminho do app do Docker Desktop
DOCKER_APP="/Applications/Docker.app"

# Testa se o daemon está rodando
docker info > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "⚠️  Docker não está rodando. Iniciando Docker Desktop..."
  open -a "$DOCKER_APP"

  # Espera até o daemon ficar pronto
  while ! docker info > /dev/null 2>&1; do
    echo "⏳ Aguardando Docker inicializar..."
    sleep 2
  done
  echo "✅ Docker iniciado com sucesso!"
fi

# Fecha a janela do Docker Desktop (como se clicasse no X vermelho)
osascript <<EOF
tell application "System Events"
    tell process "Docker Desktop"
        if (count of windows) > 0 then
            click button 1 of window 1
        end if
    end tell
end tell
EOF

# Agora executa os comandos
echo "🛑 Removendo containers antigos..."
docker ps -aq | xargs docker rm -f 2>/dev/null

echo "🚀 Subindo containers do SECON..."
cd ~/secon/docker || exit
docker compose up -d
cd - || exit
