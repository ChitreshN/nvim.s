return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      color_icons = true,
      default = true,
      -- Look icons up by filename first and only then by extension, so an
      -- extension-less file does not borrow an unrelated icon.
      strict = true,
      override = {
        zsh = { icon = "", color = "#428850", cterm_color = "65", name = "Zsh" },
      },
      override_by_filename = {
        [".gitignore"] = { icon = "", color = "#f1502f", name = "Gitignore" },
      },
      override_by_extension = {
        log = { icon = "", color = "#81e043", name = "Log" },
      },
      override_by_operating_system = {
        apple = { icon = "", color = "#A2AAAD", cterm_color = "248", name = "Apple" },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox",
        globalstatus = true,
        section_separators = "",
        component_separators = "|",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      tabline = {
        lualine_a = { { "tabs", mode = 1 } },
      },
      extensions = { "oil", "fugitive", "lazy", "mason" },
    },
  },
}
