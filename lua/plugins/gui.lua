return {
  { "nvim-lualine/lualine.nvim" },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    }
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
