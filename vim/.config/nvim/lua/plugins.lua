vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

    use {
      'rmagatti/auto-session',
      config = function()
        require("auto-session").setup {
          log_level = "error",
          auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        }
      end
    }

    use { 
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

	use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons'}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { 'nvim-telescope/telescope-file-browser.nvim' }

	use {
		'windwp/nvim-autopairs',
		config = function() require('nvim-autopairs').setup {} end
	}

	use ({ 
		'bluz71/vim-moonfly-colors', 
		branch = 'cterm-compat',
		config = function()
			vim.cmd('colorscheme moonfly')
		end
	})

	-- prettier
	use('neovim/nvim-lspconfig')
	use('jose-elias-alvarez/null-ls.nvim')
	use('MunifTanjim/prettier.nvim')

	use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},

		-- Snippets
		{'L3MON4D3/LuaSnip'},
		{'rafamadriz/friendly-snippets'},
	  }
	}

end)
