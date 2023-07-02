#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node version are managed with `nvm`, which is in the Brewfile.
# Sett zshrc for NVM_DIR variable.

# Requires that we source the new nvm install before use
source $(brew --prefix nvm)/nvm.sh

if exists node; then
  # echo "brew exists, skipping install"
  echo "Node $(node --version) & NPM $(npm --version) already installed"
else
  echo "Installing Node & NPM with nvm..."
  nvm install --lts
fi

# Install Global NPM Packages
# npm install --global firebase-tools
# ...

echo "Global NPM Packages Installed:"
npm list --global --depth=0