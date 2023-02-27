vim.cmd('source ~/.vimrc')

-- disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- some metals/lsp stuff
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F")

require('plugins')
require('keymaps')

require("github-theme").setup({
  theme_style = "dark_default",
  function_style = "italic",
})

require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', function() return vim.g['metals_status'] or '' end },
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

require("nvim-tree").setup()

require('telescope').setup {
--  defaults = { file_ignore_patterns = { "node_modules" }}
}

require('Comment').setup()


-- local cmp = require("cmp")
-- cmp.setup({
--   sources = {
--     { name = "nvim_lsp" },
--     { name = "vsnip" },
--   },
--   snippet = {
--     expand = function(args)
--       vim.fn["vsnip#anonymous"](args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),
--     ["<Tab>"] = function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       else
--         fallback()
--       end
--     end,
--     ["<S-Tab>"] = function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       else
--         fallback()
--       end
--     end,
--   }),
-- })
--
--
-- local metals_config = require("metals").bare_config()
--
-- metals_config.settings = {
--   showImplicitArguments = true,
--   excludedPackages = { "akka.actor.typed.javadsl" },
-- }
-- metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
-- metals_config.init_options.statusBarProvider = "on"
--
-- local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "scala", "sbt", "java" },
--   callback = function()
--     require("metals").initialize_or_attach(metals_config)
--   end,
--   group = nvim_metals_group,
-- })
