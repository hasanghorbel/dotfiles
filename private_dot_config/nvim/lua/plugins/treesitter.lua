vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
  },
})

local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
  vim.notify(
    "nvim-treesitter is not installed yet. Restart Neovim and try again.",
    vim.log.levels.WARN
  )
  return
end

treesitter.setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  },

  auto_install = true,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },
})
