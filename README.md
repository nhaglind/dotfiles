# Dotfiles

Personal development environment configurations.

<img width="1516" alt="Screenshot 2024-11-16 at 9 08 47 PM" src="https://github.com/user-attachments/assets/7f2ffd67-ad38-4ab0-b10c-ef66b35ca0d0">
<img width="1516" alt="Screenshot 2024-11-16 at 9 07 06 PM" src="https://github.com/user-attachments/assets/305dadda-11ef-43e9-ab99-819dd03e3c3a">

## Installation

```bash
git clone https://github.com/nhaglind/dotfiles.git ~/dotfiles
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
- SchemaStore.nvim
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
- indent-blankline.nvim
- lazy.nvim
- lazydev.nvim
- lualine.nvim
- luvit-meta
- markdown-preview.nvim
- mason-lspconfig.nvim
- mason.nvim
- mini.ai
- mini.icons
- mini.pairs
- mini.surround
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
- render-markdown.nvim
- ror.nvim
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
- yanky.nvim
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
- Ripgrep

## Notes

- Configs are backed up with .bak extension before installation
- Update script (-u) creates timestamped commits
