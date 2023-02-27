local keymap = vim.keymap.set
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<C-P>", ":Telescope find_files<CR>", opts)
--keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
--keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
--keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- LSP

local opts = { noremap=true, silent=true }
--keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)

keymap("n", "<leader>cl", vim.lsp.codelens.run, opts)

keymap("n", "<leader>ws", function()
  require("metals").hover_worksheet()
end, opts)

-- all workspace diagnostics
keymap("n", "<leader>aa", function()
  vim.diagnostic.setqflist()
end, opts)

-- all workspace errors
keymap("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end, opts)

-- all workspace warnings
keymap("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end, opts)

keymap("n", "[c", function()
  vim.diagnostic.goto_prev({ wrap = false })
end, opts)

keymap("n", "]c", function()
  vim.diagnostic.goto_next({ wrap = false })
end, opts)

keymap("n", "gD", function()
  vim.lsp.buf.definition()
end, opts)

keymap("n", "K", function()
  vim.lsp.buf.hover()
end, opts)

keymap("n", "gi", function()
  vim.lsp.buf.implementation()
end, opts)

keymap("n", "gr", function()
  vim.lsp.buf.references()
end, opts)

keymap("n", "gds", function()
  vim.lsp.buf.document_symbol()
end, opts)

keymap("n", "gws", function()
  vim.lsp.buf.workspace_symbol()
end, opts)

keymap("n", "<leader>cl", function()
  vim.lsp.codelens.run()
end, opts)

keymap("n", "<leader>sh", function()
  vim.lsp.buf.signature_help()
end, opts)

keymap("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, opts)

keymap("n", "<leader>f", function()
  vim.lsp.buf.format { async = true }
end, opts)

keymap("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, opts)
