return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "n",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "eslint_d", "prettierd" },
            typescript = { "eslint_d", "prettierd" },
            javascriptreact = { "eslint_d", "prettierd" },
            typescriptreact = { "eslint_d", "prettierd" },
        },
    },
}
