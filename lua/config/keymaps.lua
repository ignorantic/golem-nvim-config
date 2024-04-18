-- Global mappings.
vim.g.mapleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<leader>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>d", "viwd", { desc = "Delete word under cursor" })
vim.keymap.set("n", "<leader>s", "viws", { desc = "Delete word and enter insert mode" })
vim.keymap.set("n", "<leader>y", "yiw", { desc = "Yank word under cursor" })
vim.keymap.set("n", "<leader>p", "viwp", { desc = "Replace word under cursor" })
vim.keymap.set("n", "<leader>P", 'viw"0p', { desc = "Replace word without yank" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Simulate Ecs for terminal" })

-- Buffers
vim.keymap.set("n", "<leader>w", ":bdelete<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Go to previous buffer" })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
