#!/bin/zsh

brew install neovim bat btop starship                       # cli
brew install ripgrep lua-language-server                    # neovim
brew install zsh-syntax-highlighting zsh-autosuggestions    # zsh

brew install --cask font-jetbrains-mono

git config --global core.editor "nvim"
