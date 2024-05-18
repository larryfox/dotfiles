vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>e", vim.cmd.Lex)
vim.keymap.set("n", "<leader>pt", vim.cmd.Tex)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


local function execute_buffer()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
  for i = 1, #lines do
    lines[i] = string.gsub(lines[i], '^%s*(.-)%s*\\?%s*$', '%1')
  end
  local cmd = table.concat(lines, " ")

  local title = string.gsub(cmd, "^%s*(.-)%s*$", "%1")
  if #title > 75 then
    title = string.sub(title, 0, 35) .. " ... " .. string.sub(title, -35)
  end

  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, { "Running..." })

  local on_exit = function(obj)
    local out_lines = {}
    for line in string.gmatch(obj.stdout, "([^\n]*)\n?") do
      table.insert(out_lines, line)
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, out_lines)
  end

  vim.system({ "sh", "-c", cmd }, { text = true }, vim.schedule_wrap(on_exit))

  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = bufnr })

  local win = vim.api.nvim_open_win(bufnr, true, {
    style = "minimal",
    relative = "editor",
    title = title,
    title_pos = "center",
    row = math.floor(((vim.o.lines - 24) / 2) - 1),
    col = math.floor((vim.o.columns - 80) / 2),
    width = 80,
    height = 24,
    border = "single",
  })
end

vim.keymap.set({ "n", "v" }, "<leader>sh", execute_buffer)
