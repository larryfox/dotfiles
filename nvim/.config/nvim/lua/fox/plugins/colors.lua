return {
    lazy = false,
    -- 'Verf/deepwhite.nvim',
    "cideM/yui",
    -- "savq/melange-nvim",
    config = function()
        vim.opt.background = "light"
        vim.g.yui_comments = "fade"
        vim.g.yui_line_numbers = "fade"
        vim.cmd.colorscheme("yui")
    end,
}
