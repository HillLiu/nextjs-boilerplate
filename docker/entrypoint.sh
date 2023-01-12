#!/usr/bin/env sh

# docker entrypoint script
server() {
  npm run dev
}

if [ "$1" = 'server' ]; then
  server
else
  exec "$@"
fi
