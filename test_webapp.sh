#!/bin/bash -eu

PORT=${1:-8080} # Default port 8080

# Find the full paths to npm and node
NPM_BIN=$(which npm)
NODE_BIN=$(which node)

if [[ -z "$NPM_BIN" || -z "$NODE_BIN" ]]; then
  echo "npm or node not found in PATH!" >&2
  exit 1
fi

echo "Using npm: $NPM_BIN"
echo "Using node: $NODE_BIN"

cd WebApp

# Use the exact npm path found
"$NPM_BIN" install --legacy-peer-deps

# Run the dev server with exact npm path
nohup "$NPM_BIN" run dev -- -p "$PORT" > webapp.log 2>&1 &

# Save PID
echo $! > webapp.pid

# Optional: brief pause to ensure process starts
sleep 5
