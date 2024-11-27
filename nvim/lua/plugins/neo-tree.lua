return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.commands = opts.commands or {}
    opts.commands.open_in_finder = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      if vim.fn.has("macunix") == 1 then
        os.execute('open "' .. vim.fn.fnamemodify(path, ":p") .. '"')
      else
        print("Opening in Finder is only supported on macOS")
      end
    end

    opts.window = opts.window or {}
    opts.window.mappings = opts.window.mappings or {}
    opts.window.mappings.F = "open_in_finder"

    return opts
  end,
}
