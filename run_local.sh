#!/bin/bash
cd WebApp/client
npm install
npm install --legacy-peer-deps
cd ..
npm install
npm install --legacy-peer-deps
npm run dev -- -p 8080