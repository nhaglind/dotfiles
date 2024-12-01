# Dotfiles
Personal development environment configurations.
## Installation
```bash
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
- dressing.nvim
- flash.nvim
- friendly-snippets
- gitsigns.nvim
- grug-far.nvim
- indent-blankline.nvim
- kdl.vim
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
- poimandres.nvim
- render-markdown.nvim
- ror.nvim
- snacks.nvim
- telescope-fzf-native.nvim
- telescope.nvim
- todo-comments.nvim
- tokyonight.nvim
- trouble.nvim
- ts-comments.nvim
- vim-bundler
- vim-rails
- vim-surround
- which-key.nvim
- yanky.nvim
```
### .config Folder
- Alacritty
- Neovim
- Zellij
- Btop
### .zshrc and .gemrc
Shell and RubyGem configurations stored at the root of the repository. 
Those have additional requirements such as bat and eza.
## Requirements
- Neovim >= 0.9.0
- Git
- Alacritty
- Btop
- Zellij
- Ripgrep
## Notes
- Configs are backed up with .bak extension before installation by default.
