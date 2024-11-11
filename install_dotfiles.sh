#!/bin/bash

#### Dotfiles

Development setup for using Alacritty, Neovim (LazyVim), and Zellij.

echo "Copying Alacritty config..."
cp -r ~/dotfiles/alacritty ~/.config/alacritty

echo "Copying Neovim config..."
cp -r ~/dotfiles/nvim ~/.config/nvim

echo "Copying Zellij config..."
cp -r ~/dotfiles/zellij ~/.config/zellij

echo "Dotfiles have been copied to ~/.config!"
