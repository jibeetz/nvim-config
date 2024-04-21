local plugins = {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
		  "nvimtools/none-ls-extras.nvim",
	  },
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy"
  },
  {
    "tpope/vim-fugitive",
    cmd = "G"
  }
}

return plugins
