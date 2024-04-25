return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      -- lua = { "selene" },
      typescript = { "eslint_d" },
      javascript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascriptreact = { "eslint_d" },
    }
    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged", "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("Lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
