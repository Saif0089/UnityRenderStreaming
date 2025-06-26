#!/bin/bash

./install_npm.sh

cd WebApp
npm install --legacy-peer-deps
npm run dev -- -p $SERVICE_PORT