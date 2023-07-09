return {
  -- molokai theme
  { "GustavoPrietoP/doom-themes.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "doom-molokai",
    },
  },
  -- codium plugin
  {
    "Exafunction/codeium.vim",
    config = function()
      vim.g.codeium_no_map_tab = true
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
    end,
  },
  -- copy text to the system clipboard plugin
  {
    "ojroques/nvim-osc52",
    config = function()
      vim.keymap.set("v", "<C-y>", require("osc52").copy_visual)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "isort")
      table.insert(opts.ensure_installed, "black")
      table.insert(opts.ensure_installed, "mypy")
      table.insert(opts.ensure_installed, "ruff")
      table.insert(opts.ensure_installed, "pyright")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.isort)
      table.insert(opts.sources, nls.builtins.formatting.black)
      table.insert(opts.sources, nls.builtins.diagnostics.mypy)
      table.insert(opts.sources, nls.builtins.diagnostics.ruff)
    end,
  },
  {
    "LazyVim/LazyVim",
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
  },
}
