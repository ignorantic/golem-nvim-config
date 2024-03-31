vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use "tanvirtin/monokai.nvim"

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use "mbbill/undotree"

  -- Git related plugins
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use "airblade/vim-gitgutter"

  -- Detect tabstop and shiftwidth automatically
  use "tpope/vim-sleuth"

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  use {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", tag = "v1.0.0" },

      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim" }
    }
  }

  use {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    requires = {
      -- Snippet Engine & its associated nvim-cmp source
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },

      -- Adds LSP completion capabilities
      { "hrsh7th/cmp-nvim-lsp" },

      -- Adds a number of user-friendly snippets
      { "rafamadriz/friendly-snippets" }
    }
  }

  use "folke/neodev.nvim"

  use "folke/which-key.nvim"

  use "nvim-lualine/lualine.nvim"

  use "jose-elias-alvarez/typescript.nvim"

  use {
    "nvim-tree/nvim-tree.lua",
    requires = { { "nvim-tree/nvim-web-devicons" } }
  }

  use {
    "akinsho/bufferline.nvim",
    version = "*",
    requires = { { "nvim-tree/nvim-web-devicons" } }
  }
end)
