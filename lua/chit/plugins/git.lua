return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Gclog", "Gedit" },
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    },
  },
}
