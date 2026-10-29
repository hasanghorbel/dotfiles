vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
  },

  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", {
  desc = "Open file explorer",
})
