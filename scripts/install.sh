#!/bin/bash

set -e

source defaults.sh
source functions.sh

install_brew
software_update
brew_bundle
npm_packages
install_zprezto
setup_go
setup_vi
setup_system_defaults

echo "---------------------"
echo "Installation complete, following apps need to be installed manually:"
echo "- owly"
echo "- reeder"
echo "- keynote"
echo "- sizeup"

