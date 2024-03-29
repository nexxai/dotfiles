-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Proxy common typos
vim.api.nvim_create_user_command("Bd", ":bd", { bang = true })
vim.api.nvim_create_user_command("Qa", ":qa", { bang = true })

-- Disable annoying command line typo
vim.keymap.set("n", "q:", ":q<cr>")
vim.keymap.set("n", "qa:", ":qa<cr>")

-- Automatically add semicolon or comma at the end of the line in INSERT mode
vim.keymap.set("i", ";;", "<ESC>A;")
vim.keymap.set("i", ",,", "<ESC>A,")

-- Live grep
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- Update all plugins
vim.keymap.set("n", "<C-a><C-l>", "<cmd>Lazy update<cr>")

-- Neotest
vim.keymap.set("n", "<leader>t", "<cmd>lua require('neotest').run.run()<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>")
vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run({ suite = true })
end)
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.open()<cr>")

-- Move lines of text up and down
-- Normal Mode
vim.keymap.set("n", "<C-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-Up>", ":m .-2<CR>==")
-- Insert Mode
vim.keymap.set("i", "<C-Down>", "<esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<C-Up>", "<esc>:m .-2<CR>==gi")
-- Visual Mode
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")
