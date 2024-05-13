return {
  -- molokai theme
  { "GustavoPrietoP/doom-themes.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "doom-molokai",
    },
  },
  {
    "miikanissi/modus-themes.nvim",
    opts = {
      style = "modus_operandi", -- Always use modus_operandi regardless of `vim.o.background`
      variant = "deuteranopia", -- Use deuteranopia variant
      styles = {
        functions = { italic = true }, -- Enable italics for functions
      },

      on_colors = function(colors)
        colors.error = colors.red_faint -- Change error color to the "faint" variant
      end,
    },
  },
  -- { "bogado/file-line" },
  { "wsdjeg/vim-fetch" },
  -- {
  --   "TabbyML/vim-tabby",
  --   config = function()
  --     vim.g.tabby_keybinding_accept = "C-g"
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["tabby#Accept"]()
  --     end, { expr = true })
  --   end,
  -- },
  -- codium plugin
  -- {
  --   "Exafunction/codeium.vim",
  --   config = function()
  --     vim.g.codeium_no_map_tab = true
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true })
  --   end,
  -- },
  -- copy text to the system clipboard plugin

  -- { "MunifTanjim/nui.nvim" },
  -- { "nvim-lua/plenary.nvim" },
  -- { "folke/trouble.nvim" },
  -- { "nvim-telescope/telescope.nvim" },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    opts = {
      api_host_cmd = "echo -n http://127.0.0.1:11434",
      api_key_cmd = "echo -n ollama",
      -- ollama model deepseek-coder:33b is aliasses to gpt-3.5-turbo
      -- actions_paths = { "/home/oded/.config/nvim/helpers/actions.json" },
      -- openai_params = {
      --   -- model = "yi:34b-chat",
      --   model = "deepseek-coder:33b",
      -- },
      -- openai_edit_params = {
      --   model = "deepseek-coder:33b",
      -- },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- {
  --   "huggingface/llm.nvim",
  --   opts = {
  --     backend = "ollama",
  --     url = "http://localhost:11434/api/generate",
  --     -- model = "deepseek-coder:6.7b",
  --     model = "gpt-3.5-turbo",
  --     -- model = "starcoder2:15b",
  --     api_token = nil,
  --     accept_keymap = "<C-g>",
  --     dismiss_keymap = "<C-]>",
  --     -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
  --     request_body = {
  --       -- Modelfile options for the model you use
  --       options = {
  --         temperature = 0.1,
  --         top_p = 0.95,
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "ojroques/nvim-osc52",
  --   config = function()
  --     vim.keymap.set("v", "<C-y>", require("osc52").copy_visual)
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    -- { import = "lazyvim.plugins.extras.lang.clangd" },
    -- { import = "lazyvim.plugins.extras.coding.codeium" },
  },
}
