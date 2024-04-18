return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local function isTree()
        return vim.bo.filetype == "neo-tree"
      end

      local function isFile()
        return vim.bo.filetype ~= "neo-tree"
      end

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "onedark",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            { "mode", cond = isFile }
          },
          lualine_b = {
            { "branch", cond = isFile },
            { "diff", cond = isFile },
            { "diagnostics", cond = isFile }
          },
          lualine_c = {
            { "filename", cond = isFile },
            { "progress", cond = isTree }
          },
          lualine_x = {
            { "encoding", cond = isFile },
            { "fileformat", cond = isFile },
            { "filetype", cond = isFile },
            { "location", cond = isTree }
          },
          lualine_y = {
            { "progress", cond = isFile }
          },
          lualine_z = {
            { "location", cond = isFile }
          }
        },
        inactive_sections = {
          lualine_c = {
            { "filename", cond = isFile }
          },
          lualine_x = {
            { "location", cond = isFile }
          }
        }
      })
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    config = function()
      vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", { desc = "Toggle file tree" })
      vim.keymap.set("n", "<leader>t", ":Neotree focus<CR>", { desc = "Focus to file tree" })
    end
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "th:wq"
        }
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>b", ":BufferLinePick<CR>", { desc = "Pick buffer" })
      vim.keymap.set("n", "<leader>B", ":BufferLinePickClose<CR>", { desc = "Pick and close buffer" })
      vim.keymap.set("n", "<leader>W", ":BufferLineCloseOthers<CR>", { desc = "Close others buffer" })
      vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
      vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
      vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
      vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
      vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
      vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" })
      vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" })
      vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8" })
      vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9" })
      vim.keymap.set("n", "<leader>0", ":BufferLineGoToBuffer 10<CR>", { desc = "Go to buffer 10" })
    end
  }
}
