return {
  { "tanvirtin/monokai.nvim" },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  { "mbbill/undotree" },

  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth" },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },

      -- Adds LSP completion capabilities
      { "hrsh7th/cmp-nvim-lsp" },

      -- Adds a number of user-friendly snippets
      { "rafamadriz/friendly-snippets" },
    },
  },

  { "folke/which-key.nvim" },

  { "jose-elias-alvarez/typescript.nvim" }
}
