return {
  {
    "weizheheng/ror.nvim",
    ft = { "ruby", "eruby" },
    keys = {
      { "<leader>rc", ":lua require('ror.commands').list_commands()<CR>", desc = "Commands" },
    },
  },
}
