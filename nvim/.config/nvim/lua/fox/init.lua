require("fox.set")
require("fox.colors")
require("fox.remap")
require("fox.lazy")

-- I've always used <cmd>E as a shortcut for <cmd>Explore, and EditQuery causes ambiguities
vim.api.nvim_del_user_command('EditQuery')

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local FoxGroup = augroup("Fox", {})
local YankGroup = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  pattern = "*",
  group = YankGroup,
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40
    })
  end,
})

autocmd("BufWritePre", {
  pattern = "*",
  group = FoxGroup,
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd [[keepjumps keeppatterns %s/\s\+$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
})

autocmd("FileType", {
  pattern = "gitcommit",
  group = FoxGroup,
  callback = function()
    vim.opt.spell = true
  end,
})

autocmd("InsertEnter", {
  pattern = "*",
  group = FoxGroup,
  callback = function()
    vim.opt.relativenumber = false
    Colors:hl_number_insert()
  end,
})

autocmd("InsertLeave", {
  pattern = "*",
  group = FoxGroup,
  callback = function()
    vim.opt.relativenumber = true
    Colors:hl_number()
  end,
})

autocmd("LspAttach", {
  group = FoxGroup,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil

    local opts = { buffer = event.buf }

    -- vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
  end,
})


