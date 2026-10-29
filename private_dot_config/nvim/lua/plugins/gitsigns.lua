vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({
  current_line_blame = false,
})

vim.keymap.set("n", "]h", function()
  require("gitsigns").next_hunk()
end, {
  desc = "Next Git change",
})

vim.keymap.set("n", "[h", function()
  require("gitsigns").prev_hunk()
end, {
  desc = "Previous Git change",
})

vim.keymap.set("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, {
  desc = "Stage Git hunk",
})

vim.keymap.set("n", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end, {
  desc = "Reset Git hunk",
})
