local function is_ruby_version_supported()
  local handle = io.popen("ruby -e 'puts RUBY_VERSION'")
  if handle then
    local version = handle:read("*a")
    handle:close()
    if version then
      local major, minor = version:match("^(%d+)%.(%d+)")
      if major and minor then
        return tonumber(major) > 2 or (tonumber(major) == 2 and tonumber(minor) >= 7)
      end
    end
  end
  return false
end

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    if is_ruby_version_supported() then
      print("Ruby version supported. Starting ruby-lsp.")
      opts.servers.ruby_ls = {} -- Configure ruby-lsp only if supported
    else
      print("Ruby version < 2.7 detected. Skipping ruby-lsp.")
    end
  end,
}
