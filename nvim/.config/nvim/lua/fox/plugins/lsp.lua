return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        vim.lsp.config('gleam', { capabilities = capabilities })
        vim.lsp.enable('gleam')
        vim.lsp.config('ts_ls', { capabilities = capabilities })
        vim.lsp.enable('ts_ls')
        vim.lsp.config('gopls', { capabilities = capabilities })
        vim.lsp.enable('gopls')
        vim.lsp.config('zls', { capabilities = capabilities })
        vim.lsp.enable('zls')
        vim.lsp.config('elixirls', {
            capabilities = capabilities,
            cmd = { "/Users/fox/.config/elixir_ls/language_server.sh" },
        })
        vim.lsp.enable('elixirls')
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                        },
                    },
                    hint = { enable = true },
                    telemetry = { enable = false },
                },
            },
        })
        vim.lsp.enable('lua_ls')
    end,
}
