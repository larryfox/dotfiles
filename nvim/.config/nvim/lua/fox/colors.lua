local signdef = vim.fn.sign_define
local highlight = function(str, opt)
  vim.api.nvim_set_hl(0, str, opt)
end

Colors = {}

function Colors:hl_number_insert()
  highlight("LineNr", { fg = "grey", bold = false })
end

function Colors:hl_number()
  highlight("LineNr", { fg = "blue", bold = true })
end

Colors:hl_number()
highlight("LineNrAbove", { fg = "grey" })
highlight("LineNrBelow", { fg = "grey" })
highlight("ColorColumn", { bg = "#f5f5f5" })
highlight("SignColumn", { bg = "lightgrey" })
highlight("DiagnosticWarn", { fg = "darkorange" })

local signs = {
  { name = "DiagnosticSignError", text = "E", fg = "white", bg = "red" },
  { name = "DiagnosticSignWarn", text = "W", fg = "white", bg = "darkorange" },
  { name = "DiagnosticSignInfo", text = "I", fg = "black", bg = "lightgrey" },
  { name = "DiagnosticSignHint", text = "H", fg = "grey", bg = "lightgrey" },
}

for _, sign in ipairs(signs) do
  highlight(sign.name, { fg = sign.fg, bg = sign.bg, bold = true })
  signdef(sign.name, { text = sign.text, texthl = sign.name, linehl = "", numhl = "" })
end
