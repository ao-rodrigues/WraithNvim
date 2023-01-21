local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins_setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
 
  -- Lua functions that many plugins use
  use "nvim-lua/plenary.nvim"

  use "Mofiqul/vscode.nvim" -- Colorscheme
  
  use "christoomey/vim-tmux-navigator" -- Split window navigation
  use "szw/vim-maximizer" -- Maximizes & restores current window
  
  -- Essential plugins
  use "tpope/vim-surround"
  use "vim-scripts/ReplaceWithRegister"

  -- Ez commenting with gc
  use "numToStr/Comment.nvim"

  -- File explorer
  use "nvim-tree/nvim-tree.lua"

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- Fuzzy finder
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
  use {"nvim-telescope/telescope.nvim", branch = "0.1.x"}


  -- Autocompletion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  
  -- Managing & installing LSP servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- Configuring LSP servers
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use {"glepnir/lspsaga.nvim", branch = "main" }
  use "onsails/lspkind.nvim"



  if packer_bootstrap then
    require("packer").sync()
  end
end)
