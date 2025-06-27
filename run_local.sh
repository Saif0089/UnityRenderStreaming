#!/bin/bash
cd WebApp/client
npx npm-check-updates -u
npm install
npm install --legacy-peer-deps
cd ..
npx npm-check-updates -u
npm install
npm install --legacy-peer-deps
npm run dev -- -p 8080