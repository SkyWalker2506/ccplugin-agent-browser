#!/usr/bin/env bash
# setup.sh — Install agent-browser and its Chromium dependency

set -e

echo "Installing agent-browser..."
npm install -g agent-browser

echo "Downloading Chromium (required for browser automation)..."
agent-browser install

echo "Done. You can now use agent-browser commands."
