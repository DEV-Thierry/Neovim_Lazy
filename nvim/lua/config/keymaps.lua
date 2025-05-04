-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local dap = require("dap")

vim.keymap.set("i", "jk", "<Esc>", { desc = "Sair do modo insert" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Sair do modo insert" })
vim.keymap.set("n", "<C-f>", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

vim.keymap.set("n", "<F5>", function()
  dap.continue()
end, { desc = "Iniciar depuração" })
vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, { desc = "Step over" })
vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, { desc = "Step into" })
vim.keymap.set("n", "<F12>", function()
  dap.step_out()
end, { desc = "Step out" })
vim.keymap.set("n", "<leader>b", function()
  dap.toggle_breakpoint()
end, { desc = "Alternar breakpoint" })
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Condição: "))
end, { desc = "Breakpoint com condição" })

--navegar entra abas
-- vim.api.nvim_set_keymap("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Próximo Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true, desc = "Buffer Anterior" })

vim.keymap.set("n", "<M-q>", ":bd<CR>", { silent = true, desc = "Fechar Buffer" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

-- Dividir janelas tmux
vim.api.nvim_set_keymap("n", "ss", ":split<CR><C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sv", ":vsplit<CR><C-w>w", { noremap = true, silent = true })

-- Mover entre janelas
vim.api.nvim_set_keymap("n", "sh", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sj", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sk", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sl", "<C-w>l", { noremap = true, silent = true })
