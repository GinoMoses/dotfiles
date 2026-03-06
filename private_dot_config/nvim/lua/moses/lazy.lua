return {
    -- markdown syntax highlighting
    {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      ft = { 'markdown', 'copilot-chat' },
        opts = {},
    },

    -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Colorscheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- Utilities
  { 'theprimeagen/harpoon' },
  { 'mbbill/undotree' },
  { 'tpope/vim-fugitive' },
  { 'lambdalisue/suda.vim' },

  -- LSP (lsp-zero)
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
  },

  -- Autopairs
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },

  -- Copilot
  { 'github/copilot.vim' },

  -- Aerial (symbol outline panel)
  {
    'stevearc/aerial.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('aerial').setup({
        placement          = 'right',
        width              = 35,
        backends           = { 'lsp', 'treesitter', 'markdown', 'man' },
        open_automatic     = false,
        focus_on_jump      = false,
        layout             = { default_direction = 'right', placement = 'edge' },
        highlight_on_hover = true,
        autoscroll         = true,
      })
    end,
  },

  -- snacks.nvim (required by claudecode)
  { 'folke/snacks.nvim' },

  -- Copilot Chat for garbage code lmao
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      window = {
        layout = 'vertical',
        width  = 0.35,
        relative = 'editor',
        position = 'right',
      },
      auto_insert_mode = false,
      highlight_headers = true,
      separator = '---',
      show_folds = true,
    },
  },
}
