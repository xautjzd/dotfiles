#!/bin/bash
# install.sh - Symlink non-dotfiles in repo to dotfiles in $HOME

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd)"

# List your config files here (without leading dot)
FILES=(
    zshrc
    wezterm.lua
    gitconfig
    vimrc
    # Add more as needed
)

echo "Linking dotfiles from $DOTFILES_DIR to $HOME..."

for file in "${FILES[@]}"; do
    SRC="$DOTFILES_DIR/$file"
    DEST="$HOME/.$file"

    if [ -e "$DEST" ] || [ -L "$DEST" ]; then
        rm -rf "$DEST"
    fi

    ln -s "$SRC" "$DEST"
    echo "Linked $file -> .$file"
done

echo "All dotfiles have been linked."
