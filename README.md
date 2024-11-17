# Dotfiles

Personal development environment configurations.

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

