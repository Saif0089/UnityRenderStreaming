#!/bin/bash

set -e  # Exit on error

# Define NVM directory
export NVM_DIR="$HOME/.nvm"

# Download and install NVM if not already present
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

# Load NVM
if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
else
  echo "nvm.sh not found! Exiting."
  exit 1
fi

# Load bash_completion (optional)
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Install Node.js v22 if not already installed
if ! nvm ls 22 | grep -q 'v22'; then
  echo "Installing Node.js v22..."
  nvm install 22
fi

# Use Node.js v22
nvm use 22

# Verify versions
echo "Node version: $(node -v)"
echo "NVM current: $(nvm current)"
echo "npm version: $(npm -v)"