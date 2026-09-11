return {
  {
    "stevearc/oil.nvim",
    -- Oil replaces netrw as the directory handler, so it has to be loaded
    -- before the first buffer is opened.
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      delete_to_trash = false,
      skip_confirm_for_simple_edits = false,
      keymaps = {
        -- Freed up for the harpoon navigation maps
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-R>"] = "actions.refresh",
      },
      view_options = {
        show_hidden = true,
        natural_order = false,
      },
    },
  },
}
