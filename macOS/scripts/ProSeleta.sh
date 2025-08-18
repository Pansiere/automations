#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title ProSeleta
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

# Agora executa os comandos
echo "🛑 Removendo containers antigos..."
docker ps -aq | xargs docker rm -f 2>/dev/null

echo "🚀 Subindo containers do ProSeleta..."
cd ~/IMPACTA/proseleta || exit
docker compose up -d
docker compose stop mailhog
cd - || exit
