#!/bin/bash

./install_npm.sh

# Find the path to the node executable
NODE_PATH=$(which node)

# Export the path
export PATH=$(dirname "$NODE_PATH"):$PATH

cd WebApp
npm install --legacy-peer-deps
npm run dev -- -p $SERVICE_PORT