vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
})

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",

    layout_config = {
      horizontal = {
        width = 0.8,
        height = 0.8,
        preview_width = 0.6,
      },
    },

    mappings = {
      i = {
        -- Navigate results
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        -- Close Telescope
        ["<C-c>"] = actions.close,

        -- Open selection
        ["<CR>"] = actions.select_default,

        -- Open in horizontal split
        ["<C-x>"] = actions.select_horizontal,

        -- Open in vertical split
        ["<C-v>"] = actions.select_vertical,

        -- Open in new tab
        ["<C-t>"] = actions.select_tab,
      },

      n = {
        -- Navigate results in normal mode
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ["q"] = actions.close,
        ["<Esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
      },
    },
  },

  extensions = {
    ["ui-select"] = themes.get_dropdown(),
  },
})

-- Load extensions safely
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")


vim.keymap.set("n", "<leader>sh", builtin.help_tags, {
  desc = "Search Help",
})

vim.keymap.set("n", "<leader>sk", builtin.keymaps, {
  desc = "Search Keymaps",
})

vim.keymap.set("n", "<leader>sf", builtin.find_files, {
  desc = "Search Files",
})

vim.keymap.set("n", "<leader>ss", builtin.builtin, {
  desc = "Search Telescope",
})

vim.keymap.set("n", "<leader>sw", builtin.grep_string, {
  desc = "Search current Word",
})

vim.keymap.set("n", "<leader>sg", builtin.live_grep, {
  desc = "Search by Grep",
})

vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {
  desc = "Search Diagnostics",
})

vim.keymap.set("n", "<leader>sr", builtin.resume, {
  desc = "Search Resume",
})

vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {
  desc = "Search Recent Files",
})

vim.keymap.set("n", "<leader><leader>", builtin.buffers, {
  desc = "Find Buffers",
})

vim.keymap.set("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find(
    themes.get_dropdown({
      winblend = 10,
      previewer = false,
    })
  )
end, {
  desc = "Search Current Buffer",
})

vim.keymap.set("n", "<leader>s/", function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, {
  desc = "Search Open Files",
})

vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files({
    cwd = vim.fn.stdpath("config"),
  })
end, {
  desc = "Search Neovim Config",
})