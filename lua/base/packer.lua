local function ensure_locale()
  local locale = os.getenv("LANG")
  if not locale or locale ~= "en_US.UTF-8" then
    os.setenv("LANG", "en_US.UTF-8")
    os.setenv("LC_ALL", "en_US.UTF-8")
  end
end
ensure_locale()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.8',
  	-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})


 use 'williamboman/mason-lspconfig.nvim'

 use {
        'williamboman/mason.nvim',
        run = ':MasonUpdate' -- Optional: to ensure Mason is up-to-date
 }
 use 'psf/black' 
 use 'neanias/everforest-nvim'
 use 'catppuccin/nvim'
 use 'projekt0n/github-nvim-theme'
 use 'Pocco81/AutoSave.nvim'
 use 'preservim/nerdtree'
 use 'ryanoasis/vim-devicons'
 use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
 }
 use 'nvim-tree/nvim-web-devicons'
 use 'dense-analysis/ale'
 use 'neovim/nvim-lspconfig'
 use {
      'L3MON4D3/LuaSnip',
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()  -- Optional config for loading snippets
      end
    }
 use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',    -- Buffer source
            'hrsh7th/cmp-path',      -- File path source
            'saadparwaiz1/cmp_luasnip' -- LuaSnip source for nvim-cmp
        }
    }
 use 'Vigemus/iron.nvim'
 use 'mfussenegger/nvim-dap'
 use 'rcarriga/nvim-dap-ui'
 use 'theHamsta/nvim-dap-virtual-text'
 use 'nvim-neotest/nvim-nio' 

end)

