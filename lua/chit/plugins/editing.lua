return {
  { "m4xshen/autoclose.nvim", event = "InsertEnter", opts = {} },

  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeFocus" },
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
    },
  },

  -- Keeps a Session.vim up to date once :Obsess has been called
  { "tpope/vim-obsession", cmd = { "Obsess", "Obsession" } },
}
