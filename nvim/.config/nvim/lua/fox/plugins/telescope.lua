return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".git",
                },
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.5,
                    width = 0.5,
                    preview_cutoff = 100000,
                },
            },
        })
        telescope.load_extension("fzf")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { silent = true })
        vim.keymap.set("n", "<leader>sg", builtin.git_files, { silent = true })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { silent = true })
        vim.keymap.set("n", "<leader>sw", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({
                search = word,
            })
        end, { silent = true })
    end,
}
