return {
  -- Undo tree navigation
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },

  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth" },

  -- Displays a popup with possible key bindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },

      -- Adds LSP completion capabilities
      { "hrsh7th/cmp-nvim-lsp" },

      -- Adds a number of user-friendly snippets
      { "rafamadriz/friendly-snippets" },
    }
  },

  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false, -- enable debug logging for commands
        go_to_source_definition = {
          fallback = true, -- fall back to standard LSP definition on failure
        },
        server = { -- pass options to lspconfig"s setup method
          -- on_attach = ...,
        },
      })
    end
  }
}
