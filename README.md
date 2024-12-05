# Dotfiles

Personal development environment configurations.

## Installation

```bash
# Clone the repository and set permissions
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
```
