-- Parsers to install up front; every other language is installed on demand the
-- first time a buffer of that filetype is opened (the old `auto_install`).
local ensure_installed = {
  "c",
  "cpp",
  "javascript",
  "lua",
  "query",
  "rust",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- nvim-treesitter's main branch does not support lazy-loading
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({})
      ts.install(ensure_installed)

      local available ---@type table<string, true>?

      local function can_install(lang)
        if not available then
          available = {}
          for _, name in ipairs(ts.get_available()) do
            available[name] = true
          end
        end
        return available[lang] == true
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("chit_treesitter", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if not lang then
            return
          end

          local function start()
            if vim.api.nvim_buf_is_valid(args.buf) then
              pcall(vim.treesitter.start, args.buf, lang)
            end
          end

          if vim.list_contains(ts.get_installed("parsers"), lang) then
            start()
          elseif can_install(lang) then
            ts.install({ lang }):await(function(err)
              if not err then
                vim.schedule(start)
              end
            end)
          end
        end,
      })
    end,
  },
}
