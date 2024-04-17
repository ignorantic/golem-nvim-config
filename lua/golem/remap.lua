-- Global mappings.
vim.g.mapleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<leader>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>d", "viwd", { desc = "Delete word under cursor" })
vim.keymap.set("n", "<leader>s", "viws", { desc = "Delete word and enter insert mode" })
vim.keymap.set("n", "<leader>y", "yiw", { desc = "Yank word under cursor" })
vim.keymap.set("n", "<leader>p", "viwp", { desc = "Replace word under cursor" })
vim.keymap.set("n", "<leader>P", "viw\"0p", { desc = "Replace word without yank" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Simulate Ecs for terminal" })

-- NvimTree
vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>t", ":NvimTreeFocus<CR>", { desc = "Focus to file tree" })

-- Buffers
vim.keymap.set("n", "<leader>w", ":bdelete<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Go to previous buffer" })

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

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })

-- UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

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
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
