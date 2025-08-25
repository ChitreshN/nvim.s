require("chit.remap")
require("chit.set")
require("autoclose").setup()
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- File: init.lua

-- Set indentation for Haskell
vim.api.nvim_create_autocmd("FileType", {
  pattern = "haskell",
  callback = function()
    vim.opt_local.shiftwidth = 2  -- Indent size
    vim.opt_local.tabstop = 2     -- Tab size
    vim.opt_local.softtabstop = 2 -- Number of spaces when pressing <Tab>
    vim.opt_local.expandtab = true -- Use spaces instead of tabs
    vim.opt_local.colorcolumn = "80"
  end,
})

-- Save all unsaved buffers with <leader>bs
vim.keymap.set("n", "<leader>bs", function()
  vim.cmd("wa")  -- same as :wall
end, { desc = "Save all modified buffers" })

