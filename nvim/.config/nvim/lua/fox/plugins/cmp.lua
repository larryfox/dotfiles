return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
           snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            completion = { completeopt = "menu,menuone,noinsert" },
            mapping = {
                ["<C-n>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item(cmp_select)
                    elseif vim.snippet.active({ direction = 1 }) then
                        vim.snippet.jump(1)
                    end
                end, { "i", "s" }),
                ["<C-p>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item(cmp_select)
                    elseif vim.snippet.active({ direction = -1 }) then
                        vim.snippet.jump(-1)
                    end
                end, { "i", "s" }),
                ["<C-y>"] = {
                    i = cmp.mapping.confirm({ select = true })
                },
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
}
