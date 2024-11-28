return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.commands = opts.commands or {}
    opts.commands.open_in_finder = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      if vim.fn.has("macunix") == 1 then
        if vim.fn.isdirectory(path) == 1 then
          os.execute('open "' .. vim.fn.fnamemodify(path, ":p") .. '"')
        else
          os.execute('open -R "' .. vim.fn.fnamemodify(path, ":p") .. '"')
        end
      else
        print("Opening in Finder is only supported on macOS")
      end
    end

    opts.window = opts.window or {}
    opts.window.mappings = opts.window.mappings or {}
    opts.window.mappings.F = "open_in_finder"

    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
    opts.filesystem.filtered_items = {
      visible = true, -- Make hidden files visible by default
      hide_dotfiles = false, -- Do not hide dotfiles (files starting with ".")
      hide_gitignored = false, -- Show files ignored by .gitignore
    }

    return opts
  end,
}
