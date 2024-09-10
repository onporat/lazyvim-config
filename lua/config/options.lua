-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""
vim.opt.mouse = ""
vim.g.loaded_matchparen = 1

vim.opt.iskeyword:append("-")
-- autocmd FileType javascript lua vim.opt.iskeyword:append("-")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.ansible",
  callback = function()
    vim.opt_local.iskeyword:append(".")
  end,
})
