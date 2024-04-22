vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.updatetime = 250
vim.opt.timeoutlen = 350

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd.syntax 'off'
vim.opt.termguicolors = true
vim.opt.background = 'light'

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'grey' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'blue', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'grey' })

vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'lightgrey' })

local signs = {
  { name = 'DiagnosticSignError', text = 'E', fg = 'white', bg = 'red' },
  { name = 'DiagnosticSignWarn', text = 'W', fg = 'white', bg = 'darkorange' },
  { name = 'DiagnosticSignInfo', text = 'I', fg = 'black', bg = 'lightgrey' },
  { name = 'DiagnosticSignHint', text = 'H', fg = 'grey', bg = 'lightgrey' },
}

vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = 'darkorange' })

for _, sign in ipairs(signs) do
  vim.api.nvim_set_hl(0, sign.name, { fg = sign.fg, bg = sign.bg, bold = true })
  vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, linehl = '', numhl = '' })
end

vim.api.nvim_create_autocmd('InsertEnter', {
  desc = 'Turn off relativenumber in insert mode',
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = false
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'grey', bold = false })
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  desc = 'Turn on relativenumber when leaving insert mode',
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = true
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'blue', bold = true })
  end,
})

-- case handling for find & replace
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.mouse = 'a'

vim.opt.scrolloff = 5

vim.keymap.set('n', '<leader>pv', vim.cmd.Vex)
vim.keymap.set('n', '<leader>px', vim.cmd.Sex)
vim.keymap.set('n', '<leader>pt', vim.cmd.Tex)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Spellcheck for git messages',
  pattern = 'gitcommit',
  callback = function()
    vim.cmd.syntax 'on'
    vim.opt.spell = true
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Strip trailing whitespace on save',
  pattern = '*',
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd [[keepjumps keeppatterns %s/\s\+$//e]]
    vim.fn.setpos('.', save_cursor)
  end,
})

-- diagnostics
local diagopts = { severity = { min = vim.diagnostic.severity.INFO } }

vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev(diagopts) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next(diagopts) end)
vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist(diagopts) end)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

vim.diagnostic.config({
  virtual_text = diagopts,
  signs = diagopts,
  underline = diagopts,
  float = diagopts,
})

-- plugins
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth',

  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    event = 'VimEnter',
    config = function()
      vim.g.fzf_layout = { window = { width = 0.6, height = 0.4, yoffset = 0.2 } }
      vim.g.fzf_vim = {
        preview_window = {}, -- disable preview
      }

      vim.keymap.set('n', '<C-p>', '<cmd>Files<cr>')
      vim.keymap.set('n', '<leader>b', '<cmd>Buffers<cr>')
      vim.keymap.set('n', '<leader>l', '<cmd>Lines<cr>')
      vim.keymap.set('n', '<leader>gf', '<cmd>GFiles<cr>')
    end,
  },

  { 'numToStr/Comment.nvim', event = 'VimEnter', opts = {} },

  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.tsserver.setup {}
      lspconfig.gopls.setup {}
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = { 'vim' },
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
      }
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local opts = { buffer = event.buf }

          client.server_capabilities.semanticTokensProvider = nil

          vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
        end,
      })
    end,
  },

  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true, lsp_fallback = true })
        end,
        mode = 'n',
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        -- lua = { 'stylua' },
        javascript = { 'prettierd', 'eslint_d' },
        typescript = { 'prettierd', 'eslint_d' },
        javascriptreact = { 'prettierd', 'eslint_d' },
        typescriptreact = { 'prettierd', 'eslint_d' },
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        -- lua = { 'selene' },
        typescript = { 'eslint_d' },
        javascript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
      }
      vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'TextChanged', 'BufWritePost' }, {
        group = vim.api.nvim_create_augroup('Lint', { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
})
