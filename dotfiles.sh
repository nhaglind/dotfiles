#!/bin/bash
BACKUP=true
HANDLE_ZSHRC=false

update_readme() {
  local readme="$HOME/dotfiles/README.md"
  local nvim_plugins=$(grep "requires" ~/.config/nvim/lazy-lock.json | sed 's/"requires"://g' | tr -d '{}[],"' | sort | uniq)
  # Create/update README.md
  cat >"$readme" <<EOF
# Dotfiles
Personal development environment configurations.
## Installation
\`\`\`bash
git clone https://github.com/nhaglind/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/dotfiles.sh
# Install dotfiles (creates backups of existing configs by default)
./dotfiles.sh -i
# Install without backups
./dotfiles.sh -i --no-backup
# Update repository with current configs
./dotfiles.sh -u
# Include zshrc in operations
./dotfiles.sh -u --zshrc
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
- Btop
- Zellij
- Ripgrep
## Notes
- Configs are backed up with .bak extension before installation by default.
EOF
}

usage() {
  echo "Usage: $0 [-u|-i] [--no-backup] [--zshrc]"
  echo "  -u             Update dotfiles repo with current configs"
  echo "  -i [--no-backup] Install configs from dotfiles repo (skip backups with --no-backup)"
  echo "  --zshrc        Include zshrc in operations"
  exit 1
}

ACTION=""
while [[ $# -gt 0 ]]; do
  case $1 in
  -u)
    ACTION="update"
    shift
    ;;
  -i)
    ACTION="install"
    shift
    ;;
  --no-backup)
    BACKUP=false
    shift
    ;;
  --zshrc)
    HANDLE_ZSHRC=true
    shift
    ;;
  *)
    usage
    ;;
  esac
done

if [ -z "$ACTION" ]; then
  usage
fi

case $ACTION in
update)
  echo "Updating dotfiles repository..."
  mkdir -p ~/dotfiles/alacritty
  mkdir -p ~/dotfiles/nvim
  mkdir -p ~/dotfiles/btop
  mkdir -p ~/dotfiles/zellij
  [ "$HANDLE_ZSHRC" = true ] && mkdir -p ~/dotfiles/zsh

  cp -r ~/.config/alacritty/* ~/dotfiles/alacritty/
  cp -r ~/.config/nvim/* ~/dotfiles/nvim/
  cp -r ~/.config/btop/* ~/dotfiles/btop/
  cp -r ~/.config/zellij/* ~/dotfiles/zellij/

  if [ "$HANDLE_ZSHRC" = true ]; then
    echo "Copying ZSH config..."
    cp ~/.zshrc ~/dotfiles/zsh/
  fi

  echo "Updating README..."
  update_readme

  cd ~/dotfiles
  git add .
  git commit -m "Update dotfiles"
  echo "Dotfiles have been backed up and committed!"
  echo "Don't forget to 'git push' if you want to update the remote repository."
  ;;
install)
  echo "Installing configs from dotfiles repo..."
  mkdir -p ~/.config

  if $BACKUP; then
    [ -d ~/.config/alacritty ] && mv ~/.config/alacritty ~/.config/alacritty.bak
    [ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
    [ -d ~/.config/btop ] && mv ~/.config/btop ~/.config/btop.bak
    [ -d ~/.config/zellij ] && mv ~/.config/zellij ~/.config/zellij.bak
    if [ "$HANDLE_ZSHRC" = true ] && [ -f ~/.zshrc ]; then
      mv ~/.zshrc ~/.zshrc.bak
    fi
  fi

  cp -r ~/dotfiles/alacritty ~/.config/alacritty
  cp -r ~/dotfiles/nvim ~/.config/nvim
  cp -r ~/dotfiles/btop ~/.config/btop
  cp -r ~/dotfiles/zellij ~/.config/zellij

  if [ "$HANDLE_ZSHRC" = true ]; then
    echo "Copying ZSH config..."
    cp ~/dotfiles/zsh/.zshrc ~/.zshrc
  fi

  echo "Dotfiles have been installed!"
  $BACKUP && echo "Previous configs were backed up with .bak extension"
  ;;
*)
  usage
  ;;
esac
