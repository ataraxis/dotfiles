return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'projekt0n/github-nvim-theme'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-fugitive'
  use 'vim-scripts/argtextobj.vim'
  use 'numToStr/Comment.nvim'

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    },
  }

  use {
    "scalameta/nvim-metals",
    requires = { "nvim-lua/plenary.nvim" },
  }

end)
