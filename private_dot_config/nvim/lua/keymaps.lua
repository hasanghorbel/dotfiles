local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Save
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Quit
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Clear search
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Delete without overwriting the yank register
keymap({"n", "v"}, "d", '"_d', { desc = "Delete without yanking" })
keymap({"n", "v"}, "D", '"_D', { desc = "Delete to EOL without yanking" })
keymap({"n", "v"}, "x", '"_x', { desc = "Delete char without yanking" })
keymap("n", "dd", '"_dd', { desc = "Delete line without yanking" })

-- Paste over visual selection without losing the yanked text
keymap("v", "p", '"_dP', { desc = "Paste without overwriting register" })
