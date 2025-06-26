#!/bin/bash -eu

# Example usage:
# To run the script with a specific port (e.g., 3000), use the following command:
# ./test_webapp.sh 3000
PORT=${1:-8080} # Use the first argument as the port, default to 8080 if not provided

cd WebApp
/home/administrator/.nvm/versions/node/v22.17.0/bin/npm install --legacy-peer-deps
# npm run lint
# npm run test
/home/administrator/.nvm/versions/node/v22.17.0/bin/npm run dev -- -p "$PORT" &
# sleep 5
# npm run newman -- -e ./test/env_macos.postman_environment.json
