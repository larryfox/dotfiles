return {
  "ibhagwan/fzf-lua",
  event = "VimEnter",
  config = function()
    local fzflua = require("fzf-lua")

    fzflua.setup({
      "max-perf",
      winopts  = {
        width = 0.6,
        height = 0.4,
        row = 0.3,
        col = 0.5,
      },
      defaults = { previewer = false },
    })

    vim.keymap.set("n", "<C-p>", fzflua.files, { silent = true })
    vim.keymap.set("n", "<leader>b", fzflua.buffers, { silent = true })
    vim.keymap.set("n", "<leader>rg", fzflua.live_grep, { silent = true })
    vim.keymap.set("n", "<leader>l", fzflua.blines, { silent = true })
    vim.keymap.set("n", "<leader>w", fzflua.grep_cword, { silent = true })
    vim.keymap.set("n", "<leader>gf", fzflua.git_files, { silent = true })
  end
}
