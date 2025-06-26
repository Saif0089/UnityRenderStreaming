#!/bin/bash
export PATH=/home/administrator/.nvm/versions/node/v22.17.0/bin:$PATH
cd /home/administrator/staging/UnityRenderStreaming/WebApp
npm install --legacy-peer-deps
npm run dev -- -p 5056