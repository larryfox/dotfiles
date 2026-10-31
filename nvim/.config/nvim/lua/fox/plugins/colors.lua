return {
    lazy = false,
    -- 'Verf/deepwhite.nvim',
    -- "savq/melange-nvim",
    "cideM/yui",
    config = function()
        vim.opt.background = "light"
        vim.g.yui_comments = "fade"
        vim.g.yui_line_numbers = "fade"
        vim.cmd.colorscheme("yui")
    end,
}
