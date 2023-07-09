-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>bo",
  "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
  { desc = "Close other buffers" }
)
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Turn off search highlighting" })
