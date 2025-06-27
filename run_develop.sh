#!/bin/bash
export PATH=/home/administrator/.nvm/versions/node/v22.17.0/bin:$PATH

# Navigate to the client directory, clean node_modules, and install dependencies
cd /home/administrator/develop/UnityRenderStreaming/WebApp/client
rm -rf node_modules
npm install --legacy-peer-deps

# Navigate to the WebApp directory, clean node_modules, and install dependencies
cd /home/administrator/develop/UnityRenderStreaming/WebApp
rm -rf node_modules
npm install --legacy-peer-deps

# Run the development server
npm run dev -- -p 5054