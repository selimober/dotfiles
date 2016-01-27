#!/bin/sh

cd "$(dirname $0)"/..

# Run Homebrew through the Brewfile
echo "› brew bundle"
brew bundle

