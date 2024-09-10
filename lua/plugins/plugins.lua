return {
  -- color scheme
  -- { "GustavoPrietoP/doom-themes.nvim" },
  -- { "tanvirtin/monokai.nvim" },
  -- { "UtkarshVerma/molokai.nvim" },
  -- { "tamelion/neovim-molokai", lazy = false },
  -- { "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },
  -- { "adisen99/codeschool.nvim", dependencies = { "rktjmp/lush.nvim" } },
  -- { "rockyzhang24/arctic.nvim", dependencies = { "rktjmp/lush.nvim" } },
  -- { "ntk148v/habamax.nvim", dependencies = { "rktjmp/lush.nvim" } },
  -- {
  --   "polirritmico/monokai-nightasty.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     dark_style_background = "dark", -- default, dark, transparent, #color
  --   },
  -- },
  -- {
  --   "navarasu/onedark.nvim",
  --   opts = {
  --     style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "monokai-nightasty",
      -- colorscheme = "tokyonight-night",
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "onedark",
      -- colorscheme = "molokai",
      -- colorscheme = "doom-monokai-classic",
      -- colorscheme = "doom-molokai",
      -- colorscheme = "codeschool",
      -- colorscheme = "arctic",
      -- colorscheme = "cyberdream",
    },
  },
  -- {
  --   "miikanissi/modus-themes.nvim",
  --   opts = {
  --     style = "modus_operandi", -- Always use modus_operandi regardless of `vim.o.background`
  --     variant = "deuteranopia", -- Use deuteranopia variant
  --     styles = {
  --       functions = { italic = true }, -- Enable italics for functions
  --     },
  --
  --     on_colors = function(colors)
  --       colors.error = colors.red_faint -- Change error color to the "faint" variant
  --     end,
  --   },
  -- },
  -- { "bogado/file-line" },
  { "wsdjeg/vim-fetch" }, -- open file at line
  { "tpope/vim-abolish" }, -- change case
  {
    "TabbyML/vim-tabby",
    config = function()
      vim.g.tabby_keybinding_accept = "C-g"
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["tabby#Accept"]()
      end, { expr = true })
    end,
  },
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
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000, -- Set to 5 seconds
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    opts = {
      api_host_cmd = "echo -n http://127.0.0.1:11434",
      api_key_cmd = "echo -n ollama",
      -- ollama model deepseek-coder:33b is aliasses to gpt-3.5-turbo
      -- actions_paths = { "/home/oded/.config/nvim/helpers/actions.json" },
      openai_params = {
        max_tokens = 9000,
      },
      openai_edit_params = {
        max_tokens = 9000,
      },
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
  --     -- model = "gpt-3.5-turbo",
  --     model = "starcoder2:7b",
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
  {
    "ojroques/nvim-osc52",
    config = function()
      vim.keymap.set("v", "<C-y>", require("osc52").copy_visual)
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        resize_to_content = true,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "codespell",
        -- "golangci-lint",
        "golangci-lint-langserver",
        "groovy-language-server",
        -- "harper-ls",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.diagnostics.codespell,
        -- nls.builtins.diagnostics.golangci_lint,
      })
    end,
  },
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.editor.aerial" },
  { import = "lazyvim.plugins.extras.editor.dial" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.lang.ansible" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.helm" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.terraform" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lsp.none-ls" },
  { import = "lazyvim.plugins.extras.ui.treesitter-context" },
  -- { import = "lazyvim.plugins.extras.lang.clangd" },
  -- { import = "lazyvim.plugins.extras.coding.codeium" },
}
