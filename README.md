# Dotfiles

Personal development environment configurations.

## Installation

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/dotfiles.sh

# Install dotfiles (creates backups of existing configs)
./dotfiles.sh -i

# Update repository with current configs
./dotfiles.sh -u
```

## Contents

### Neovim (LazyVim)
Current plugins:
```
- LazyVim
- ayu
- bufferline.nvim
- catppuccin
- cmp-buffer
- cmp-nvim-lsp
- cmp-path
- conform.nvim
- dashboard-nvim
- dressing.nvim
- flash.nvim
- friendly-snippets
- gitsigns.nvim
- grug-far.nvim
- gruvbox.nvim
- indent-blankline.nvim
- lazy.nvim
- lazydev.nvim
- lualine.nvim
- luvit-meta
- mason-lspconfig.nvim
- mason.nvim
- mini.ai
- mini.icons
- mini.pairs
- neo-tree.nvim
- noice.nvim
- nui.nvim
- nvim-cmp
- nvim-lint
- nvim-lspconfig
- nvim-snippets
- nvim-treesitter
- nvim-treesitter-textobjects
- nvim-ts-autotag
- persistence.nvim
- plenary.nvim
- snacks.nvim
- telescope-fzf-native.nvim
- telescope.nvim
- todo-comments.nvim
- tokyonight.nvim
- trouble.nvim
- ts-comments.nvim
- vim-rails
- vim-surround
- which-key.nvim
```

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
