## 🚀 Dotfiles

My personal development environment configurations featuring Alacritty, Neovim (LazyVim), and Zellij.

## 📦 What's Inside

- **Alacritty**: A fast, GPU-accelerated terminal emulator
- **Neovim**: Highly extensible text editor with LazyVim configuration
- **Zellij**: Terminal workspace with multiplexer capabilities

## 🛠️ Requirements

- Git
- Neovim >= 0.9.0
- Alacritty
- Zellij

## 🚀 Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/nhaglind/dotfiles.git ~/dotfiles
   ```

2. Make the setup script executable:
   ```bash
   chmod +x ~/dotfiles/dotfiles.sh
   ```

3. Use the script to manage your dotfiles:
   ```bash
   # Install dotfiles to your system (creates backups of existing configs)
   ./dotfiles.sh -i

   # Update repository with your current configs
   ./dotfiles.sh -u
   ```

## ⚙️ Configuration Details

### Neovim Setup (LazyVim)
- Custom plugins configuration in `nvim/lua/plugins`
- Key mappings and options in `nvim/lua/config`
- Uses LazyVim as the base configuration

### Alacritty
- Modern terminal configuration
- Custom color schemes
- Performance-focused settings

### Zellij
- Terminal multiplexer configuration
- Custom layouts and keybindings
- Session management settings

## 🔄 Updating

The dotfiles can be easily updated using the provided script. It will automatically:
- Copy your current configurations to the repository
- Create a timestamped commit
- Remind you to push changes

## 📝 Notes

- Existing configurations are automatically backed up with `.bak` extension
- The update script (`-u`) will create a git commit with timestamp
- Remember to `git push` after updating to sync with remote repository
