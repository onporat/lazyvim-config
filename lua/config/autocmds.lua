-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- add nvim-dap-python entry with justMyCode turned off
local dap = require("dap")
local venv_path = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
local configs = dap.configurations.python or {}
dap.configurations.python = configs
table.insert(configs, {
  -- The first three options are required by nvim-dap
  type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
  request = "launch",
  name = "DebugPy: Launch file",
  program = "${file}", -- This configuration will launch the current file if used.
  -- venv on Windows uses Scripts instead of bin
  pythonPath = venv_path
      and ((vim.fn.has("win32") == 1 and venv_path .. "/Scripts/python") or venv_path .. "/bin/python")
    or nil,
  console = "integratedTerminal",
  justMyCode = false,
})

-- Autoformat setting
local set_autoformat = function(pattern, bool_val)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = pattern,
    callback = function()
      vim.b.autoformat = bool_val
    end,
  })
end

-- set_autoformat({ "cpp" }, true)
set_autoformat({ "yaml" }, false)

-- set darker backgound color
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#16181a" })
--
vim.cmd([[autocmd BufNewFile,BufRead *Jenkinsfile* setfiletype groovy]])
