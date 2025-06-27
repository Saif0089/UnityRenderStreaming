#!/bin/bash
export PATH=/home/administrator/.nvm/versions/node/v22.17.0/bin:$PATH
cd /home/administrator/prod/UnityRenderStreaming/WebApp/client
npx npm-check-updates -u
npm install
npm install --legacy-peer-deps
cd /home/administrator/prod/UnityRenderStreaming/WebApp
npx npm-check-updates -u
npm install
npm install --legacy-peer-deps
npm run dev -- -p 8080