#!/bin/bash -eu

# Example usage:
# To run the script with a specific port (e.g., 3000), use the following command:
# ./test_webapp.sh 3000
PORT=${1:-8080} # Use the first argument as the port, default to 8080 if not provided

./install_npm.sh

cd WebApp
npm install --legacy-peer-deps
npm run lint
# npm run test
# Run the npm dev server with nohup to keep it running even after the terminal is closed
nohup npm run dev -- -p "$PORT" > webapp.log 2>&1 &

# Save the PID of the background process to a file for later use
echo $! > webapp.pid

sleep 5
# npm run newman -- -e ./test/env_macos.postman_environment.json
