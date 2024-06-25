require("chit.remap")
require("chit.set")
vim.cmd.colorscheme "catppuccin"
require("autoclose").setup()
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
require'nvim-web-devicons'.get_icons()
