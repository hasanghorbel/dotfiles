vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/lukas-reineke/lsp-format.nvim",
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ========================================
-- Format on save (lsp-format)
-- ========================================

require("lsp-format").setup({
  c    = { tab_width = 4 },
  cpp  = { tab_width = 4 },
  yaml = { tab_width = 2 },
})

-- ========================================
-- Server configs (only put overrides here)
-- ========================================

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  },
  pyright = {},
  ts_ls = {},
  html = {},
  cssls = {},
  bashls = {},
  clangd = {},
  jsonls = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, vim.tbl_deep_extend("force", { capabilities = capabilities }, opts))
end

vim.lsp.enable(vim.tbl_keys(servers))

-- ========================================
-- Diagnostics
-- ========================================

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})

-- ========================================
-- LSP Keymaps (buffer-local, set on attach)
-- ========================================

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local buf = event.buf

    -- Attach lsp-format to this client
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
      require("lsp-format").on_attach(client, buf)
    end

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
    end

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
    map("n", "gr", vim.lsp.buf.references, "Find References")
    map("n", "gI", vim.lsp.buf.implementation, "Go to Implementation")

    -- Documentation
    map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

    -- Refactoring
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

    -- Formatting
    map({ "n", "v" }, "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, "Format")
  end,
})

-- ========================================
-- Diagnostic Keymaps (global, not attach-dependent)
-- ========================================

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
vim.keymap.set("n", "<leader>xx", vim.diagnostic.setloclist, { desc = "Show Diagnostics" })