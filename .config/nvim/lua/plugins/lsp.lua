local function is_ruby_version_supported()
  local version = vim.fn.systemlist("ruby -e 'puts RUBY_VERSION'")[1]
  if version then
    local major, minor = version:match("^(%d+)%.(%d+)")
    if major and minor then
      return tonumber(major) > 2 or (tonumber(major) == 2 and tonumber(minor) >= 7)
    end
  end
  return false
end

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    if is_ruby_version_supported() then
      vim.notify("Ruby version supported. Starting ruby-lsp.", vim.log.levels.INFO)
      opts.servers.ruby_ls = {
        settings = {
          ruby = {
            diagnostics = { enabled = true },
            formatting = { enabled = true },
          },
        },
      }
    else
      vim.notify("Ruby version < 2.7 detected. Skipping ruby-lsp.", vim.log.levels.WARN)
    end
  end,
}
