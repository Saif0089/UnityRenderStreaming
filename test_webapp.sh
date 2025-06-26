#!/bin/bash

SERVICE_PORT=${1:-8080} # Default to 8080 if no argument is provided
NODE_PATH=${2:-$(which node)} # Default to `which node` if no argument is provided

export PATH=$NODE_PATH:$PATH

cd WebApp
npm install --legacy-peer-deps
npm run dev -- -p $SERVICE_PORT