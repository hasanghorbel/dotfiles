vim.pack.add({
  "https://github.com/catppuccin/nvim",
})

local catppuccin = require("catppuccin")

catppuccin.setup({
  flavour = "mocha",
  term_colors = true,
  transparent_background = true,
  styles = {},
  lsp_styles = {
    inlay_hints = {
      background = false,
    },
  },
  integrations = {
    mason = true,
    blink_cmp = {
      style = "bordered",
    },
    which_key = true,
    telescope = {
      enabled = true,
    },
    nvimtree = true,
    mini = {
      enabled = true,
      indentscope_color = "lavander",
    },
  },
})

vim.cmd.colorscheme("catppuccin")


-- Underline rust mutable variables
vim.api.nvim_set_hl(0, "@lsp.mod.mutable.rust", { underline = true })
vim.api.nvim_set_hl(0, "@lsp.mod.mutable.rust", { underline = true })

-- transparent floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
