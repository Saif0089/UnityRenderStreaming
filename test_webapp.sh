#!/bin/bash -eu

# Example usage:
# To run the script with a specific port (e.g., 3000), use the following command:
# ./test_webapp.sh 3000
PORT=${1:-8080} # Use the first argument as the port, default to 8080 if not provided

#!/bin/bash

set -eu  # Exit on error

# Define NVM directory
export NVM_DIR="$HOME/.nvm"

# Download and install NVM if not already present
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

# Load NVM
if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
else
  echo "nvm.sh not found! Exiting." >&2
  exit 1
fi

# Load bash_completion (optional)
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Install Node.js v22 if not already installed
if ! nvm ls 22 | grep -q 'v22'; then
  echo "Installing Node.js v22..."
  nvm install 22
fi

# Use Node.js v22
nvm use 22

# Verify versions
echo "Node version: $(node -v)"
echo "NVM current: $(nvm current)"
echo "npm version: $(npm -v)"

cd WebApp
npm install --legacy-peer-deps
# npm run lint
# npm run test
# Run the npm dev server with nohup to keep it running even after the terminal is closed
nohup npm run dev -- -p "$PORT" > webapp.log 2>&1 &

# Save the PID of the background process to a file for later use
echo $! > webapp.pid

sleep 5
# npm run newman -- -e ./test/env_macos.postman_environment.json
