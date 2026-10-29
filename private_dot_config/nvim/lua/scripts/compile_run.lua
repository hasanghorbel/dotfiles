local keymap = vim.keymap.set

vim.g.mapleader = " "

local function build_cmds()
  local f   = vim.fn.shellescape(vim.fn.expand("%:p"))
  local out = vim.fn.shellescape(vim.fn.expand("%:p:r")) -- binary: same name, no extension
  local ft  = vim.bo.filetype
  local compile, run

  if ft == "c" then
    compile = "gcc -O2 -Wall -o " .. out .. " " .. f
    run = out
  elseif ft == "cpp" then
    compile = "g++ -std=c++20 -O2 -Wall -o " .. out .. " " .. f
    run = out
  elseif ft == "rust" then
    compile = "rustc -O -o " .. out .. " " .. f
    run = out
  elseif ft == "python" then
    run = "python3 " .. f
  end

  return compile, run
end

local function exec_in_terminal(cmd)
  vim.cmd("write")
  vim.cmd("botright 12split")
  vim.cmd("terminal " .. cmd)
  vim.cmd("startinsert")
end

-- Compile + run
keymap("n", "<leader>r", function()
  local compile, run = build_cmds()
  if not run then
    return vim.notify("No runner for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
  end
  exec_in_terminal(compile and (compile .. " && " .. run) or run)
end, { desc = "Compile and run" })

-- Compile + run with input.txt as stdin
keymap("n", "<leader>ri", function()
  local compile, run = build_cmds()
  if not run then
    return vim.notify("No runner for filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
  end
  exec_in_terminal((compile and (compile .. " && ") or "") .. run .. " < input.txt")
end, { desc = "Compile and run with input.txt" })

-- Compile only
keymap("n", "<leader>c", function()
  local compile = build_cmds()
  if not compile then
    return vim.notify("Nothing to compile for this filetype", vim.log.levels.WARN)
  end
  exec_in_terminal(compile)
end, { desc = "Compile only" })

-- Terminal helpers
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Leave terminal mode" })
keymap("n", "<leader>x", "<cmd>bd!<CR>", { desc = "Close terminal/buffer" })