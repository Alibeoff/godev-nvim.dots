return {
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
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