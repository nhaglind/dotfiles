return {
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup {
        -- You can add configuration options here if needed
      }
    end,
  },
  {
    "shatur/neovim-ayu",
    name = "ayu",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}
