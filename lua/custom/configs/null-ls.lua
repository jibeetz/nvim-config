local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
	  require("none-ls.diagnostics.eslint_d"),
		require("none-ls.formatting.eslint_d"),
		require("none-ls.code_actions.eslint_d"),
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.formatting.rubocop,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
}

return opts
