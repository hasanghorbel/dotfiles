vim.pack.add({
  "https://github.com/windwp/nvim-autopairs",
})

require("nvim-autopairs").setup({
  check_ts = false,
  fast_wrap = {},   -- Alt-e to wrap/jump out of brackets
})


local ok, cmp = pcall(require, "cmp")
if ok then
  cmp.event:on(
    "confirm_done",
    require("nvim-autopairs.completion.cmp").on_confirm_done()
  )
end