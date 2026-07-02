#!/bin/bash

set -e

if [ -z "$SSH_PRIVATE_KEY" ] || [ -z "$SERVER_IP" ]; then
  echo "Ошибка: Необходимо задать переменные окружения SSH_PRIVATE_KEY и SERVER_IP"
  echo "Пример запуска: SSH_PRIVATE_KEY=\"ваш_ключ\" SERVER_IP=\"1.2.3.4\" ./setup_ssh.sh"
  exit 1
fi

echo "Настройка SSH..."

mkdir -p ~/.ssh

printf '%s\n' "$SSH_PRIVATE_KEY" > ~/.ssh/key.pem
chmod 600 ~/.ssh/key.pem

ssh-keygen -y -f ~/.ssh/key.pem > /dev/null

ssh-keyscan -H "$SERVER_IP" >> ~/.ssh/known_hosts

cat > ~/.ssh/config << 'EOF'
Host *
  ServerAliveInterval 60
  ServerAliveCountMax 30
  ConnectTimeout 30
EOF
chmod 600 ~/.ssh/config

echo "Настройка SSH успешно завершена."