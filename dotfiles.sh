#!/bin/bash

BACKUP=true
HANDLE_ZSHRC=false

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
  mkdir -p ~/dotfiles/.config
  rsync -a --exclude ".git" ~/.config/alacritty ~/dotfiles/.config/
  rsync -a --exclude ".git" ~/.config/nvim ~/dotfiles/.config/
  rsync -a --exclude ".git" ~/.config/btop ~/dotfiles/.config/
  rsync -a --exclude ".git" ~/.config/zellij ~/dotfiles/.config/
  cp ~/.gemrc ~/dotfiles/.gemrc
  cp ~/.gitignore ~/dotfiles/.gitignore
  [ "$HANDLE_ZSHRC" = true ] && cp ~/.zshrc ~/dotfiles/.zshrc

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
    [ -f ~/.gemrc ] && mv ~/.gemrc ~/.gemrc.bak
    [ -f ~/.gitignore ] && mv ~/.gitignore ~/.gitignore.bak
    [ "$HANDLE_ZSHRC" = true ] && [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
  fi

  rsync -a --exclude ".git" ~/dotfiles/.config/alacritty ~/.config/
  rsync -a --exclude ".git" ~/dotfiles/.config/nvim ~/.config/
  rsync -a --exclude ".git" ~/dotfiles/.config/btop ~/.config/
  rsync -a --exclude ".git" ~/dotfiles/.config/zellij ~/.config/
  cp ~/dotfiles/.gemrc ~/.gemrc
  cp ~/dotfiles/.gitignore ~/.gitignore
  [ "$HANDLE_ZSHRC" = true ] && cp ~/dotfiles/.zshrc ~/.zshrc

  echo "Dotfiles have been installed!"
  $BACKUP && echo "Previous configs were backed up with .bak extension"
  ;;
*)
  usage
  ;;
esac
