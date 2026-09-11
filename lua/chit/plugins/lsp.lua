-- Servers installed and managed by mason
local mason_servers = {
  "lua_ls",
  "ts_ls", -- typescript-language-server
}

-- Servers expected on $PATH (toolchain-managed, not installed by mason)
local system_servers = {
  "clangd",
  "gopls",
  "hls",
  "rust_analyzer",
}

local function on_attach(_, bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, remap = false, desc = desc })
  end

  map("n", "K", function()
    vim.lsp.buf.hover({ border = "single" })
  end, "Hover documentation")
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "go", vim.lsp.buf.type_definition, "Go to type definition")
  map("n", "gr", vim.lsp.buf.references, "List references")
  map("n", "gs", vim.lsp.buf.signature_help, "Signature help")
  map("n", "gl", vim.diagnostic.open_float, "Show line diagnostics")

  map("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
  map({ "n", "x" }, "<F3>", function()
    vim.lsp.buf.format({ async = true })
  end, "Format buffer")
  map("n", "<F4>", vim.lsp.buf.code_action, "Code action")

  -- Deliberately reversed: [d jumps forward, ]d jumps back
  map("n", "[d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, "Next diagnostic")
  map("n", "]d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, "Previous diagnostic")

  map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace symbol")
  map("n", "<leader>vd", vim.diagnostic.open_float, "Show line diagnostics")
  map("n", "<leader>vca", vim.lsp.buf.code_action, "Code action")
  map("n", "<leader>vrr", vim.lsp.buf.references, "List references")
  map("n", "<leader>vrn", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<leader>f", function()
    vim.lsp.buf.format()
  end, "Format buffer")
  map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("chit_lsp_attach", { clear = true }),
        callback = function(args)
          on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
        end,
      })

      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        severity_sort = true,
        float = { border = "single", source = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "»",
          },
        },
      })

      -- Advertise nvim-cmp's extra completion capabilities to every server
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("hls", {
        filetypes = { "haskell", "lhaskell", "cabal" },
        settings = {
          haskell = {
            formattingProvider = "fourmolu",
          },
        },
      })

      -- Installs the mason-managed servers. Enabling is done explicitly below so
      -- that mason tools which happen to ship an LSP mode (stylua, ...) are not
      -- silently turned into language servers.
      require("mason-lspconfig").setup({
        ensure_installed = mason_servers,
        automatic_enable = false,
      })

      vim.lsp.enable(vim.list_extend(vim.deepcopy(mason_servers), system_servers))
    end,
  },
}
