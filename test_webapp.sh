#!/bin/bash -eu

# Example usage:
# To run the script with a specific port (e.g., 3000), use the following command:
# ./test_webapp.sh 3000
PORT=${1:-8080} # Use the first argument as the port, default to 8080 if not provided

which npm
which node

cd WebApp
npm install --legacy-peer-deps
# npm run lint
# npm run test
npm run dev -- -p "$PORT" &
# sleep 5
# npm run newman -- -e ./test/env_macos.postman_environment.json
