return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
    vim.keymap.set("n", "sa", function()
      vim.lsp.buf.code_action({ filters = { include = { "source.addImport", "source.OrganizeImports" }, } })
    end, { desc = "Go: Organize Imports" })
  end,

  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "gopls", "jsonls", "yamlls", "dockerls", "docker_compose_language_service" },
      handlers = {
        function (server_name)
          require("lspconfig")[server_name].setup({})
        end,
      }
    }
  }
}
