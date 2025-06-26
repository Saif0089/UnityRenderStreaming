#!/bin/bash

SERVICE_PORT=${1:-8080} # Default to 8080 if no argument is provided

cd WebApp
npm install --legacy-peer-deps
npm run dev -- -p $SERVICE_PORT