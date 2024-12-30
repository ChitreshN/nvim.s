vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
    use 'nvim-tree/nvim-web-devicons'
    use({
        "stevearc/oil.nvim",
   })
    use 'm4xshen/autoclose.nvim'
	use 'wbthomason/packer.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
    use ('theprimeagen/harpoon')
	use ('tpope/vim-fugitive')
    use 'mbbill/undotree'
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}
	use({
		"arsham/arshamiser.nvim",
		requires = {
			"arsham/arshlib.nvim",
			"famiu/feline.nvim",
			"rebelot/heirline.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			-- ignore any parts you don't want to use
			require("arshamiser.feliniser")
			-- or:
			-- require("arshamiser.heirliniser")

			_G.custom_foldtext = require("arshamiser.folding").foldtext
			vim.opt.foldtext = "v:lua.custom_foldtext()"
			-- if you want to draw a tabline:
			vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
		end,
	})
	use ('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use 'mfussenegger/nvim-jdtls'
    use {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-a>",
                    clear_suggestion = "<C-x>",
                    accept_word = "<C-s>",
                },
                ignore_filetypes = { cpp = true }, -- or { "cpp", }
                color = {
                    suggestion_color = "#ffffff",
                    cterm = 244,
                },
                log_level = "info", -- set to "off" to disable logging completely
                disable_inline_completion = false, -- disables inline completion for use with cmp
                disable_keymaps = false, -- disables built in keymaps for more manual control
                condition = function()
                    return false
                end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
            })
        end,
    }
    use '/home/chitreshnarra/nvim_plugins/remote.nvim'
end)

