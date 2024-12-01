return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      ensure_installed = { "solargraph" },
      automatic_installation = true,
    })

    lspconfig.solargraph.setup({
      settings = {
        solargraph = {
          diagnostics = true,
          completion = true,
        },
      },
      root_dir = function(fname)
        return require("lspconfig.util").find_git_ancestor(fname) or vim.loop.cwd()
      end,
      on_attach = function(client, bufnr)
        local buf_map = function(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        buf_map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
        buf_map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
        buf_map("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
        buf_map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
        buf_map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
        buf_map("n", "<leader>qc", ":cclose<CR>:lclose<CR>", { desc = "Close Quickfix/Location List" })
        buf_map("n", "<leader>fd", function()
          vim.diagnostic.open_float(nil, { scope = "line" })
        end, { desc = "Show Line Diagnostics" })
      end,
    })

    vim.notify("Solargraph LSP is configured for Ruby files!", vim.log.levels.INFO)
  end,
}
