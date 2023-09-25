-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Fast copy to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Copy to end of line"})

-- Fast save and exit
vim.keymap.set("n", "Q", "<cmd>wa<cr>ZZ", { desc = "Save all and exit"})

-- Fast quickfix jump
vim.keymap.set("n", "<leader>q", "<cmd>cnext<cr>", { desc = "Go to the next quickfix item" })

-- Copy the path of the current file
vim.keymap.set("n", "<leader>fc", "<cmd>let @+ = expand('%')<cr>", { desc = "Copy the current path to clipboard" })

-- Clear the current search highlights
vim.keymap.set("n", "<leader>,", "<cmd>nohlsearch<cr>", { desc = "Clear the current search" })

-- Fast exit insert mode
vim.keymap.set("i", "kj", "<esc><cmd>update<cr>", { desc = "Quickly exit insert mode and save" })

-- Copy current selection to system clipboard
vim.keymap.set("v", "<leader>c", "\"+y", { desc = "Copy to clipboard" })
