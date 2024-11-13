#!/bin/bash

update_readme() {
  local readme="$HOME/dotfiles/README.md"
  local nvim_plugins=$(grep "requires" ~/.config/nvim/lazy-lock.json | sed 's/"requires"://g' | tr -d '{}[],"' | sort | uniq)

  # Create/update README.md
  cat >"$readme" <<EOF
# Dotfiles

Personal development environment configurations.

## Installation

\`\`\`bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/dotfiles.sh

# Install dotfiles (creates backups of existing configs)
./dotfiles.sh -i

# Update repository with current configs
./dotfiles.sh -u
\`\`\`

## Contents

### Neovim (LazyVim)
$(if [ -f ~/.config/nvim/lazy-lock.json ]; then
    echo "Current plugins:"
    echo "\`\`\`"
    cat ~/.config/nvim/lazy-lock.json | grep "\"" | cut -d'"' -f2 | sort | sed 's/^/- /'
    echo "\`\`\`"
  fi)

### Alacritty
Terminal emulator configuration

### Zellij
Terminal multiplexer configuration

## Requirements

- Neovim >= 0.9.0
- Git
- Alacritty
- Zellij

## Notes

- Configs are backed up with .bak extension before installation
- Update script (-u) creates timestamped commits
EOF
}

# Show usage if no argument is provided or if it's not -u or -i
usage() {
  echo "Usage: $0 [-u|-i]"
  echo "  -u    Update dotfiles repo with current configs"
  echo "  -i    Install configs from dotfiles repo"
  exit 1
}

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
  usage
fi

# Process based on flag
case $1 in
-u)
  echo "Updating dotfiles repository..."

  # Create directories if they don't exist
  mkdir -p ~/dotfiles/alacritty
  mkdir -p ~/dotfiles/nvim
  mkdir -p ~/dotfiles/zellij

  # Copy current configs to dotfiles repo
  echo "Copying Alacritty config..."
  cp -r ~/.config/alacritty/* ~/dotfiles/alacritty/

  echo "Copying Neovim config..."
  cp -r ~/.config/nvim/* ~/dotfiles/nvim/

  echo "Copying Zellij config..."
  cp -r ~/.config/zellij/* ~/dotfiles/zellij/

  # Update README
  echo "Updating README..."
  update_readme

  # Git operations
  echo "Updating git repository..."
  cd ~/dotfiles
  git add .
  date=$(date '+%Y-%m-%d %H:%M:%S')
  git commit -m "Update dotfiles - $date"

  echo "Dotfiles have been backed up and committed!"
  echo "Don't forget to 'git push' if you want to update the remote repository."
  ;;

-i)
  echo "Installing configs from dotfiles repo..."

  # Create .config if it doesn't exist
  mkdir -p ~/.config

  # Backup existing configs if they exist
  if [ -d ~/.config/alacritty ]; then
    echo "Backing up existing Alacritty config..."
    mv ~/.config/alacritty ~/.config/alacritty.bak
  fi

  if [ -d ~/.config/nvim ]; then
    echo "Backing up existing Neovim config..."
    mv ~/.config/nvim ~/.config/nvim.bak
  fi

  if [ -d ~/.config/zellij ]; then
    echo "Backing up existing Zellij config..."
    mv ~/.config/zellij ~/.config/zellij.bak
  fi

  # Copy configs from dotfiles
  echo "Copying Alacritty config..."
  cp -r ~/dotfiles/alacritty ~/.config/alacritty

  echo "Copying Neovim config..."
  cp -r ~/dotfiles/nvim ~/.config/nvim

  echo "Copying Zellij config..."
  cp -r ~/dotfiles/zellij ~/.config/zellij

  echo "Dotfiles have been installed to ~/.config!"
  echo "Previous configs (if any) were backed up with .bak extension"
  ;;

*)
  usage
  ;;
esac
