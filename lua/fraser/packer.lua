-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

 use {
 'nvim-treesitter/nvim-treesitter',
  run = function()
       local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
       ts_update()
  end,
    }
  end)
