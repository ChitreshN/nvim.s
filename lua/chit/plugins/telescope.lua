return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },
      {
        "<C-p>",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Find git files",
      },
      {
        "<leader>fz",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("grep> ") })
        end,
        desc = "Grep for a prompted string",
      },
    },
    opts = {},
  },
}
