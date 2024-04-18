return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", tag = "v1.0.0" },

      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim" },
    },
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({})
      require("neodev").setup({})
      require("fidget").setup({
        progress = {
          display = {
            progress_icon = { pattern = "pipe", period = 1 },
          }
        }
      })

      -- Setup language servers
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({})
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            }
          }
        }
      })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename file", buffer = ev.buf })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = ev.buf })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references", buffer = ev.buf })
          vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = ev.buf })
          vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = ev.buf })

          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })
    end
  }
}
