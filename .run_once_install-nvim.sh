#!/usr/bin/env bash

set -e

echo "Installing packer.nvim if missing."

PACKER_PATH = "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/packer/start/packer.nvim"

if [ ! -d "$PACKER_PATH" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_PATH"
fi

echo "Installing nvim plugins."

nvim --headless +PackerSync +ga

