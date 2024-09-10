-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>bo",
  "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
  { desc = "Close other buffers" }
)
-- vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Turn off search highlighting" })
vim.keymap.set("n", "S", "S", { desc = "Restore S original functionally" })
vim.keymap.set("n", "<leader>fw", function()
  require("telescope.builtin").find_files({ default_text = vim.fn.expand("<cword>") })
end, { desc = "Find Files (Word)" })
vim.keymap.set("n", "yf", ':let @+=expand("%")<CR>', { desc = "Yank file path" })

-- Move Lines <A-j> => ∆   <A-k> => ˚
vim.keymap.set("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

local function toggle_scrolloff()
  if vim.o.scrolloff == 999 then
    vim.o.scrolloff = 4
    print("scrolloff set to 4")
  else
    vim.o.scrolloff = 999
    print("scrolloff set to 999")
  end
end
vim.keymap.set("n", "<leader>uz", toggle_scrolloff, { noremap = true, silent = true, desc = "Toggle scrolloff" })

vim.keymap.set("n", "<leader>uN", "<cmd>Telescope notify<cr>", { desc = "Display notifications" })
